; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    opengl32.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __opengl32_gen2_as__
#define __opengl32_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "opengl32.dll"
; void glAccum(uint op, float value)
#func glAccum "glAccum" int, float

; void glAlphaFunc(uint func, float @ref)
#func glAlphaFunc "glAlphaFunc" int, int

; byte glAreTexturesResident(int n, uint* textures, byte* residences)
#cfunc glAreTexturesResident "glAreTexturesResident" int, var, var

; void glArrayElement(int i)
#func glArrayElement "glArrayElement" int

; void glBegin(uint mode)
#func glBegin "glBegin" int

; void glBindTexture(uint target, uint texture)
#func glBindTexture "glBindTexture" int, int

; void glBitmap(int width, int height, float xorig, float yorig, float xmove, float ymove, byte* bitmap)
#func glBitmap "glBitmap" int, int, float, float, float, float, var

; void glBlendFunc(uint sfactor, uint dfactor)
#func glBlendFunc "glBlendFunc" int, int

; void glCallList(uint list)
#func glCallList "glCallList" int

; void glCallLists(int n, uint type, void* lists)
#func glCallLists "glCallLists" int, int, intptr

; void glClear(uint mask)
#func glClear "glClear" int

; void glClearAccum(float red, float green, float blue, float alpha)
#func glClearAccum "glClearAccum" float, float, float, float

; void glClearColor(float red, float green, float blue, float alpha)
#func glClearColor "glClearColor" float, float, float, float

; void glClearDepth(double depth)
#func glClearDepth "glClearDepth" double

; void glClearIndex(float c)
#func glClearIndex "glClearIndex" float

; void glClearStencil(int s)
#func glClearStencil "glClearStencil" int

; void glClipPlane(uint plane, double* equation)
#func glClipPlane "glClipPlane" int, var

; void glColor3b(sbyte red, sbyte green, sbyte blue)
#func glColor3b "glColor3b" int, int, int

; void glColor3bv(sbyte* v)
#func glColor3bv "glColor3bv" var

; void glColor3d(double red, double green, double blue)
#func glColor3d "glColor3d" double, double, double

; void glColor3dv(double* v)
#func glColor3dv "glColor3dv" var

; void glColor3f(float red, float green, float blue)
#func glColor3f "glColor3f" float, float, float

; void glColor3fv(float* v)
#func glColor3fv "glColor3fv" var

; void glColor3i(int red, int green, int blue)
#func glColor3i "glColor3i" int, int, int

; void glColor3iv(int* v)
#func glColor3iv "glColor3iv" var

; void glColor3s(short red, short green, short blue)
#func glColor3s "glColor3s" int, int, int

; void glColor3sv(short* v)
#func glColor3sv "glColor3sv" var

; void glColor3ub(byte red, byte green, byte blue)
#func glColor3ub "glColor3ub" int, int, int

; void glColor3ubv(byte* v)
#func glColor3ubv "glColor3ubv" var

; void glColor3ui(uint red, uint green, uint blue)
#func glColor3ui "glColor3ui" int, int, int

; void glColor3uiv(uint* v)
#func glColor3uiv "glColor3uiv" var

; void glColor3us(ushort red, ushort green, ushort blue)
#func glColor3us "glColor3us" int, int, int

; void glColor3usv(ushort* v)
#func glColor3usv "glColor3usv" var

; void glColor4b(sbyte red, sbyte green, sbyte blue, sbyte alpha)
#func glColor4b "glColor4b" int, int, int, int

; void glColor4bv(sbyte* v)
#func glColor4bv "glColor4bv" var

; void glColor4d(double red, double green, double blue, double alpha)
#func glColor4d "glColor4d" double, double, double, double

; void glColor4dv(double* v)
#func glColor4dv "glColor4dv" var

; void glColor4f(float red, float green, float blue, float alpha)
#func glColor4f "glColor4f" float, float, float, float

; void glColor4fv(float* v)
#func glColor4fv "glColor4fv" var

; void glColor4i(int red, int green, int blue, int alpha)
#func glColor4i "glColor4i" int, int, int, int

; void glColor4iv(int* v)
#func glColor4iv "glColor4iv" var

; void glColor4s(short red, short green, short blue, short alpha)
#func glColor4s "glColor4s" int, int, int, int

; void glColor4sv(short* v)
#func glColor4sv "glColor4sv" var

; void glColor4ub(byte red, byte green, byte blue, byte alpha)
#func glColor4ub "glColor4ub" int, int, int, int

; void glColor4ubv(byte* v)
#func glColor4ubv "glColor4ubv" var

; void glColor4ui(uint red, uint green, uint blue, uint alpha)
#func glColor4ui "glColor4ui" int, int, int, int

; void glColor4uiv(uint* v)
#func glColor4uiv "glColor4uiv" var

; void glColor4us(ushort red, ushort green, ushort blue, ushort alpha)
#func glColor4us "glColor4us" int, int, int, int

; void glColor4usv(ushort* v)
#func glColor4usv "glColor4usv" var

; void glColorMask(byte red, byte green, byte blue, byte alpha)
#func glColorMask "glColorMask" int, int, int, int

