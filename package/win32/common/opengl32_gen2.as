; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    opengl32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __opengl32_gen2_as__
#define global __opengl32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "opengl32.dll"
; void glAccum(uint op, float value)
#func global glAccum "glAccum" int, float

; void glAlphaFunc(uint func, float @ref)
#func global glAlphaFunc "glAlphaFunc" int, int

; byte glAreTexturesResident(int n, uint* textures, byte* residences)
#cfunc global glAreTexturesResident "glAreTexturesResident" int, var, var

; void glArrayElement(int i)
#func global glArrayElement "glArrayElement" int

; void glBegin(uint mode)
#func global glBegin "glBegin" int

; void glBindTexture(uint target, uint texture)
#func global glBindTexture "glBindTexture" int, int

; void glBitmap(int width, int height, float xorig, float yorig, float xmove, float ymove, byte* bitmap)
#func global glBitmap "glBitmap" int, int, float, float, float, float, var

; void glBlendFunc(uint sfactor, uint dfactor)
#func global glBlendFunc "glBlendFunc" int, int

; void glCallList(uint list)
#func global glCallList "glCallList" int

; void glCallLists(int n, uint type, void* lists)
#func global glCallLists "glCallLists" int, int, intptr

; void glClear(uint mask)
#func global glClear "glClear" int

; void glClearAccum(float red, float green, float blue, float alpha)
#func global glClearAccum "glClearAccum" float, float, float, float

; void glClearColor(float red, float green, float blue, float alpha)
#func global glClearColor "glClearColor" float, float, float, float

; void glClearDepth(double depth)
#func global glClearDepth "glClearDepth" double

; void glClearIndex(float c)
#func global glClearIndex "glClearIndex" float

; void glClearStencil(int s)
#func global glClearStencil "glClearStencil" int

; void glClipPlane(uint plane, double* equation)
#func global glClipPlane "glClipPlane" int, var

; void glColor3b(sbyte red, sbyte green, sbyte blue)
#func global glColor3b "glColor3b" int, int, int

; void glColor3bv(sbyte* v)
#func global glColor3bv "glColor3bv" var

; void glColor3d(double red, double green, double blue)
#func global glColor3d "glColor3d" double, double, double

; void glColor3dv(double* v)
#func global glColor3dv "glColor3dv" var

; void glColor3f(float red, float green, float blue)
#func global glColor3f "glColor3f" float, float, float

; void glColor3fv(float* v)
#func global glColor3fv "glColor3fv" var

; void glColor3i(int red, int green, int blue)
#func global glColor3i "glColor3i" int, int, int

; void glColor3iv(int* v)
#func global glColor3iv "glColor3iv" var

; void glColor3s(short red, short green, short blue)
#func global glColor3s "glColor3s" int, int, int

; void glColor3sv(short* v)
#func global glColor3sv "glColor3sv" var

; void glColor3ub(byte red, byte green, byte blue)
#func global glColor3ub "glColor3ub" int, int, int

; void glColor3ubv(byte* v)
#func global glColor3ubv "glColor3ubv" var

; void glColor3ui(uint red, uint green, uint blue)
#func global glColor3ui "glColor3ui" int, int, int

; void glColor3uiv(uint* v)
#func global glColor3uiv "glColor3uiv" var

; void glColor3us(ushort red, ushort green, ushort blue)
#func global glColor3us "glColor3us" int, int, int

; void glColor3usv(ushort* v)
#func global glColor3usv "glColor3usv" var

; void glColor4b(sbyte red, sbyte green, sbyte blue, sbyte alpha)
#func global glColor4b "glColor4b" int, int, int, int

; void glColor4bv(sbyte* v)
#func global glColor4bv "glColor4bv" var

; void glColor4d(double red, double green, double blue, double alpha)
#func global glColor4d "glColor4d" double, double, double, double

; void glColor4dv(double* v)
#func global glColor4dv "glColor4dv" var

; void glColor4f(float red, float green, float blue, float alpha)
#func global glColor4f "glColor4f" float, float, float, float

; void glColor4fv(float* v)
#func global glColor4fv "glColor4fv" var

; void glColor4i(int red, int green, int blue, int alpha)
#func global glColor4i "glColor4i" int, int, int, int

; void glColor4iv(int* v)
#func global glColor4iv "glColor4iv" var

; void glColor4s(short red, short green, short blue, short alpha)
#func global glColor4s "glColor4s" int, int, int, int

; void glColor4sv(short* v)
#func global glColor4sv "glColor4sv" var

; void glColor4ub(byte red, byte green, byte blue, byte alpha)
#func global glColor4ub "glColor4ub" int, int, int, int

; void glColor4ubv(byte* v)
#func global glColor4ubv "glColor4ubv" var

; void glColor4ui(uint red, uint green, uint blue, uint alpha)
#func global glColor4ui "glColor4ui" int, int, int, int

; void glColor4uiv(uint* v)
#func global glColor4uiv "glColor4uiv" var

; void glColor4us(ushort red, ushort green, ushort blue, ushort alpha)
#func global glColor4us "glColor4us" int, int, int, int

; void glColor4usv(ushort* v)
#func global glColor4usv "glColor4usv" var

