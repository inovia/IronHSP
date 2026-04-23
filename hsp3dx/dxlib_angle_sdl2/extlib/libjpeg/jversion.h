/* jversion.h — minimal replacement for hsp3dx dxlib bundle
 * upstream jversion.h.in was removed during vendoring; we keep only
 * what jerror.c references. No symbols are actually used at runtime
 * since TurboJPEG API (which prints this version string) is excluded.
 */

#define JVERSION        "8d  15-Jan-2012"
#define JCOPYRIGHT      "Copyright (C) 2009-2024 The libjpeg-turbo Project and many others"
#define JCOPYRIGHT_SHORT JCOPYRIGHT
#define JCOPYRIGHT1     JCOPYRIGHT
#define JCOPYRIGHT2     ""