; void glColorMaterial(uint face, uint mode)
#func glColorMaterial "glColorMaterial" int, int

; void glColorPointer(int size, uint type, int stride, void* pointer)
#func glColorPointer "glColorPointer" int, int, int, intptr

; void glCopyPixels(int x, int y, int width, int height, uint type)
#func glCopyPixels "glCopyPixels" int, int, int, int, int

; void glCopyTexImage1D(uint target, int level, uint internalFormat, int x, int y, int width, int border)
#func glCopyTexImage1D "glCopyTexImage1D" int, int, int, int, int, int, int

; void glCopyTexImage2D(uint target, int level, uint internalFormat, int x, int y, int width, int height, int border)
#func glCopyTexImage2D "glCopyTexImage2D" int, int, int, int, int, int, int, int

; void glCopyTexSubImage1D(uint target, int level, int xoffset, int x, int y, int width)
#func glCopyTexSubImage1D "glCopyTexSubImage1D" int, int, int, int, int, int

; void glCopyTexSubImage2D(uint target, int level, int xoffset, int yoffset, int x, int y, int width, int height)
#func glCopyTexSubImage2D "glCopyTexSubImage2D" int, int, int, int, int, int, int, int

; void glCullFace(uint mode)
#func glCullFace "glCullFace" int

; void glDeleteLists(uint list, int range)
#func glDeleteLists "glDeleteLists" int, int

; void glDeleteTextures(int n, uint* textures)
#func glDeleteTextures "glDeleteTextures" int, var

; void glDepthFunc(uint func)
#func glDepthFunc "glDepthFunc" int

; void glDepthMask(byte flag)
#func glDepthMask "glDepthMask" int

; void glDepthRange(double zNear, double zFar)
#func glDepthRange "glDepthRange" double, double

; void glDisable(uint cap)
#func glDisable "glDisable" int

; void glDisableClientState(uint array)
#func glDisableClientState "glDisableClientState" int

; void glDrawArrays(uint mode, int first, int count)
#func glDrawArrays "glDrawArrays" int, int, int

; void glDrawBuffer(uint mode)
#func glDrawBuffer "glDrawBuffer" int

; void glDrawElements(uint mode, int count, uint type, void* indices)
#func glDrawElements "glDrawElements" int, int, int, intptr

; void glDrawPixels(int width, int height, uint format, uint type, void* pixels)
#func glDrawPixels "glDrawPixels" int, int, int, int, intptr

; void glEdgeFlag(byte flag)
#func glEdgeFlag "glEdgeFlag" int

; void glEdgeFlagPointer(int stride, void* pointer)
#func glEdgeFlagPointer "glEdgeFlagPointer" int, intptr

; void glEdgeFlagv(byte* flag)
#func glEdgeFlagv "glEdgeFlagv" var

; void glEnable(uint cap)
#func glEnable "glEnable" int

; void glEnableClientState(uint array)
#func glEnableClientState "glEnableClientState" int

; void glEnd()
#func glEnd "glEnd"

; void glEndList()
#func glEndList "glEndList"

; void glEvalCoord1d(double u)
#func glEvalCoord1d "glEvalCoord1d" double

; void glEvalCoord1dv(double* u)
#func glEvalCoord1dv "glEvalCoord1dv" var

; void glEvalCoord1f(float u)
#func glEvalCoord1f "glEvalCoord1f" float

; void glEvalCoord1fv(float* u)
#func glEvalCoord1fv "glEvalCoord1fv" var

; void glEvalCoord2d(double u, double v)
#func glEvalCoord2d "glEvalCoord2d" double, double

; void glEvalCoord2dv(double* u)
#func glEvalCoord2dv "glEvalCoord2dv" var

; void glEvalCoord2f(float u, float v)
#func glEvalCoord2f "glEvalCoord2f" float, float

; void glEvalCoord2fv(float* u)
#func glEvalCoord2fv "glEvalCoord2fv" var

; void glEvalMesh1(uint mode, int i1, int i2)
#func glEvalMesh1 "glEvalMesh1" int, int, int

; void glEvalMesh2(uint mode, int i1, int i2, int j1, int j2)
#func glEvalMesh2 "glEvalMesh2" int, int, int, int, int

; void glEvalPoint1(int i)
#func glEvalPoint1 "glEvalPoint1" int

; void glEvalPoint2(int i, int j)
#func glEvalPoint2 "glEvalPoint2" int, int

; void glFeedbackBuffer(int size, uint type, float* buffer)
#func glFeedbackBuffer "glFeedbackBuffer" int, int, var

; void glFinish()
#func glFinish "glFinish"

; void glFlush()
#func glFlush "glFlush"

; void glFogf(uint pname, float param1)
#func glFogf "glFogf" int, float

; void glFogfv(uint pname, float* @params)
#func glFogfv "glFogfv" int, int

; void glFogi(uint pname, int param1)
#func glFogi "glFogi" int, int

; void glFogiv(uint pname, int* @params)
#func glFogiv "glFogiv" int, int

; void glFrontFace(uint mode)
#func glFrontFace "glFrontFace" int