; void glColorMask(byte red, byte green, byte blue, byte alpha)
#func global glColorMask "glColorMask" int, int, int, int

; void glColorMaterial(uint face, uint mode)
#func global glColorMaterial "glColorMaterial" int, int

; void glColorPointer(int size, uint type, int stride, void* pointer)
#func global glColorPointer "glColorPointer" int, int, int, intptr

; void glCopyPixels(int x, int y, int width, int height, uint type)
#func global glCopyPixels "glCopyPixels" int, int, int, int, int

; void glCopyTexImage1D(uint target, int level, uint internalFormat, int x, int y, int width, int border)
#func global glCopyTexImage1D "glCopyTexImage1D" int, int, int, int, int, int, int

; void glCopyTexImage2D(uint target, int level, uint internalFormat, int x, int y, int width, int height, int border)
#func global glCopyTexImage2D "glCopyTexImage2D" int, int, int, int, int, int, int, int

; void glCopyTexSubImage1D(uint target, int level, int xoffset, int x, int y, int width)
#func global glCopyTexSubImage1D "glCopyTexSubImage1D" int, int, int, int, int, int

; void glCopyTexSubImage2D(uint target, int level, int xoffset, int yoffset, int x, int y, int width, int height)
#func global glCopyTexSubImage2D "glCopyTexSubImage2D" int, int, int, int, int, int, int, int

; void glCullFace(uint mode)
#func global glCullFace "glCullFace" int

; void glDeleteLists(uint list, int range)
#func global glDeleteLists "glDeleteLists" int, int

; void glDeleteTextures(int n, uint* textures)
#func global glDeleteTextures "glDeleteTextures" int, var

; void glDepthFunc(uint func)
#func global glDepthFunc "glDepthFunc" int

; void glDepthMask(byte flag)
#func global glDepthMask "glDepthMask" int

; void glDepthRange(double zNear, double zFar)
#func global glDepthRange "glDepthRange" double, double

; void glDisable(uint cap)
#func global glDisable "glDisable" int

; void glDisableClientState(uint array)
#func global glDisableClientState "glDisableClientState" int

; void glDrawArrays(uint mode, int first, int count)
#func global glDrawArrays "glDrawArrays" int, int, int

; void glDrawBuffer(uint mode)
#func global glDrawBuffer "glDrawBuffer" int

; void glDrawElements(uint mode, int count, uint type, void* indices)
#func global glDrawElements "glDrawElements" int, int, int, intptr

; void glDrawPixels(int width, int height, uint format, uint type, void* pixels)
#func global glDrawPixels "glDrawPixels" int, int, int, int, intptr

; void glEdgeFlag(byte flag)
#func global glEdgeFlag "glEdgeFlag" int

; void glEdgeFlagPointer(int stride, void* pointer)
#func global glEdgeFlagPointer "glEdgeFlagPointer" int, intptr

; void glEdgeFlagv(byte* flag)
#func global glEdgeFlagv "glEdgeFlagv" var

; void glEnable(uint cap)
#func global glEnable "glEnable" int

; void glEnableClientState(uint array)
#func global glEnableClientState "glEnableClientState" int

; void glEnd()
#func global glEnd "glEnd"

; void glEndList()
#func global glEndList "glEndList"

; void glEvalCoord1d(double u)
#func global glEvalCoord1d "glEvalCoord1d" double

; void glEvalCoord1dv(double* u)
#func global glEvalCoord1dv "glEvalCoord1dv" var

; void glEvalCoord1f(float u)
#func global glEvalCoord1f "glEvalCoord1f" float

; void glEvalCoord1fv(float* u)
#func global glEvalCoord1fv "glEvalCoord1fv" var

; void glEvalCoord2d(double u, double v)
#func global glEvalCoord2d "glEvalCoord2d" double, double

; void glEvalCoord2dv(double* u)
#func global glEvalCoord2dv "glEvalCoord2dv" var

; void glEvalCoord2f(float u, float v)
#func global glEvalCoord2f "glEvalCoord2f" float, float

; void glEvalCoord2fv(float* u)
#func global glEvalCoord2fv "glEvalCoord2fv" var

; void glEvalMesh1(uint mode, int i1, int i2)
#func global glEvalMesh1 "glEvalMesh1" int, int, int

; void glEvalMesh2(uint mode, int i1, int i2, int j1, int j2)
#func global glEvalMesh2 "glEvalMesh2" int, int, int, int, int

; void glEvalPoint1(int i)
#func global glEvalPoint1 "glEvalPoint1" int

; void glEvalPoint2(int i, int j)
#func global glEvalPoint2 "glEvalPoint2" int, int

; void glFeedbackBuffer(int size, uint type, float* buffer)
#func global glFeedbackBuffer "glFeedbackBuffer" int, int, var

; void glFinish()
#func global glFinish "glFinish"

; void glFlush()
#func global glFlush "glFlush"

; void glFogf(uint pname, float param1)
#func global glFogf "glFogf" int, float

; void glFogfv(uint pname, float* @params)
#func global glFogfv "glFogfv" int, int

; void glFogi(uint pname, int param1)
#func global glFogi "glFogi" int, int

; void glFogiv(uint pname, int* @params)
#func global glFogiv "glFogiv" int, int

