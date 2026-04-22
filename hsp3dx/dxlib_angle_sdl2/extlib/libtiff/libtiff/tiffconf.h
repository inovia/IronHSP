/* hsp3dx bundled libtiff — hand-crafted tiffconf.h (minimal) */
#ifndef _TIFFCONF_
#define _TIFFCONF_

#include <stddef.h>
#include <stdint.h>
#include <inttypes.h>
#ifndef _WIN32
#  include <sys/types.h>   /* ssize_t 用 */
#endif

#define TIFF_INT8_T   int8_t
#define TIFF_UINT8_T  uint8_t
#define TIFF_INT16_T  int16_t
#define TIFF_UINT16_T uint16_t
#define TIFF_INT32_T  int32_t
#define TIFF_UINT32_T uint32_t
#define TIFF_INT64_T  int64_t
#define TIFF_UINT64_T uint64_t

#ifdef _WIN32
# define TIFF_SSIZE_T ptrdiff_t
#else
# define TIFF_SSIZE_T ssize_t
#endif

#define HAVE_IEEEFP 1
#define HOST_FILLORDER FILLORDER_LSB2MSB
#define HOST_BIGENDIAN 0

/* built-in codecs のみ: LZW / PackBits / Deflate / CCITT / Thunder / NeXT / LogLuv */
#define CCITT_SUPPORT 1
#define PACKBITS_SUPPORT 1
#define LZW_SUPPORT 1
#define THUNDER_SUPPORT 1
#define NEXT_SUPPORT 1
#define LOGLUV_SUPPORT 1
#define ZIP_SUPPORT 1          /* zlib は hsp3dx で bundle 済 */

/* 外部 SDK 要求のため非サポート */
/* #define JPEG_SUPPORT   — libjpeg 必要 */
/* #define OJPEG_SUPPORT  — libjpeg 必要 */
/* #define JBIG_SUPPORT   — libjbig-kit 必要 */
/* #define LZMA_SUPPORT   — liblzma 必要 */
/* #define ZSTD_SUPPORT   — libzstd 必要 */
/* #define LERC_SUPPORT   — lerc 必要 */
/* #define WEBP_SUPPORT   — libwebp 必要 */
/* #define PIXARLOG_SUPPORT — 非標準、無効化 */

#define STRIPCHOP_DEFAULT TIFF_STRIPCHOP
#define STRIP_SIZE_DEFAULT 8192
#define DEFAULT_EXTRASAMPLE_AS_ALPHA 1
#define CHECK_JPEG_YCBCR_SUBSAMPLING 1
#define CHUNKY_STRIP_READ_SUPPORT 1
#define DEFER_STRILE_LOAD 1

#endif /* _TIFFCONF_ */