; void glFrustum(double left, double right, double bottom, double top, double zNear, double zFar)
#func glFrustum "glFrustum" double, double, double, double, double, double

; uint glGenLists(int range)
#cfunc glGenLists "glGenLists" int

; void glGenTextures(int n, uint* textures)
#func glGenTextures "glGenTextures" int, var

; void glGetBooleanv(uint pname, byte* @params)
#func glGetBooleanv "glGetBooleanv" int, int

; void glGetClipPlane(uint plane, double* equation)
#func glGetClipPlane "glGetClipPlane" int, var

; void glGetDoublev(uint pname, double* @params)
#func glGetDoublev "glGetDoublev" int, int

; uint glGetError()
#cfunc glGetError "glGetError"

; void glGetFloatv(uint pname, float* @params)
#func glGetFloatv "glGetFloatv" int, int

; void glGetIntegerv(uint pname, int* @params)
#func glGetIntegerv "glGetIntegerv" int, int

; void glGetLightfv(uint light, uint pname, float* @params)
#func glGetLightfv "glGetLightfv" int, int, int

; void glGetLightiv(uint light, uint pname, int* @params)
#func glGetLightiv "glGetLightiv" int, int, int

; void glGetMapdv(uint target, uint query, double* v)
#func glGetMapdv "glGetMapdv" int, int, var

; void glGetMapfv(uint target, uint query, float* v)
#func glGetMapfv "glGetMapfv" int, int, var

; void glGetMapiv(uint target, uint query, int* v)
#func glGetMapiv "glGetMapiv" int, int, var

; void glGetMaterialfv(uint face, uint pname, float* @params)
#func glGetMaterialfv "glGetMaterialfv" int, int, int

; void glGetMaterialiv(uint face, uint pname, int* @params)
#func glGetMaterialiv "glGetMaterialiv" int, int, int

; void glGetPixelMapfv(uint map, float* values)
#func glGetPixelMapfv "glGetPixelMapfv" int, var

; void glGetPixelMapuiv(uint map, uint* values)
#func glGetPixelMapuiv "glGetPixelMapuiv" int, var

; void glGetPixelMapusv(uint map, ushort* values)
#func glGetPixelMapusv "glGetPixelMapusv" int, var

; void glGetPointerv(uint pname, void** @params)
#func glGetPointerv "glGetPointerv" int, int

; void glGetPolygonStipple(byte* mask)
#func glGetPolygonStipple "glGetPolygonStipple" var

; byte* glGetString(uint name)
#cfunc glGetString "glGetString" int

; void glGetTexEnvfv(uint target, uint pname, float* @params)
#func glGetTexEnvfv "glGetTexEnvfv" int, int, int

; void glGetTexEnviv(uint target, uint pname, int* @params)
#func glGetTexEnviv "glGetTexEnviv" int, int, int

; void glGetTexGendv(uint coord, uint pname, double* @params)
#func glGetTexGendv "glGetTexGendv" int, int, int

; void glGetTexGenfv(uint coord, uint pname, float* @params)
#func glGetTexGenfv "glGetTexGenfv" int, int, int

; void glGetTexGeniv(uint coord, uint pname, int* @params)
#func glGetTexGeniv "glGetTexGeniv" int, int, int

; void glGetTexImage(uint target, int level, uint format, uint type, void* pixels)
#func glGetTexImage "glGetTexImage" int, int, int, int, intptr

; void glGetTexLevelParameterfv(uint target, int level, uint pname, float* @params)
#func glGetTexLevelParameterfv "glGetTexLevelParameterfv" int, int, int, int

; void glGetTexLevelParameteriv(uint target, int level, uint pname, int* @params)
#func glGetTexLevelParameteriv "glGetTexLevelParameteriv" int, int, int, int

; void glGetTexParameterfv(uint target, uint pname, float* @params)
#func glGetTexParameterfv "glGetTexParameterfv" int, int, int

; void glGetTexParameteriv(uint target, uint pname, int* @params)
#func glGetTexParameteriv "glGetTexParameteriv" int, int, int

; void glHint(uint target, uint mode)
#func glHint "glHint" int, int

; void glIndexMask(uint mask)
#func glIndexMask "glIndexMask" int

; void glIndexPointer(uint type, int stride, void* pointer)
#func glIndexPointer "glIndexPointer" int, int, intptr

; void glIndexd(double c)
#func glIndexd "glIndexd" double

; void glIndexdv(double* c)
#func glIndexdv "glIndexdv" var

; void glIndexf(float c)
#func glIndexf "glIndexf" float

; void glIndexfv(float* c)
#func glIndexfv "glIndexfv" var

; void glIndexi(int c)
#func glIndexi "glIndexi" int

; void glIndexiv(int* c)
#func glIndexiv "glIndexiv" var

; void glIndexs(short c)
#func glIndexs "glIndexs" int

; void glIndexsv(short* c)
#func glIndexsv "glIndexsv" var

; void glIndexub(byte c)
#func glIndexub "glIndexub" int

; void glIndexubv(byte* c)
#func glIndexubv "glIndexubv" var

; void glInitNames()
#func glInitNames "glInitNames"