; void glFrontFace(uint mode)
#func global glFrontFace "glFrontFace" int

; void glFrustum(double left, double right, double bottom, double top, double zNear, double zFar)
#func global glFrustum "glFrustum" double, double, double, double, double, double

; uint glGenLists(int range)
#cfunc global glGenLists "glGenLists" int

; void glGenTextures(int n, uint* textures)
#func global glGenTextures "glGenTextures" int, var

; void glGetBooleanv(uint pname, byte* @params)
#func global glGetBooleanv "glGetBooleanv" int, int

; void glGetClipPlane(uint plane, double* equation)
#func global glGetClipPlane "glGetClipPlane" int, var

; void glGetDoublev(uint pname, double* @params)
#func global glGetDoublev "glGetDoublev" int, int

; uint glGetError()
#cfunc global glGetError "glGetError"

; void glGetFloatv(uint pname, float* @params)
#func global glGetFloatv "glGetFloatv" int, int

; void glGetIntegerv(uint pname, int* @params)
#func global glGetIntegerv "glGetIntegerv" int, int

; void glGetLightfv(uint light, uint pname, float* @params)
#func global glGetLightfv "glGetLightfv" int, int, int

; void glGetLightiv(uint light, uint pname, int* @params)
#func global glGetLightiv "glGetLightiv" int, int, int

; void glGetMapdv(uint target, uint query, double* v)
#func global glGetMapdv "glGetMapdv" int, int, var

; void glGetMapfv(uint target, uint query, float* v)
#func global glGetMapfv "glGetMapfv" int, int, var

; void glGetMapiv(uint target, uint query, int* v)
#func global glGetMapiv "glGetMapiv" int, int, var

; void glGetMaterialfv(uint face, uint pname, float* @params)
#func global glGetMaterialfv "glGetMaterialfv" int, int, int

; void glGetMaterialiv(uint face, uint pname, int* @params)
#func global glGetMaterialiv "glGetMaterialiv" int, int, int

; void glGetPixelMapfv(uint map, float* values)
#func global glGetPixelMapfv "glGetPixelMapfv" int, var

; void glGetPixelMapuiv(uint map, uint* values)
#func global glGetPixelMapuiv "glGetPixelMapuiv" int, var

; void glGetPixelMapusv(uint map, ushort* values)
#func global glGetPixelMapusv "glGetPixelMapusv" int, var

; void glGetPointerv(uint pname, void** @params)
#func global glGetPointerv "glGetPointerv" int, int

; void glGetPolygonStipple(byte* mask)
#func global glGetPolygonStipple "glGetPolygonStipple" var

; byte* glGetString(uint name)
#cfunc global glGetString "glGetString" int

; void glGetTexEnvfv(uint target, uint pname, float* @params)
#func global glGetTexEnvfv "glGetTexEnvfv" int, int, int

; void glGetTexEnviv(uint target, uint pname, int* @params)
#func global glGetTexEnviv "glGetTexEnviv" int, int, int

; void glGetTexGendv(uint coord, uint pname, double* @params)
#func global glGetTexGendv "glGetTexGendv" int, int, int

; void glGetTexGenfv(uint coord, uint pname, float* @params)
#func global glGetTexGenfv "glGetTexGenfv" int, int, int

; void glGetTexGeniv(uint coord, uint pname, int* @params)
#func global glGetTexGeniv "glGetTexGeniv" int, int, int

; void glGetTexImage(uint target, int level, uint format, uint type, void* pixels)
#func global glGetTexImage "glGetTexImage" int, int, int, int, intptr

; void glGetTexLevelParameterfv(uint target, int level, uint pname, float* @params)
#func global glGetTexLevelParameterfv "glGetTexLevelParameterfv" int, int, int, int

; void glGetTexLevelParameteriv(uint target, int level, uint pname, int* @params)
#func global glGetTexLevelParameteriv "glGetTexLevelParameteriv" int, int, int, int

; void glGetTexParameterfv(uint target, uint pname, float* @params)
#func global glGetTexParameterfv "glGetTexParameterfv" int, int, int

; void glGetTexParameteriv(uint target, uint pname, int* @params)
#func global glGetTexParameteriv "glGetTexParameteriv" int, int, int

; void glHint(uint target, uint mode)
#func global glHint "glHint" int, int

; void glIndexMask(uint mask)
#func global glIndexMask "glIndexMask" int

; void glIndexPointer(uint type, int stride, void* pointer)
#func global glIndexPointer "glIndexPointer" int, int, intptr

; void glIndexd(double c)
#func global glIndexd "glIndexd" double

; void glIndexdv(double* c)
#func global glIndexdv "glIndexdv" var

; void glIndexf(float c)
#func global glIndexf "glIndexf" float

; void glIndexfv(float* c)
#func global glIndexfv "glIndexfv" var

; void glIndexi(int c)
#func global glIndexi "glIndexi" int

; void glIndexiv(int* c)
#func global glIndexiv "glIndexiv" var

; void glIndexs(short c)
#func global glIndexs "glIndexs" int

; void glIndexsv(short* c)
#func global glIndexsv "glIndexsv" var

; void glIndexub(byte c)
#func global glIndexub "glIndexub" int

