//-----------------------------------------------------------------------------
//      stb_image implementation (isolated translation unit)
//      名前空間や DxLib マクロの影響を受けないように分離。
//-----------------------------------------------------------------------------

#define STB_IMAGE_IMPLEMENTATION
#define STBI_NO_HDR
#define STBI_NO_STDIO
#include "../../extlib/stb/stb_image.h"

extern "C" unsigned char *desktop_stb_load_from_memory(
    const unsigned char *bytes, int size, int *w, int *h, int *comp )
{
    return stbi_load_from_memory( bytes, size, w, h, comp, 4 ) ;
}

extern "C" int desktop_stb_info_from_memory(
    const unsigned char *bytes, int size, int *w, int *h, int *comp )
{
    return stbi_info_from_memory( bytes, size, w, h, comp ) ? 1 : 0 ;
}

extern "C" void desktop_stb_image_free( void *p )
{
    stbi_image_free( p ) ;
}