; void glInterleavedArrays(uint format, int stride, void* pointer)
#func glInterleavedArrays "glInterleavedArrays" int, int, intptr

; byte glIsEnabled(uint cap)
#cfunc glIsEnabled "glIsEnabled" int

; byte glIsList(uint list)
#cfunc glIsList "glIsList" int

; byte glIsTexture(uint texture)
#cfunc glIsTexture "glIsTexture" int

; void glLightModelf(uint pname, float param1)
#func glLightModelf "glLightModelf" int, float

; void glLightModelfv(uint pname, float* @params)
#func glLightModelfv "glLightModelfv" int, int

; void glLightModeli(uint pname, int param1)
#func glLightModeli "glLightModeli" int, int

; void glLightModeliv(uint pname, int* @params)
#func glLightModeliv "glLightModeliv" int, int

; void glLightf(uint light, uint pname, float param2)
#func glLightf "glLightf" int, int, float

; void glLightfv(uint light, uint pname, float* @params)
#func glLightfv "glLightfv" int, int, int

; void glLighti(uint light, uint pname, int param2)
#func glLighti "glLighti" int, int, int

; void glLightiv(uint light, uint pname, int* @params)
#func glLightiv "glLightiv" int, int, int

; void glLineStipple(int factor, ushort pattern)
#func glLineStipple "glLineStipple" int, int

; void glLineWidth(float width)
#func glLineWidth "glLineWidth" float

; void glListBase(uint @base)
#func glListBase "glListBase" int

; void glLoadIdentity()
#func glLoadIdentity "glLoadIdentity"

; void glLoadMatrixd(double* m)
#func glLoadMatrixd "glLoadMatrixd" var

; void glLoadMatrixf(float* m)
#func glLoadMatrixf "glLoadMatrixf" var

; void glLoadName(uint name)
#func glLoadName "glLoadName" int

; void glLogicOp(uint opcode)
#func glLogicOp "glLogicOp" int

; void glMap1d(uint target, double u1, double u2, int stride, int order, double* points)
#func glMap1d "glMap1d" int, double, double, int, int, var

; void glMap1f(uint target, float u1, float u2, int stride, int order, float* points)
#func glMap1f "glMap1f" int, float, float, int, int, var

; void glMap2d(uint target, double u1, double u2, int ustride, int uorder, double v1, double v2, int vstride, int vorder, double* points)
#func glMap2d "glMap2d" int, double, double, int, int, double, double, int, int, var

; void glMap2f(uint target, float u1, float u2, int ustride, int uorder, float v1, float v2, int vstride, int vorder, float* points)
#func glMap2f "glMap2f" int, float, float, int, int, float, float, int, int, var

; void glMapGrid1d(int un, double u1, double u2)
#func glMapGrid1d "glMapGrid1d" int, double, double

; void glMapGrid1f(int un, float u1, float u2)
#func glMapGrid1f "glMapGrid1f" int, float, float

; void glMapGrid2d(int un, double u1, double u2, int vn, double v1, double v2)
#func glMapGrid2d "glMapGrid2d" int, double, double, int, double, double

; void glMapGrid2f(int un, float u1, float u2, int vn, float v1, float v2)
#func glMapGrid2f "glMapGrid2f" int, float, float, int, float, float

; void glMaterialf(uint face, uint pname, float param2)
#func glMaterialf "glMaterialf" int, int, float

; void glMaterialfv(uint face, uint pname, float* @params)
#func glMaterialfv "glMaterialfv" int, int, int

; void glMateriali(uint face, uint pname, int param2)
#func glMateriali "glMateriali" int, int, int

; void glMaterialiv(uint face, uint pname, int* @params)
#func glMaterialiv "glMaterialiv" int, int, int

; void glMatrixMode(uint mode)
#func glMatrixMode "glMatrixMode" int

; void glMultMatrixd(double* m)
#func glMultMatrixd "glMultMatrixd" var

; void glMultMatrixf(float* m)
#func glMultMatrixf "glMultMatrixf" var

; void glNewList(uint list, uint mode)
#func glNewList "glNewList" int, int

; void glNormal3b(sbyte nx, sbyte ny, sbyte nz)
#func glNormal3b "glNormal3b" int, int, int

; void glNormal3bv(sbyte* v)
#func glNormal3bv "glNormal3bv" var

; void glNormal3d(double nx, double ny, double nz)
#func glNormal3d "glNormal3d" double, double, double

; void glNormal3dv(double* v)
#func glNormal3dv "glNormal3dv" var

; void glNormal3f(float nx, float ny, float nz)
#func glNormal3f "glNormal3f" float, float, float

; void glNormal3fv(float* v)
#func glNormal3fv "glNormal3fv" var

; void glNormal3i(int nx, int ny, int nz)
#func glNormal3i "glNormal3i" int, int, int

; void glNormal3iv(int* v)
#func glNormal3iv "glNormal3iv" var

; void glNormal3s(short nx, short ny, short nz)
#func glNormal3s "glNormal3s" int, int, int

; void glNormal3sv(short* v)
#func glNormal3sv "glNormal3sv" var