; void glIndexubv(byte* c)
#func global glIndexubv "glIndexubv" var

; void glInitNames()
#func global glInitNames "glInitNames"

; void glInterleavedArrays(uint format, int stride, void* pointer)
#func global glInterleavedArrays "glInterleavedArrays" int, int, intptr

; byte glIsEnabled(uint cap)
#cfunc global glIsEnabled "glIsEnabled" int

; byte glIsList(uint list)
#cfunc global glIsList "glIsList" int

; byte glIsTexture(uint texture)
#cfunc global glIsTexture "glIsTexture" int

; void glLightModelf(uint pname, float param1)
#func global glLightModelf "glLightModelf" int, float

; void glLightModelfv(uint pname, float* @params)
#func global glLightModelfv "glLightModelfv" int, int

; void glLightModeli(uint pname, int param1)
#func global glLightModeli "glLightModeli" int, int

; void glLightModeliv(uint pname, int* @params)
#func global glLightModeliv "glLightModeliv" int, int

; void glLightf(uint light, uint pname, float param2)
#func global glLightf "glLightf" int, int, float

; void glLightfv(uint light, uint pname, float* @params)
#func global glLightfv "glLightfv" int, int, int

; void glLighti(uint light, uint pname, int param2)
#func global glLighti "glLighti" int, int, int

; void glLightiv(uint light, uint pname, int* @params)
#func global glLightiv "glLightiv" int, int, int

; void glLineStipple(int factor, ushort pattern)
#func global glLineStipple "glLineStipple" int, int

; void glLineWidth(float width)
#func global glLineWidth "glLineWidth" float

; void glListBase(uint @base)
#func global glListBase "glListBase" int

; void glLoadIdentity()
#func global glLoadIdentity "glLoadIdentity"

; void glLoadMatrixd(double* m)
#func global glLoadMatrixd "glLoadMatrixd" var

; void glLoadMatrixf(float* m)
#func global glLoadMatrixf "glLoadMatrixf" var

; void glLoadName(uint name)
#func global glLoadName "glLoadName" int

; void glLogicOp(uint opcode)
#func global glLogicOp "glLogicOp" int

; void glMap1d(uint target, double u1, double u2, int stride, int order, double* points)
#func global glMap1d "glMap1d" int, double, double, int, int, var

; void glMap1f(uint target, float u1, float u2, int stride, int order, float* points)
#func global glMap1f "glMap1f" int, float, float, int, int, var

; void glMap2d(uint target, double u1, double u2, int ustride, int uorder, double v1, double v2, int vstride, int vorder, double* points)
#func global glMap2d "glMap2d" int, double, double, int, int, double, double, int, int, var

; void glMap2f(uint target, float u1, float u2, int ustride, int uorder, float v1, float v2, int vstride, int vorder, float* points)
#func global glMap2f "glMap2f" int, float, float, int, int, float, float, int, int, var

; void glMapGrid1d(int un, double u1, double u2)
#func global glMapGrid1d "glMapGrid1d" int, double, double

; void glMapGrid1f(int un, float u1, float u2)
#func global glMapGrid1f "glMapGrid1f" int, float, float

; void glMapGrid2d(int un, double u1, double u2, int vn, double v1, double v2)
#func global glMapGrid2d "glMapGrid2d" int, double, double, int, double, double

; void glMapGrid2f(int un, float u1, float u2, int vn, float v1, float v2)
#func global glMapGrid2f "glMapGrid2f" int, float, float, int, float, float

; void glMaterialf(uint face, uint pname, float param2)
#func global glMaterialf "glMaterialf" int, int, float

; void glMaterialfv(uint face, uint pname, float* @params)
#func global glMaterialfv "glMaterialfv" int, int, int

; void glMateriali(uint face, uint pname, int param2)
#func global glMateriali "glMateriali" int, int, int

; void glMaterialiv(uint face, uint pname, int* @params)
#func global glMaterialiv "glMaterialiv" int, int, int

; void glMatrixMode(uint mode)
#func global glMatrixMode "glMatrixMode" int

; void glMultMatrixd(double* m)
#func global glMultMatrixd "glMultMatrixd" var

; void glMultMatrixf(float* m)
#func global glMultMatrixf "glMultMatrixf" var

; void glNewList(uint list, uint mode)
#func global glNewList "glNewList" int, int

; void glNormal3b(sbyte nx, sbyte ny, sbyte nz)
#func global glNormal3b "glNormal3b" int, int, int

; void glNormal3bv(sbyte* v)
#func global glNormal3bv "glNormal3bv" var

; void glNormal3d(double nx, double ny, double nz)
#func global glNormal3d "glNormal3d" double, double, double

; void glNormal3dv(double* v)
#func global glNormal3dv "glNormal3dv" var

; void glNormal3f(float nx, float ny, float nz)
#func global glNormal3f "glNormal3f" float, float, float

; void glNormal3fv(float* v)
#func global glNormal3fv "glNormal3fv" var

; void glNormal3i(int nx, int ny, int nz)
#func global glNormal3i "glNormal3i" int, int, int

; void glNormal3iv(int* v)
#func global glNormal3iv "glNormal3iv" var

; void glNormal3s(short nx, short ny, short nz)
#func global glNormal3s "glNormal3s" int, int, int

