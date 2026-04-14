; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    glu32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __glu32_gen2_as__
#define __glu32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "glu32.dll"
; void gluBeginCurve(winmdroot.Graphics.OpenGL.GLUnurbs* nobj)
#func gluBeginCurve "gluBeginCurve" intptr

; void gluBeginPolygon(winmdroot.Graphics.OpenGL.GLUtesselator* tess)
#func gluBeginPolygon "gluBeginPolygon" intptr

; void gluBeginSurface(winmdroot.Graphics.OpenGL.GLUnurbs* nobj)
#func gluBeginSurface "gluBeginSurface" intptr

; void gluBeginTrim(winmdroot.Graphics.OpenGL.GLUnurbs* nobj)
#func gluBeginTrim "gluBeginTrim" intptr

; int gluBuild1DMipmaps(uint target, int components, int width, uint format, uint type, void* data)
#cfunc gluBuild1DMipmaps "gluBuild1DMipmaps" int, int, int, int, int, intptr

; int gluBuild2DMipmaps(uint target, int components, int width, int height, uint format, uint type, void* data)
#cfunc gluBuild2DMipmaps "gluBuild2DMipmaps" int, int, int, int, int, int, intptr

; void gluCylinder(winmdroot.Graphics.OpenGL.GLUquadric* qobj, double baseRadius, double topRadius, double height, int slices, int stacks)
#func gluCylinder "gluCylinder" intptr, double, double, double, int, int

; void gluDeleteNurbsRenderer(winmdroot.Graphics.OpenGL.GLUnurbs* nobj)
#func gluDeleteNurbsRenderer "gluDeleteNurbsRenderer" intptr

; void gluDeleteQuadric(winmdroot.Graphics.OpenGL.GLUquadric* state)
#func gluDeleteQuadric "gluDeleteQuadric" intptr

; void gluDeleteTess(winmdroot.Graphics.OpenGL.GLUtesselator* tess)
#func gluDeleteTess "gluDeleteTess" intptr

; void gluDisk(winmdroot.Graphics.OpenGL.GLUquadric* qobj, double innerRadius, double outerRadius, int slices, int loops)
#func gluDisk "gluDisk" intptr, double, double, int, int

; void gluEndCurve(winmdroot.Graphics.OpenGL.GLUnurbs* nobj)
#func gluEndCurve "gluEndCurve" intptr

; void gluEndPolygon(winmdroot.Graphics.OpenGL.GLUtesselator* tess)
#func gluEndPolygon "gluEndPolygon" intptr

; void gluEndSurface(winmdroot.Graphics.OpenGL.GLUnurbs* nobj)
#func gluEndSurface "gluEndSurface" intptr

; void gluEndTrim(winmdroot.Graphics.OpenGL.GLUnurbs* nobj)
#func gluEndTrim "gluEndTrim" intptr

; byte* gluErrorString(uint errCode)
#cfunc gluErrorString "gluErrorString" int

; winmdroot.Foundation.PCWSTR gluErrorUnicodeStringEXT(uint errCode)
#cfunc gluErrorUnicodeStringEXT "gluErrorUnicodeStringEXT" int

; void gluGetNurbsProperty(winmdroot.Graphics.OpenGL.GLUnurbs* nobj, uint property, float* value)
#func gluGetNurbsProperty "gluGetNurbsProperty" intptr, int, var

; byte* gluGetString(uint name)
#cfunc gluGetString "gluGetString" int

; void gluGetTessProperty(winmdroot.Graphics.OpenGL.GLUtesselator* tess, uint which, double* value)
#func gluGetTessProperty "gluGetTessProperty" intptr, int, var

; void gluLoadSamplingMatrices(winmdroot.Graphics.OpenGL.GLUnurbs* nobj, float* modelMatrix, float* projMatrix, int* viewport)
#func gluLoadSamplingMatrices "gluLoadSamplingMatrices" intptr, var, var, var

; void gluLookAt(double eyex, double eyey, double eyez, double centerx, double centery, double centerz, double upx, double upy, double upz)
#func gluLookAt "gluLookAt" double, double, double, double, double, double, double, double, double

; winmdroot.Graphics.OpenGL.GLUnurbs* gluNewNurbsRenderer()
#cfunc gluNewNurbsRenderer "gluNewNurbsRenderer"

; winmdroot.Graphics.OpenGL.GLUquadric* gluNewQuadric()
#cfunc gluNewQuadric "gluNewQuadric"

; winmdroot.Graphics.OpenGL.GLUtesselator* gluNewTess()
#cfunc gluNewTess "gluNewTess"

; void gluNextContour(winmdroot.Graphics.OpenGL.GLUtesselator* tess, uint type)
#func gluNextContour "gluNextContour" intptr, int

; void gluNurbsCallback(winmdroot.Graphics.OpenGL.GLUnurbs* nobj, uint which, nint fn)
#func gluNurbsCallback "gluNurbsCallback" intptr, int, int