; void glNormalPointer(uint type, int stride, void* pointer)
#func glNormalPointer "glNormalPointer" int, int, intptr

; void glOrtho(double left, double right, double bottom, double top, double zNear, double zFar)
#func glOrtho "glOrtho" double, double, double, double, double, double

; void glPassThrough(float token)
#func glPassThrough "glPassThrough" float

; void glPixelMapfv(uint map, int mapsize, float* values)
#func glPixelMapfv "glPixelMapfv" int, int, var

; void glPixelMapuiv(uint map, int mapsize, uint* values)
#func glPixelMapuiv "glPixelMapuiv" int, int, var

; void glPixelMapusv(uint map, int mapsize, ushort* values)
#func glPixelMapusv "glPixelMapusv" int, int, var

; void glPixelStoref(uint pname, float param1)
#func glPixelStoref "glPixelStoref" int, float

; void glPixelStorei(uint pname, int param1)
#func glPixelStorei "glPixelStorei" int, int

; void glPixelTransferf(uint pname, float param1)
#func glPixelTransferf "glPixelTransferf" int, float

; void glPixelTransferi(uint pname, int param1)
#func glPixelTransferi "glPixelTransferi" int, int

; void glPixelZoom(float xfactor, float yfactor)
#func glPixelZoom "glPixelZoom" float, float

; void glPointSize(float size)
#func glPointSize "glPointSize" float

; void glPolygonMode(uint face, uint mode)
#func glPolygonMode "glPolygonMode" int, int

; void glPolygonOffset(float factor, float units)
#func glPolygonOffset "glPolygonOffset" float, float

; void glPolygonStipple(byte* mask)
#func glPolygonStipple "glPolygonStipple" var

; void glPopAttrib()
#func glPopAttrib "glPopAttrib"

; void glPopClientAttrib()
#func glPopClientAttrib "glPopClientAttrib"

; void glPopMatrix()
#func glPopMatrix "glPopMatrix"

; void glPopName()
#func glPopName "glPopName"

; void glPrioritizeTextures(int n, uint* textures, float* priorities)
#func glPrioritizeTextures "glPrioritizeTextures" int, var, var

; void glPushAttrib(uint mask)
#func glPushAttrib "glPushAttrib" int

; void glPushClientAttrib(uint mask)
#func glPushClientAttrib "glPushClientAttrib" int

; void glPushMatrix()
#func glPushMatrix "glPushMatrix"

; void glPushName(uint name)
#func glPushName "glPushName" int

; void glRasterPos2d(double x, double y)
#func glRasterPos2d "glRasterPos2d" double, double

; void glRasterPos2dv(double* v)
#func glRasterPos2dv "glRasterPos2dv" var

; void glRasterPos2f(float x, float y)
#func glRasterPos2f "glRasterPos2f" float, float

; void glRasterPos2fv(float* v)
#func glRasterPos2fv "glRasterPos2fv" var

; void glRasterPos2i(int x, int y)
#func glRasterPos2i "glRasterPos2i" int, int

; void glRasterPos2iv(int* v)
#func glRasterPos2iv "glRasterPos2iv" var

; void glRasterPos2s(short x, short y)
#func glRasterPos2s "glRasterPos2s" int, int

; void glRasterPos2sv(short* v)
#func glRasterPos2sv "glRasterPos2sv" var

; void glRasterPos3d(double x, double y, double z)
#func glRasterPos3d "glRasterPos3d" double, double, double

; void glRasterPos3dv(double* v)
#func glRasterPos3dv "glRasterPos3dv" var

; void glRasterPos3f(float x, float y, float z)
#func glRasterPos3f "glRasterPos3f" float, float, float

; void glRasterPos3fv(float* v)
#func glRasterPos3fv "glRasterPos3fv" var

; void glRasterPos3i(int x, int y, int z)
#func glRasterPos3i "glRasterPos3i" int, int, int

; void glRasterPos3iv(int* v)
#func glRasterPos3iv "glRasterPos3iv" var

; void glRasterPos3s(short x, short y, short z)
#func glRasterPos3s "glRasterPos3s" int, int, int

; void glRasterPos3sv(short* v)
#func glRasterPos3sv "glRasterPos3sv" var

; void glRasterPos4d(double x, double y, double z, double w)
#func glRasterPos4d "glRasterPos4d" double, double, double, double

; void glRasterPos4dv(double* v)
#func glRasterPos4dv "glRasterPos4dv" var

; void glRasterPos4f(float x, float y, float z, float w)
#func glRasterPos4f "glRasterPos4f" float, float, float, float

; void glRasterPos4fv(float* v)
#func glRasterPos4fv "glRasterPos4fv" var

; void glRasterPos4i(int x, int y, int z, int w)
#func glRasterPos4i "glRasterPos4i" int, int, int, int

; void glRasterPos4iv(int* v)
#func glRasterPos4iv "glRasterPos4iv" var

; void glRasterPos4s(short x, short y, short z, short w)
#func glRasterPos4s "glRasterPos4s" int, int, int, int

; void glRasterPos4sv(short* v)
#func glRasterPos4sv "glRasterPos4sv" var

