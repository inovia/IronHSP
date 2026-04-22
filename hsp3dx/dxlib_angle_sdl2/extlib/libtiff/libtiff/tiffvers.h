/* hsp3dx bundled libtiff — hand-crafted version header */
/* clang-format off */
#define TIFFLIB_VERSION_STR "LIBTIFF, Version 4.7.0\nCopyright (c) 1988-1996 Sam Leffler\nCopyright (c) 1991-1996 Silicon Graphics, Inc."
#define TIFFLIB_VERSION 20240911
#define TIFFLIB_MAJOR_VERSION 4
#define TIFFLIB_MINOR_VERSION 7
#define TIFFLIB_MICRO_VERSION 0
#define TIFFLIB_VERSION_STR_MAJ_MIN_MIC "4.7.0"
#define TIFFLIB_AT_LEAST(major, minor, micro) \
    (TIFFLIB_MAJOR_VERSION > (major) || \
    (TIFFLIB_MAJOR_VERSION == (major) && TIFFLIB_MINOR_VERSION > (minor)) || \
    (TIFFLIB_MAJOR_VERSION == (major) && TIFFLIB_MINOR_VERSION == (minor) && \
     TIFFLIB_MICRO_VERSION >= (micro)))
/* clang-format on */