; void glNormal3sv(short* v)
#func global glNormal3sv "glNormal3sv" var

; void glNormalPointer(uint type, int stride, void* pointer)
#func global glNormalPointer "glNormalPointer" int, int, intptr

; void glOrtho(double left, double right, double bottom, double top, double zNear, double zFar)
#func global glOrtho "glOrtho" double, double, double, double, double, double

; void glPassThrough(float token)
#func global glPassThrough "glPassThrough" float

; void glPixelMapfv(uint map, int mapsize, float* values)
#func global glPixelMapfv "glPixelMapfv" int, int, var

; void glPixelMapuiv(uint map, int mapsize, uint* values)
#func global glPixelMapuiv "glPixelMapuiv" int, int, var

; void glPixelMapusv(uint map, int mapsize, ushort* values)
#func global glPixelMapusv "glPixelMapusv" int, int, var

; void glPixelStoref(uint pname, float param1)
#func global glPixelStoref "glPixelStoref" int, float

; void glPixelStorei(uint pname, int param1)
#func global glPixelStorei "glPixelStorei" int, int

; void glPixelTransferf(uint pname, float param1)
#func global glPixelTransferf "glPixelTransferf" int, float

; void glPixelTransferi(uint pname, int param1)
#func global glPixelTransferi "glPixelTransferi" int, int

; void glPixelZoom(float xfactor, float yfactor)
#func global glPixelZoom "glPixelZoom" float, float

; void glPointSize(float size)
#func global glPointSize "glPointSize" float

; void glPolygonMode(uint face, uint mode)
#func global glPolygonMode "glPolygonMode" int, int

; void glPolygonOffset(float factor, float units)
#func global glPolygonOffset "glPolygonOffset" float, float

; void glPolygonStipple(byte* mask)
#func global glPolygonStipple "glPolygonStipple" var

; void glPopAttrib()
#func global glPopAttrib "glPopAttrib"

; void glPopClientAttrib()
#func global glPopClientAttrib "glPopClientAttrib"

; void glPopMatrix()
#func global glPopMatrix "glPopMatrix"

; void glPopName()
#func global glPopName "glPopName"

; void glPrioritizeTextures(int n, uint* textures, float* priorities)
#func global glPrioritizeTextures "glPrioritizeTextures" int, var, var

; void glPushAttrib(uint mask)
#func global glPushAttrib "glPushAttrib" int

; void glPushClientAttrib(uint mask)
#func global glPushClientAttrib "glPushClientAttrib" int

; void glPushMatrix()
#func global glPushMatrix "glPushMatrix"

; void glPushName(uint name)
#func global glPushName "glPushName" int

; void glRasterPos2d(double x, double y)
#func global glRasterPos2d "glRasterPos2d" double, double

; void glRasterPos2dv(double* v)
#func global glRasterPos2dv "glRasterPos2dv" var

; void glRasterPos2f(float x, float y)
#func global glRasterPos2f "glRasterPos2f" float, float

; void glRasterPos2fv(float* v)
#func global glRasterPos2fv "glRasterPos2fv" var

; void glRasterPos2i(int x, int y)
#func global glRasterPos2i "glRasterPos2i" int, int

; void glRasterPos2iv(int* v)
#func global glRasterPos2iv "glRasterPos2iv" var

; void glRasterPos2s(short x, short y)
#func global glRasterPos2s "glRasterPos2s" int, int

; void glRasterPos2sv(short* v)
#func global glRasterPos2sv "glRasterPos2sv" var

; void glRasterPos3d(double x, double y, double z)
#func global glRasterPos3d "glRasterPos3d" double, double, double

; void glRasterPos3dv(double* v)
#func global glRasterPos3dv "glRasterPos3dv" var

; void glRasterPos3f(float x, float y, float z)
#func global glRasterPos3f "glRasterPos3f" float, float, float

; void glRasterPos3fv(float* v)
#func global glRasterPos3fv "glRasterPos3fv" var

; void glRasterPos3i(int x, int y, int z)
#func global glRasterPos3i "glRasterPos3i" int, int, int

; void glRasterPos3iv(int* v)
#func global glRasterPos3iv "glRasterPos3iv" var

; void glRasterPos3s(short x, short y, short z)
#func global glRasterPos3s "glRasterPos3s" int, int, int

; void glRasterPos3sv(short* v)
#func global glRasterPos3sv "glRasterPos3sv" var

; void glRasterPos4d(double x, double y, double z, double w)
#func global glRasterPos4d "glRasterPos4d" double, double, double, double

; void glRasterPos4dv(double* v)
#func global glRasterPos4dv "glRasterPos4dv" var

; void glRasterPos4f(float x, float y, float z, float w)
#func global glRasterPos4f "glRasterPos4f" float, float, float, float

; void glRasterPos4fv(float* v)
#func global glRasterPos4fv "glRasterPos4fv" var

; void glRasterPos4i(int x, int y, int z, int w)
#func global glRasterPos4i "glRasterPos4i" int, int, int, int

; void glRasterPos4iv(int* v)
#func global glRasterPos4iv "glRasterPos4iv" var

; void glRasterPos4s(short x, short y, short z, short w)
#func global glRasterPos4s "glRasterPos4s" int, int, int, int