; void glReadBuffer(uint mode)
#func glReadBuffer "glReadBuffer" int

; void glReadPixels(int x, int y, int width, int height, uint format, uint type, void* pixels)
#func glReadPixels "glReadPixels" int, int, int, int, int, int, intptr

; void glRectd(double x1, double y1, double x2, double y2)
#func glRectd "glRectd" double, double, double, double

; void glRectdv(double* v1, double* v2)
#func glRectdv "glRectdv" var, var

; void glRectf(float x1, float y1, float x2, float y2)
#func glRectf "glRectf" float, float, float, float

; void glRectfv(float* v1, float* v2)
#func glRectfv "glRectfv" var, var

; void glRecti(int x1, int y1, int x2, int y2)
#func glRecti "glRecti" int, int, int, int

; void glRectiv(int* v1, int* v2)
#func glRectiv "glRectiv" var, var

; void glRects(short x1, short y1, short x2, short y2)
#func glRects "glRects" int, int, int, int

; void glRectsv(short* v1, short* v2)
#func glRectsv "glRectsv" var, var

; int glRenderMode(uint mode)
#cfunc glRenderMode "glRenderMode" int

; void glRotated(double angle, double x, double y, double z)
#func glRotated "glRotated" double, double, double, double

; void glRotatef(float angle, float x, float y, float z)
#func glRotatef "glRotatef" float, float, float, float

; void glScaled(double x, double y, double z)
#func glScaled "glScaled" double, double, double

; void glScalef(float x, float y, float z)
#func glScalef "glScalef" float, float, float

; void glScissor(int x, int y, int width, int height)
#func glScissor "glScissor" int, int, int, int

; void glSelectBuffer(int size, uint* buffer)
#func glSelectBuffer "glSelectBuffer" int, var

; void glShadeModel(uint mode)
#func glShadeModel "glShadeModel" int

; void glStencilFunc(uint func, int @ref, uint mask)
#func glStencilFunc "glStencilFunc" int, int, int

; void glStencilMask(uint mask)
#func glStencilMask "glStencilMask" int

; void glStencilOp(uint fail, uint zfail, uint zpass)
#func glStencilOp "glStencilOp" int, int, int

; void glTexCoord1d(double s)
#func glTexCoord1d "glTexCoord1d" double

; void glTexCoord1dv(double* v)
#func glTexCoord1dv "glTexCoord1dv" var

; void glTexCoord1f(float s)
#func glTexCoord1f "glTexCoord1f" float

; void glTexCoord1fv(float* v)
#func glTexCoord1fv "glTexCoord1fv" var

; void glTexCoord1i(int s)
#func glTexCoord1i "glTexCoord1i" int

; void glTexCoord1iv(int* v)
#func glTexCoord1iv "glTexCoord1iv" var

; void glTexCoord1s(short s)
#func glTexCoord1s "glTexCoord1s" int

; void glTexCoord1sv(short* v)
#func glTexCoord1sv "glTexCoord1sv" var

; void glTexCoord2d(double s, double t)
#func glTexCoord2d "glTexCoord2d" double, double

; void glTexCoord2dv(double* v)
#func glTexCoord2dv "glTexCoord2dv" var

; void glTexCoord2f(float s, float t)
#func glTexCoord2f "glTexCoord2f" float, float

; void glTexCoord2fv(float* v)
#func glTexCoord2fv "glTexCoord2fv" var

; void glTexCoord2i(int s, int t)
#func glTexCoord2i "glTexCoord2i" int, int

; void glTexCoord2iv(int* v)
#func glTexCoord2iv "glTexCoord2iv" var

; void glTexCoord2s(short s, short t)
#func glTexCoord2s "glTexCoord2s" int, int

; void glTexCoord2sv(short* v)
#func glTexCoord2sv "glTexCoord2sv" var

; void glTexCoord3d(double s, double t, double r)
#func glTexCoord3d "glTexCoord3d" double, double, double

; void glTexCoord3dv(double* v)
#func glTexCoord3dv "glTexCoord3dv" var

; void glTexCoord3f(float s, float t, float r)
#func glTexCoord3f "glTexCoord3f" float, float, float

; void glTexCoord3fv(float* v)
#func glTexCoord3fv "glTexCoord3fv" var

; void glTexCoord3i(int s, int t, int r)
#func glTexCoord3i "glTexCoord3i" int, int, int

; void glTexCoord3iv(int* v)
#func glTexCoord3iv "glTexCoord3iv" var

; void glTexCoord3s(short s, short t, short r)
#func glTexCoord3s "glTexCoord3s" int, int, int

; void glTexCoord3sv(short* v)
#func glTexCoord3sv "glTexCoord3sv" var

; void glTexCoord4d(double s, double t, double r, double q)
#func glTexCoord4d "glTexCoord4d" double, double, double, double

; void glTexCoord4dv(double* v)
#func glTexCoord4dv "glTexCoord4dv" var

; void glTexCoord4f(float s, float t, float r, float q)
#func glTexCoord4f "glTexCoord4f" float, float, float, float

; void glTexCoord4fv(float* v)
#func glTexCoord4fv "glTexCoord4fv" var

