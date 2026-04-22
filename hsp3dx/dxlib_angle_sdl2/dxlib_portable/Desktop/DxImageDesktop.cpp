//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (stb_image) 用 画像ロード実装
//
//      DX_NON_PNGREAD / DX_NON_JPEGREAD で libpng/libjpeg 依存を殺した代わりに、
//      stb_image (ヘッダのみ) で PNG/JPEG/BMP/GIF/TGA/PSD 等を decode し、
//      DefaultImageLoadFunc_PF[] に登録して DxLib::LoadGraph から透過的に
//      使えるようにする。
//
//      stb_image 本体は DxImageDesktop_stb.cpp に隔離。ここでは extern "C" で
//      呼び出すだけ。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#ifdef _WIN32
#include <windows.h>
#endif

#include "../DxCompileConfig.h"
#include "../DxLib.h"
#include "../DxBaseImage.h"
#include "../DxMemory.h"

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cstddef>

// stb 側ヘルパ (別 TU にある)
extern "C" unsigned char *desktop_stb_load_from_memory(
    const unsigned char *bytes, int size, int *w, int *h, int *comp ) ;
extern "C" int desktop_stb_info_from_memory(
    const unsigned char *bytes, int size, int *w, int *h, int *comp ) ;
extern "C" void desktop_stb_image_free( void *p ) ;

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// STREAMDATA から全バイトを読み切って malloc バッファへ
static unsigned char *desktop_slurp_stream( STREAMDATA *Src, size_t *OutSize )
{
    LONGLONG cur = Src->ReadShred.Tell( Src->DataPoint ) ;
    Src->ReadShred.Seek( Src->DataPoint, 0, STREAM_SEEKTYPE_END ) ;
    LONGLONG end = Src->ReadShred.Tell( Src->DataPoint ) ;
    Src->ReadShred.Seek( Src->DataPoint, cur, STREAM_SEEKTYPE_SET ) ;
    size_t n = ( size_t )( end - cur ) ;
    if ( n == 0 ) { *OutSize = 0 ; return nullptr ; }
    unsigned char *buf = ( unsigned char * )std::malloc( n ) ;
    if ( !buf ) { *OutSize = 0 ; return nullptr ; }
    size_t r = Src->ReadShred.Read( buf, 1, n, Src->DataPoint ) ;
    *OutSize = r ;
    return buf ;
}

// stb_image 共通ローダ。PNG/JPEG/BMP/GIF/TGA/PSD 等を 4ch RGBA に decode
extern int LoadStbImage( STREAMDATA *Src, BASEIMAGE *BaseImage, int GetFormatOnly )
{
    if ( !Src || !BaseImage ) return -1 ;

    LONGLONG start = Src->ReadShred.Tell( Src->DataPoint ) ;
    size_t sz = 0 ;
    unsigned char *bytes = desktop_slurp_stream( Src, &sz ) ;
    if ( !bytes || sz < 4 ) {
        if ( bytes ) std::free( bytes ) ;
        Src->ReadShred.Seek( Src->DataPoint, start, STREAM_SEEKTYPE_SET ) ;
        return -1 ;
    }

    int w = 0, h = 0, comp = 0 ;
    if ( GetFormatOnly ) {
        int ok = desktop_stb_info_from_memory( bytes, ( int )sz, &w, &h, &comp ) ;
        std::free( bytes ) ;
        Src->ReadShred.Seek( Src->DataPoint, start, STREAM_SEEKTYPE_SET ) ;
        if ( !ok ) return -1 ;

        NS_CreateARGB8ColorData( &BaseImage->ColorData ) ;
        BaseImage->Width  = w ;
        BaseImage->Height = h ;
        BaseImage->Pitch  = w * 4 ;
        BaseImage->GraphData = nullptr ;
        BaseImage->MipMapCount = 0 ;
        BaseImage->GraphDataCount = 0 ;
        return 0 ;
    }

    unsigned char *pix = desktop_stb_load_from_memory( bytes, ( int )sz, &w, &h, &comp ) ;
    std::free( bytes ) ;
    if ( !pix ) {
        Src->ReadShred.Seek( Src->DataPoint, start, STREAM_SEEKTYPE_SET ) ;
        return -1 ;
    }

    // stb: RGBA byte order。DxLib 内部 ARGB8 は BGRA byte order (0xAARRGGBB)。swap。
    int px_cnt = w * h ;
    unsigned char *argb = ( unsigned char * )DXALLOC( ( size_t )px_cnt * 4 ) ;
    if ( !argb ) {
        desktop_stb_image_free( pix ) ;
        return -1 ;
    }
    for ( int i = 0 ; i < px_cnt ; ++i ) {
        unsigned char R = pix[ i * 4 + 0 ] ;
        unsigned char G = pix[ i * 4 + 1 ] ;
        unsigned char B = pix[ i * 4 + 2 ] ;
        unsigned char A = pix[ i * 4 + 3 ] ;
        argb[ i * 4 + 0 ] = B ;
        argb[ i * 4 + 1 ] = G ;
        argb[ i * 4 + 2 ] = R ;
        argb[ i * 4 + 3 ] = A ;
    }
    desktop_stb_image_free( pix ) ;

    NS_CreateARGB8ColorData( &BaseImage->ColorData ) ;
    BaseImage->Width  = w ;
    BaseImage->Height = h ;
    BaseImage->Pitch  = w * 4 ;
    BaseImage->GraphData = argb ;
    BaseImage->MipMapCount = 0 ;
    BaseImage->GraphDataCount = 0 ;
    return 0 ;
}

#ifndef DX_NON_NAMESPACE
} // end namespace DxLib
#endif