; void glRasterPos4sv(short* v)
#func global glRasterPos4sv "glRasterPos4sv" var

; void glReadBuffer(uint mode)
#func global glReadBuffer "glReadBuffer" int

; void glReadPixels(int x, int y, int width, int height, uint format, uint type, void* pixels)
#func global glReadPixels "glReadPixels" int, int, int, int, int, int, intptr

; void glRectd(double x1, double y1, double x2, double y2)
#func global glRectd "glRectd" double, double, double, double

; void glRectdv(double* v1, double* v2)
#func global glRectdv "glRectdv" var, var

; void glRectf(float x1, float y1, float x2, float y2)
#func global glRectf "glRectf" float, float, float, float

; void glRectfv(float* v1, float* v2)
#func global glRectfv "glRectfv" var, var

; void glRecti(int x1, int y1, int x2, int y2)
#func global glRecti "glRecti" int, int, int, int

; void glRectiv(int* v1, int* v2)
#func global glRectiv "glRectiv" var, var

; void glRects(short x1, short y1, short x2, short y2)
#func global glRects "glRects" int, int, int, int

; void glRectsv(short* v1, short* v2)
#func global glRectsv "glRectsv" var, var

; int glRenderMode(uint mode)
#cfunc global glRenderMode "glRenderMode" int

; void glRotated(double angle, double x, double y, double z)
#func global glRotated "glRotated" double, double, double, double

; void glRotatef(float angle, float x, float y, float z)
#func global glRotatef "glRotatef" float, float, float, float

; void glScaled(double x, double y, double z)
#func global glScaled "glScaled" double, double, double

; void glScalef(float x, float y, float z)
#func global glScalef "glScalef" float, float, float

; void glScissor(int x, int y, int width, int height)
#func global glScissor "glScissor" int, int, int, int

; void glSelectBuffer(int size, uint* buffer)
#func global glSelectBuffer "glSelectBuffer" int, var

; void glShadeModel(uint mode)
#func global glShadeModel "glShadeModel" int

; void glStencilFunc(uint func, int @ref, uint mask)
#func global glStencilFunc "glStencilFunc" int, int, int

; void glStencilMask(uint mask)
#func global glStencilMask "glStencilMask" int

; void glStencilOp(uint fail, uint zfail, uint zpass)
#func global glStencilOp "glStencilOp" int, int, int

; void glTexCoord1d(double s)
#func global glTexCoord1d "glTexCoord1d" double

; void glTexCoord1dv(double* v)
#func global glTexCoord1dv "glTexCoord1dv" var

; void glTexCoord1f(float s)
#func global glTexCoord1f "glTexCoord1f" float

; void glTexCoord1fv(float* v)
#func global glTexCoord1fv "glTexCoord1fv" var

; void glTexCoord1i(int s)
#func global glTexCoord1i "glTexCoord1i" int

; void glTexCoord1iv(int* v)
#func global glTexCoord1iv "glTexCoord1iv" var

; void glTexCoord1s(short s)
#func global glTexCoord1s "glTexCoord1s" int

; void glTexCoord1sv(short* v)
#func global glTexCoord1sv "glTexCoord1sv" var

; void glTexCoord2d(double s, double t)
#func global glTexCoord2d "glTexCoord2d" double, double

; void glTexCoord2dv(double* v)
#func global glTexCoord2dv "glTexCoord2dv" var

; void glTexCoord2f(float s, float t)
#func global glTexCoord2f "glTexCoord2f" float, float

; void glTexCoord2fv(float* v)
#func global glTexCoord2fv "glTexCoord2fv" var

; void glTexCoord2i(int s, int t)
#func global glTexCoord2i "glTexCoord2i" int, int

; void glTexCoord2iv(int* v)
#func global glTexCoord2iv "glTexCoord2iv" var

; void glTexCoord2s(short s, short t)
#func global glTexCoord2s "glTexCoord2s" int, int

; void glTexCoord2sv(short* v)
#func global glTexCoord2sv "glTexCoord2sv" var

; void glTexCoord3d(double s, double t, double r)
#func global glTexCoord3d "glTexCoord3d" double, double, double

; void glTexCoord3dv(double* v)
#func global glTexCoord3dv "glTexCoord3dv" var

; void glTexCoord3f(float s, float t, float r)
#func global glTexCoord3f "glTexCoord3f" float, float, float

; void glTexCoord3fv(float* v)
#func global glTexCoord3fv "glTexCoord3fv" var

; void glTexCoord3i(int s, int t, int r)
#func global glTexCoord3i "glTexCoord3i" int, int, int

; void glTexCoord3iv(int* v)
#func global glTexCoord3iv "glTexCoord3iv" var

; void glTexCoord3s(short s, short t, short r)
#func global glTexCoord3s "glTexCoord3s" int, int, int

; void glTexCoord3sv(short* v)
#func global glTexCoord3sv "glTexCoord3sv" var

; void glTexCoord4d(double s, double t, double r, double q)
#func global glTexCoord4d "glTexCoord4d" double, double, double, double

; void glTexCoord4dv(double* v)
#func global glTexCoord4dv "glTexCoord4dv" var