; void gluNurbsCurve(winmdroot.Graphics.OpenGL.GLUnurbs* nobj, int nknots, float* knot, int stride, float* ctlarray, int order, uint type)
#func gluNurbsCurve "gluNurbsCurve" intptr, int, var, int, var, int, int

; void gluNurbsProperty(winmdroot.Graphics.OpenGL.GLUnurbs* nobj, uint property, float value)
#func gluNurbsProperty "gluNurbsProperty" intptr, int, float

; void gluNurbsSurface(winmdroot.Graphics.OpenGL.GLUnurbs* nobj, int sknot_count, float* sknot, int tknot_count, float* tknot, int s_stride, int t_stride, float* ctlarray, int sorder, int torder, uint type)
#func gluNurbsSurface "gluNurbsSurface" intptr, int, var, int, var, int, int, var, int, int, int

; void gluOrtho2D(double left, double right, double bottom, double top)
#func gluOrtho2D "gluOrtho2D" double, double, double, double

; void gluPartialDisk(winmdroot.Graphics.OpenGL.GLUquadric* qobj, double innerRadius, double outerRadius, int slices, int loops, double startAngle, double sweepAngle)
#func gluPartialDisk "gluPartialDisk" intptr, double, double, int, int, double, double

; void gluPerspective(double fovy, double aspect, double zNear, double zFar)
#func gluPerspective "gluPerspective" double, double, double, double

; void gluPickMatrix(double x, double y, double width, double height, int* viewport)
#func gluPickMatrix "gluPickMatrix" double, double, double, double, var

; int gluProject(double objx, double objy, double objz, double* modelMatrix, double* projMatrix, int* viewport, double* winx, double* winy, double* winz)
#cfunc gluProject "gluProject" double, double, double, var, var, var, var, var, var

; void gluPwlCurve(winmdroot.Graphics.OpenGL.GLUnurbs* nobj, int count, float* array, int stride, uint type)
#func gluPwlCurve "gluPwlCurve" intptr, int, var, int, int

; void gluQuadricCallback(winmdroot.Graphics.OpenGL.GLUquadric* qobj, uint which, nint fn)
#func gluQuadricCallback "gluQuadricCallback" intptr, int, int

; void gluQuadricDrawStyle(winmdroot.Graphics.OpenGL.GLUquadric* quadObject, uint drawStyle)
#func gluQuadricDrawStyle "gluQuadricDrawStyle" intptr, int

; void gluQuadricNormals(winmdroot.Graphics.OpenGL.GLUquadric* quadObject, uint normals)
#func gluQuadricNormals "gluQuadricNormals" intptr, int

; void gluQuadricOrientation(winmdroot.Graphics.OpenGL.GLUquadric* quadObject, uint orientation)
#func gluQuadricOrientation "gluQuadricOrientation" intptr, int

; void gluQuadricTexture(winmdroot.Graphics.OpenGL.GLUquadric* quadObject, byte textureCoords)
#func gluQuadricTexture "gluQuadricTexture" intptr, int

; int gluScaleImage(uint format, int widthin, int heightin, uint typein, void* datain, int widthout, int heightout, uint typeout, void* dataout)
#cfunc gluScaleImage "gluScaleImage" int, int, int, int, intptr, int, int, int, intptr

; void gluSphere(winmdroot.Graphics.OpenGL.GLUquadric* qobj, double radius, int slices, int stacks)
#func gluSphere "gluSphere" intptr, double, int, int

; void gluTessBeginContour(winmdroot.Graphics.OpenGL.GLUtesselator* tess)
#func gluTessBeginContour "gluTessBeginContour" intptr

; void gluTessBeginPolygon(winmdroot.Graphics.OpenGL.GLUtesselator* tess, void* polygon_data)
#func gluTessBeginPolygon "gluTessBeginPolygon" intptr, intptr

; void gluTessCallback(winmdroot.Graphics.OpenGL.GLUtesselator* tess, uint which, nint fn)
#func gluTessCallback "gluTessCallback" intptr, int, int

; void gluTessEndContour(winmdroot.Graphics.OpenGL.GLUtesselator* tess)
#func gluTessEndContour "gluTessEndContour" intptr

; void gluTessEndPolygon(winmdroot.Graphics.OpenGL.GLUtesselator* tess)
#func gluTessEndPolygon "gluTessEndPolygon" intptr

; void gluTessNormal(winmdroot.Graphics.OpenGL.GLUtesselator* tess, double x, double y, double z)
#func gluTessNormal "gluTessNormal" intptr, double, double, double

; void gluTessProperty(winmdroot.Graphics.OpenGL.GLUtesselator* tess, uint which, double value)
#func gluTessProperty "gluTessProperty" intptr, int, double

; void gluTessVertex(winmdroot.Graphics.OpenGL.GLUtesselator* tess, double* coords, void* data)
#func gluTessVertex "gluTessVertex" intptr, var, intptr

; int gluUnProject(double winx, double winy, double winz, double* modelMatrix, double* projMatrix, int* viewport, double* objx, double* objy, double* objz)
#cfunc gluUnProject "gluUnProject" double, double, double, var, var, var, var, var, var

#endif