; void glTexCoord4i(int s, int t, int r, int q)
#func glTexCoord4i "glTexCoord4i" int, int, int, int

; void glTexCoord4iv(int* v)
#func glTexCoord4iv "glTexCoord4iv" var

; void glTexCoord4s(short s, short t, short r, short q)
#func glTexCoord4s "glTexCoord4s" int, int, int, int

; void glTexCoord4sv(short* v)
#func glTexCoord4sv "glTexCoord4sv" var

; void glTexCoordPointer(int size, uint type, int stride, void* pointer)
#func glTexCoordPointer "glTexCoordPointer" int, int, int, intptr

; void glTexEnvf(uint target, uint pname, float param2)
#func glTexEnvf "glTexEnvf" int, int, float

; void glTexEnvfv(uint target, uint pname, float* @params)
#func glTexEnvfv "glTexEnvfv" int, int, int

; void glTexEnvi(uint target, uint pname, int param2)
#func glTexEnvi "glTexEnvi" int, int, int

; void glTexEnviv(uint target, uint pname, int* @params)
#func glTexEnviv "glTexEnviv" int, int, int

; void glTexGend(uint coord, uint pname, double param2)
#func glTexGend "glTexGend" int, int, double

; void glTexGendv(uint coord, uint pname, double* @params)
#func glTexGendv "glTexGendv" int, int, int

; void glTexGenf(uint coord, uint pname, float param2)
#func glTexGenf "glTexGenf" int, int, float

; void glTexGenfv(uint coord, uint pname, float* @params)
#func glTexGenfv "glTexGenfv" int, int, int

; void glTexGeni(uint coord, uint pname, int param2)
#func glTexGeni "glTexGeni" int, int, int

; void glTexGeniv(uint coord, uint pname, int* @params)
#func glTexGeniv "glTexGeniv" int, int, int

; void glTexImage1D(uint target, int level, int internalformat, int width, int border, uint format, uint type, void* pixels)
#func glTexImage1D "glTexImage1D" int, int, int, int, int, int, int, intptr

; void glTexImage2D(uint target, int level, int internalformat, int width, int height, int border, uint format, uint type, void* pixels)
#func glTexImage2D "glTexImage2D" int, int, int, int, int, int, int, int, intptr

; void glTexParameterf(uint target, uint pname, float param2)
#func glTexParameterf "glTexParameterf" int, int, float

; void glTexParameterfv(uint target, uint pname, float* @params)
#func glTexParameterfv "glTexParameterfv" int, int, int

; void glTexParameteri(uint target, uint pname, int param2)
#func glTexParameteri "glTexParameteri" int, int, int

; void glTexParameteriv(uint target, uint pname, int* @params)
#func glTexParameteriv "glTexParameteriv" int, int, int

; void glTexSubImage1D(uint target, int level, int xoffset, int width, uint format, uint type, void* pixels)
#func glTexSubImage1D "glTexSubImage1D" int, int, int, int, int, int, intptr

; void glTexSubImage2D(uint target, int level, int xoffset, int yoffset, int width, int height, uint format, uint type, void* pixels)
#func glTexSubImage2D "glTexSubImage2D" int, int, int, int, int, int, int, int, intptr

; void glTranslated(double x, double y, double z)
#func glTranslated "glTranslated" double, double, double

; void glTranslatef(float x, float y, float z)
#func glTranslatef "glTranslatef" float, float, float

; void glVertex2d(double x, double y)
#func glVertex2d "glVertex2d" double, double

; void glVertex2dv(double* v)
#func glVertex2dv "glVertex2dv" var

; void glVertex2f(float x, float y)
#func glVertex2f "glVertex2f" float, float

; void glVertex2fv(float* v)
#func glVertex2fv "glVertex2fv" var

; void glVertex2i(int x, int y)
#func glVertex2i "glVertex2i" int, int

; void glVertex2iv(int* v)
#func glVertex2iv "glVertex2iv" var

; void glVertex2s(short x, short y)
#func glVertex2s "glVertex2s" int, int

; void glVertex2sv(short* v)
#func glVertex2sv "glVertex2sv" var

; void glVertex3d(double x, double y, double z)
#func glVertex3d "glVertex3d" double, double, double

; void glVertex3dv(double* v)
#func glVertex3dv "glVertex3dv" var

; void glVertex3f(float x, float y, float z)
#func glVertex3f "glVertex3f" float, float, float

; void glVertex3fv(float* v)
#func glVertex3fv "glVertex3fv" var

; void glVertex3i(int x, int y, int z)
#func glVertex3i "glVertex3i" int, int, int

; void glVertex3iv(int* v)
#func glVertex3iv "glVertex3iv" var

; void glVertex3s(short x, short y, short z)
#func glVertex3s "glVertex3s" int, int, int

; void glVertex3sv(short* v)
#func glVertex3sv "glVertex3sv" var

; void glVertex4d(double x, double y, double z, double w)
#func glVertex4d "glVertex4d" double, double, double, double

; void glVertex4dv(double* v)
#func glVertex4dv "glVertex4dv" var

