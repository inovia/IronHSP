/* hsp3dx bundled libtiff — hand-crafted tif_config.h (minimal) */

#include "tiffconf.h"

#define HAVE_ASSERT_H 1
#define HAVE_FCNTL_H 1
#define HAVE_IEEEFP 1
#define HAVE_SYS_TYPES_H 1

/* zlib/zconf.h や libtiff 内で `#ifdef HAVE_*` 判定される項目は、
   0 を定義しても true 扱いになってしまうため「必要な時だけ define」する。 */
#ifdef _WIN32
# define HAVE_IO_H 1
# define HAVE_SETMODE 1
#else
# define HAVE_UNISTD_H 1
# define HAVE_MMAP 1
# define HAVE_FSEEKO 1
#endif

#define CCITT_SUPPORT 1
#define PACKBITS_SUPPORT 1
#define LZW_SUPPORT 1
#define THUNDER_SUPPORT 1
#define NEXT_SUPPORT 1
#define LOGLUV_SUPPORT 1
#define ZIP_SUPPORT 1
#define MDI_SUPPORT 1
#define STRIPCHOP_DEFAULT TIFF_STRIPCHOP
#define CHUNKY_STRIP_READ_SUPPORT 1
#define DEFER_STRILE_LOAD 1
#define CHECK_JPEG_YCBCR_SUBSAMPLING 1

/* tif_unix.c 等が必要とする POSIX 関数検出フラグ */
#ifndef _MSC_VER
# define HAVE_GETOPT 1
#endif

#define TIFF_MAX_DIR_COUNT 1048576

/* printf format specifier for TIFF_SSIZE_T (= ptrdiff_t on Win / ssize_t on *nix).
   どちらも 64bit プラットフォームでは PRId64 と一致。 */
#include <inttypes.h>
#if defined(_WIN64) || defined(__x86_64__) || defined(__aarch64__) || defined(__LP64__)
#  define TIFF_SSIZE_FORMAT PRId64
#  define SIZEOF_SIZE_T 8
#  define SIZEOF_WORDTYPE 8
#else
#  define TIFF_SSIZE_FORMAT PRId32
#  define SIZEOF_SIZE_T 4
#  define SIZEOF_WORDTYPE 4
#endif