; void glTexCoord4f(float s, float t, float r, float q)
#func global glTexCoord4f "glTexCoord4f" float, float, float, float

; void glTexCoord4fv(float* v)
#func global glTexCoord4fv "glTexCoord4fv" var

; void glTexCoord4i(int s, int t, int r, int q)
#func global glTexCoord4i "glTexCoord4i" int, int, int, int

; void glTexCoord4iv(int* v)
#func global glTexCoord4iv "glTexCoord4iv" var

; void glTexCoord4s(short s, short t, short r, short q)
#func global glTexCoord4s "glTexCoord4s" int, int, int, int

; void glTexCoord4sv(short* v)
#func global glTexCoord4sv "glTexCoord4sv" var

; void glTexCoordPointer(int size, uint type, int stride, void* pointer)
#func global glTexCoordPointer "glTexCoordPointer" int, int, int, intptr

; void glTexEnvf(uint target, uint pname, float param2)
#func global glTexEnvf "glTexEnvf" int, int, float

; void glTexEnvfv(uint target, uint pname, float* @params)
#func global glTexEnvfv "glTexEnvfv" int, int, int

; void glTexEnvi(uint target, uint pname, int param2)
#func global glTexEnvi "glTexEnvi" int, int, int

; void glTexEnviv(uint target, uint pname, int* @params)
#func global glTexEnviv "glTexEnviv" int, int, int

; void glTexGend(uint coord, uint pname, double param2)
#func global glTexGend "glTexGend" int, int, double

; void glTexGendv(uint coord, uint pname, double* @params)
#func global glTexGendv "glTexGendv" int, int, int

; void glTexGenf(uint coord, uint pname, float param2)
#func global glTexGenf "glTexGenf" int, int, float

; void glTexGenfv(uint coord, uint pname, float* @params)
#func global glTexGenfv "glTexGenfv" int, int, int

; void glTexGeni(uint coord, uint pname, int param2)
#func global glTexGeni "glTexGeni" int, int, int

; void glTexGeniv(uint coord, uint pname, int* @params)
#func global glTexGeniv "glTexGeniv" int, int, int

; void glTexImage1D(uint target, int level, int internalformat, int width, int border, uint format, uint type, void* pixels)
#func global glTexImage1D "glTexImage1D" int, int, int, int, int, int, int, intptr

; void glTexImage2D(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, void* pixels)
#func global glTexImage2D "glTexImage2D" int, int, int, int, int, int, int, int, intptr

; void glTexParameterf(uint target, uint pname, float param2)
#func global glTexParameterf "glTexParameterf" int, int, float

; void glTexParameterfv(uint target, uint pname, float* @params)
#func global glTexParameterfv "glTexParameterfv" int, int, int

; void glTexParameteri(uint target, uint pname, int param2)
#func global glTexParameteri "glTexParameteri" int, int, int

; void glTexParameteriv(uint target, uint pname, int* @params)
#func global glTexParameteriv "glTexParameteriv" int, int, int

; void glTexSubImage1D(uint target, int level, int xoffset, int width, uint format, uint type, void* pixels)
#func global glTexSubImage1D "glTexSubImage1D" int, int, int, int, int, int, intptr

; void glTexSubImage2D(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, void* pixels)
#func global glTexSubImage2D "glTexSubImage2D" int, int, int, int, int, int, int, int, intptr

; void glTranslated(double x, double y, double z)
#func global glTranslated "glTranslated" double, double, double

; void glTranslatef(float x, float y, float z)
#func global glTranslatef "glTranslatef" float, float, float

; void glVertex2d(double x, double y)
#func global glVertex2d "glVertex2d" double, double

; void glVertex2dv(double* v)
#func global glVertex2dv "glVertex2dv" var

; void glVertex2f(float x, float y)
#func global glVertex2f "glVertex2f" float, float

; void glVertex2fv(float* v)
#func global glVertex2fv "glVertex2fv" var

; void glVertex2i(int x, int y)
#func global glVertex2i "glVertex2i" int, int

; void glVertex2iv(int* v)
#func global glVertex2iv "glVertex2iv" var

; void glVertex2s(short x, short y)
#func global glVertex2s "glVertex2s" int, int

; void glVertex2sv(short* v)
#func global glVertex2sv "glVertex2sv" var

; void glVertex3d(double x, double y, double z)
#func global glVertex3d "glVertex3d" double, double, double

; void glVertex3dv(double* v)
#func global glVertex3dv "glVertex3dv" var

; void glVertex3f(float x, float y, float z)
#func global glVertex3f "glVertex3f" float, float, float

; void glVertex3fv(float* v)
#func global glVertex3fv "glVertex3fv" var

; void glVertex3i(int x, int y, int z)
#func global glVertex3i "glVertex3i" int, int, int

; void glVertex3iv(int* v)
#func global glVertex3iv "glVertex3iv" var

; void glVertex3s(short x, short y, short z)
#func global glVertex3s "glVertex3s" int, int, int

; void glVertex3sv(short* v)
#func global glVertex3sv "glVertex3sv" var

; void glVertex4d(double x, double y, double z, double w)
#func global glVertex4d "glVertex4d" double, double, double, double

; void glVertex4dv(double* v)
#func global glVertex4dv "glVertex4dv" var