; void glVertex4f(float x, float y, float z, float w)
#func glVertex4f "glVertex4f" float, float, float, float

; void glVertex4fv(float* v)
#func glVertex4fv "glVertex4fv" var

; void glVertex4i(int x, int y, int z, int w)
#func glVertex4i "glVertex4i" int, int, int, int

; void glVertex4iv(int* v)
#func glVertex4iv "glVertex4iv" var

; void glVertex4s(short x, short y, short z, short w)
#func glVertex4s "glVertex4s" int, int, int, int

; void glVertex4sv(short* v)
#func glVertex4sv "glVertex4sv" var

; void glVertexPointer(int size, uint type, int stride, void* pointer)
#func glVertexPointer "glVertexPointer" int, int, int, intptr

; void glViewport(int x, int y, int width, int height)
#func glViewport "glViewport" int, int, int, int

; winmdroot.Foundation.BOOL wglDeleteContext(winmdroot.Graphics.OpenGL.HGLRC param0)
#cfunc wglDeleteContext "wglDeleteContext" intptr

; winmdroot.Foundation.BOOL wglCopyContext(winmdroot.Graphics.OpenGL.HGLRC param0, winmdroot.Graphics.OpenGL.HGLRC param1, uint param2)
#cfunc wglCopyContext "wglCopyContext" intptr, intptr, int

; winmdroot.Graphics.OpenGL.HGLRC wglCreateContext(winmdroot.Graphics.Gdi.HDC param0)
#cfunc wglCreateContext "wglCreateContext" intptr

; winmdroot.Graphics.OpenGL.HGLRC wglCreateLayerContext(winmdroot.Graphics.Gdi.HDC param0, int param1)
#cfunc wglCreateLayerContext "wglCreateLayerContext" intptr, int

; winmdroot.Foundation.BOOL wglDescribeLayerPlane(winmdroot.Graphics.Gdi.HDC param0, int param1, int param2, uint param3, winmdroot.Graphics.OpenGL.LAYERPLANEDESCRIPTOR* param4)
#cfunc wglDescribeLayerPlane "wglDescribeLayerPlane" intptr, int, int, int, var

; winmdroot.Graphics.OpenGL.HGLRC wglGetCurrentContext()
#cfunc wglGetCurrentContext "wglGetCurrentContext"

; winmdroot.Graphics.Gdi.HDC wglGetCurrentDC()
#cfunc wglGetCurrentDC "wglGetCurrentDC"

; int wglGetLayerPaletteEntries(winmdroot.Graphics.Gdi.HDC param0, int param1, int param2, int param3, winmdroot.Foundation.COLORREF* param4)
#cfunc wglGetLayerPaletteEntries "wglGetLayerPaletteEntries" intptr, int, int, int, var

; winmdroot.Foundation.PROC wglGetProcAddress(winmdroot.Foundation.PCSTR param0)
#cfunc wglGetProcAddress "wglGetProcAddress" str

; winmdroot.Foundation.BOOL wglMakeCurrent(winmdroot.Graphics.Gdi.HDC param0, winmdroot.Graphics.OpenGL.HGLRC param1)
#cfunc wglMakeCurrent "wglMakeCurrent" intptr, intptr

; winmdroot.Foundation.BOOL wglRealizeLayerPalette(winmdroot.Graphics.Gdi.HDC param0, int param1, winmdroot.Foundation.BOOL param2)
#cfunc wglRealizeLayerPalette "wglRealizeLayerPalette" intptr, int, int

; int wglSetLayerPaletteEntries(winmdroot.Graphics.Gdi.HDC param0, int param1, int param2, int param3, winmdroot.Foundation.COLORREF* param4)
#cfunc wglSetLayerPaletteEntries "wglSetLayerPaletteEntries" intptr, int, int, int, var

; winmdroot.Foundation.BOOL wglShareLists(winmdroot.Graphics.OpenGL.HGLRC param0, winmdroot.Graphics.OpenGL.HGLRC param1)
#cfunc wglShareLists "wglShareLists" intptr, intptr

; winmdroot.Foundation.BOOL wglSwapLayerBuffers(winmdroot.Graphics.Gdi.HDC param0, uint param1)
#cfunc wglSwapLayerBuffers "wglSwapLayerBuffers" intptr, int

; uint wglSwapMultipleBuffers(uint param0, winmdroot.Graphics.Gdi.WGLSWAP* param1)
#cfunc wglSwapMultipleBuffers "wglSwapMultipleBuffers" int, var

; winmdroot.Foundation.BOOL wglUseFontBitmaps(winmdroot.Graphics.Gdi.HDC param0, uint param1, uint param2, uint param3)
#cfunc wglUseFontBitmapsW "wglUseFontBitmapsW" intptr, int, int, int

; winmdroot.Foundation.BOOL wglUseFontOutlines(winmdroot.Graphics.Gdi.HDC param0, uint param1, uint param2, uint param3, float param4, float param5, int param6, winmdroot.Graphics.OpenGL.GLYPHMETRICSFLOAT* param7)
#cfunc wglUseFontOutlinesW "wglUseFontOutlinesW" intptr, int, int, int, float, float, int, var

#endif