; void glVertex4f(float x, float y, float z, float w)
#func global glVertex4f "glVertex4f" float, float, float, float

; void glVertex4fv(float* v)
#func global glVertex4fv "glVertex4fv" var

; void glVertex4i(int x, int y, int z, int w)
#func global glVertex4i "glVertex4i" int, int, int, int

; void glVertex4iv(int* v)
#func global glVertex4iv "glVertex4iv" var

; void glVertex4s(short x, short y, short z, short w)
#func global glVertex4s "glVertex4s" int, int, int, int

; void glVertex4sv(short* v)
#func global glVertex4sv "glVertex4sv" var

; void glVertexPointer(int size, uint type, int stride, void* pointer)
#func global glVertexPointer "glVertexPointer" int, int, int, intptr

; void glViewport(int x, int y, int width, int height)
#func global glViewport "glViewport" int, int, int, int

; winmdroot.Foundation.BOOL wglDeleteContext(winmdroot.Graphics.OpenGL.HGLRC param0)
#cfunc global wglDeleteContext "wglDeleteContext" intptr

; winmdroot.Foundation.BOOL wglCopyContext(winmdroot.Graphics.OpenGL.HGLRC param0, winmdroot.Graphics.OpenGL.HGLRC param1, uint param2)
#cfunc global wglCopyContext "wglCopyContext" intptr, intptr, int

; winmdroot.Graphics.OpenGL.HGLRC wglCreateContext(winmdroot.Graphics.Gdi.HDC param0)
#cfunc global wglCreateContext "wglCreateContext" intptr

; winmdroot.Graphics.OpenGL.HGLRC wglCreateLayerContext(winmdroot.Graphics.Gdi.HDC param0, int param1)
#cfunc global wglCreateLayerContext "wglCreateLayerContext" intptr, int

; winmdroot.Foundation.BOOL wglDescribeLayerPlane(winmdroot.Graphics.Gdi.HDC param0, int param1, int param2, uint param3, winmdroot.Graphics.OpenGL.LAYERPLANEDESCRIPTOR* param4)
#cfunc global wglDescribeLayerPlane "wglDescribeLayerPlane" intptr, int, int, int, var

; winmdroot.Graphics.OpenGL.HGLRC wglGetCurrentContext()
#cfunc global wglGetCurrentContext "wglGetCurrentContext"

; winmdroot.Graphics.Gdi.HDC wglGetCurrentDC()
#cfunc global wglGetCurrentDC "wglGetCurrentDC"

; int wglGetLayerPaletteEntries(winmdroot.Graphics.Gdi.HDC param0, int param1, int param2, int param3, winmdroot.Foundation.COLORREF* param4)
#cfunc global wglGetLayerPaletteEntries "wglGetLayerPaletteEntries" intptr, int, int, int, var

; winmdroot.Foundation.PROC wglGetProcAddress(winmdroot.Foundation.PCSTR param0)
#cfunc global wglGetProcAddress "wglGetProcAddress" str

; winmdroot.Foundation.BOOL wglMakeCurrent(winmdroot.Graphics.Gdi.HDC param0, winmdroot.Graphics.OpenGL.HGLRC param1)
#cfunc global wglMakeCurrent "wglMakeCurrent" intptr, intptr

; winmdroot.Foundation.BOOL wglRealizeLayerPalette(winmdroot.Graphics.Gdi.HDC param0, int param1, winmdroot.Foundation.BOOL param2)
#cfunc global wglRealizeLayerPalette "wglRealizeLayerPalette" intptr, int, int

; int wglSetLayerPaletteEntries(winmdroot.Graphics.Gdi.HDC param0, int param1, int param2, int param3, winmdroot.Foundation.COLORREF* param4)
#cfunc global wglSetLayerPaletteEntries "wglSetLayerPaletteEntries" intptr, int, int, int, var

; winmdroot.Foundation.BOOL wglShareLists(winmdroot.Graphics.OpenGL.HGLRC param0, winmdroot.Graphics.OpenGL.HGLRC param1)
#cfunc global wglShareLists "wglShareLists" intptr, intptr

; winmdroot.Foundation.BOOL wglSwapLayerBuffers(winmdroot.Graphics.Gdi.HDC param0, uint param1)
#cfunc global wglSwapLayerBuffers "wglSwapLayerBuffers" intptr, int

; uint wglSwapMultipleBuffers(uint param0, winmdroot.Graphics.Gdi.WGLSWAP* param1)
#cfunc global wglSwapMultipleBuffers "wglSwapMultipleBuffers" int, var

; winmdroot.Foundation.BOOL wglUseFontBitmaps(winmdroot.Graphics.Gdi.HDC param0, uint param1, uint param2, uint param3)
#cfunc global wglUseFontBitmapsW "wglUseFontBitmapsW" intptr, int, int, int

; winmdroot.Foundation.BOOL wglUseFontOutlines(winmdroot.Graphics.Gdi.HDC param0, uint param1, uint param2, uint param3, float param4, float param5, int param6, winmdroot.Graphics.OpenGL.GLYPHMETRICSFLOAT* param7)
#cfunc global wglUseFontOutlinesW "wglUseFontOutlinesW" intptr, int, int, int, float, float, int, var

#endif
