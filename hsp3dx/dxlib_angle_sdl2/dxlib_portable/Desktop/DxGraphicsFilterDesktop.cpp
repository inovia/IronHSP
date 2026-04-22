//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2+GL) 用 画像フィルタ 実装 (CPU 版 最小)
//
//      DxLib の NS_GraphFilter / NS_GraphFilterBlt は本来シェーダベースで
//      GPU 上に転送されるが、fixed-function GL では shader を書く土台が無い
//      ので CPU で BASEIMAGE を処理する。
//
//      対応する FilterType (最小):
//        DX_GRAPH_FILTER_MONO         - モノトーン化
//        DX_GRAPH_FILTER_INVERT       - 階調反転
//        DX_GRAPH_FILTER_BRIGHT_CLIP  - 明るさクリップ
//        DX_GRAPH_FILTER_BRIGHT_SCALE - 明るさスケーリング
//        DX_GRAPH_FILTER_HSB          - 色相/彩度/明度
//        DX_GRAPH_FILTER_TWO_COLOR    - 2 階調化
//
//      その他の FilterType (GAUSS / GRADIENT_MAP / BICUBIC / LANCZOS3 /
//      SSAO 等) は未対応 (no-op)。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#ifdef _WIN32
#include <windows.h>
#endif

#include "../DxCompileConfig.h"
#include "../DxLib.h"
#include "../DxBaseImage.h"
#include "../DxGraphics.h"
#include "../DxMemory.h"

#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <cstdarg>
#include <cmath>
#include <algorithm>

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

// 画像の pitch * height 分のバッファを BASEIMAGE 形式 (BGRA バイト順) で
// Lock → 編集 → Unlock のパターンで処理するヘルパ。
static int desktop_filter_process_in_place( int gh, int filterType, va_list ap )
{
    int pitch = 0 ;
    void *data = nullptr ;
    COLORDATA *cd = nullptr ;
    if ( NS_GraphLock( gh, &pitch, &data, &cd, FALSE ) != 0 ) return -1 ;

    int w = 0, h = 0 ;
    NS_GetGraphSize( gh, &w, &h ) ;
    unsigned char *pixels = ( unsigned char * )data ;

    switch ( filterType )
    {
    case DX_GRAPH_FILTER_MONO: {
        // 引数: int Cb (-128..127), int Cr (-128..127)
        int Cb = va_arg( ap, int ) ;
        int Cr = va_arg( ap, int ) ;
        (void)Cb; (void)Cr;  // 簡易版では B/R オフセットは無視して純粋な輝度化
        for ( int y = 0 ; y < h ; ++y ) {
            unsigned char *row = pixels + y * pitch ;
            for ( int x = 0 ; x < w ; ++x ) {
                unsigned char *p = row + x * 4 ;
                // BGRA
                int lum = ( p[ 0 ] * 29 + p[ 1 ] * 150 + p[ 2 ] * 77 ) >> 8 ;  // BT.601 近似
                p[ 0 ] = p[ 1 ] = p[ 2 ] = ( unsigned char )lum ;
            }
        }
        break ;
    }
    case DX_GRAPH_FILTER_INVERT:
    case DX_GRAPH_FILTER_PMA_INVERT: {
        for ( int y = 0 ; y < h ; ++y ) {
            unsigned char *row = pixels + y * pitch ;
            for ( int x = 0 ; x < w ; ++x ) {
                unsigned char *p = row + x * 4 ;
                p[ 0 ] = ( unsigned char )( 255 - p[ 0 ] ) ;
                p[ 1 ] = ( unsigned char )( 255 - p[ 1 ] ) ;
                p[ 2 ] = ( unsigned char )( 255 - p[ 2 ] ) ;
                // alpha は保持
            }
        }
        break ;
    }
    case DX_GRAPH_FILTER_BRIGHT_CLIP:
    case DX_GRAPH_FILTER_PMA_BRIGHT_CLIP: {
        // 引数: int CmpType (0=below, 1=above), int CmpParam, int ClipFillFlag,
        //        int ClipFillColor, int ClipFillAlpha
        int cmpType = va_arg( ap, int ) ;
        int cmpParam = va_arg( ap, int ) ;
        int fillFlag = va_arg( ap, int ) ;
        int fillColor = va_arg( ap, int ) ;
        int fillAlpha = va_arg( ap, int ) ;
        (void)fillFlag; (void)fillColor; (void)fillAlpha;
        for ( int y = 0 ; y < h ; ++y ) {
            unsigned char *row = pixels + y * pitch ;
            for ( int x = 0 ; x < w ; ++x ) {
                unsigned char *p = row + x * 4 ;
                int lum = ( p[ 0 ] * 29 + p[ 1 ] * 150 + p[ 2 ] * 77 ) >> 8 ;
                bool clipped = ( cmpType == 0 ) ? ( lum < cmpParam ) : ( lum > cmpParam ) ;
                if ( clipped ) { p[ 0 ] = p[ 1 ] = p[ 2 ] = p[ 3 ] = 0 ; }
            }
        }
        break ;
    }
    case DX_GRAPH_FILTER_BRIGHT_SCALE:
    case DX_GRAPH_FILTER_PMA_BRIGHT_SCALE: {
        // 引数: int MinBright, int MaxBright
        int mn = va_arg( ap, int ) ;
        int mx = va_arg( ap, int ) ;
        if ( mx <= mn ) mx = mn + 1 ;
        float s = 255.0f / ( float )( mx - mn ) ;
        for ( int y = 0 ; y < h ; ++y ) {
            unsigned char *row = pixels + y * pitch ;
            for ( int x = 0 ; x < w ; ++x ) {
                unsigned char *p = row + x * 4 ;
                for ( int c = 0 ; c < 3 ; ++c ) {
                    int v = p[ c ] ;
                    v = ( int )( ( v - mn ) * s ) ;
                    if ( v < 0 ) v = 0 ; if ( v > 255 ) v = 255 ;
                    p[ c ] = ( unsigned char )v ;
                }
            }
        }
        break ;
    }
    case DX_GRAPH_FILTER_HSB:
    case DX_GRAPH_FILTER_PMA_HSB: {
        // 引数: int Hue (-180..180), int Saturation (-255..255), int Brightness (-255..255)
        int huShift = va_arg( ap, int ) ;
        int stShift = va_arg( ap, int ) ;
        int brShift = va_arg( ap, int ) ;
        float dh = huShift * ( 3.14159265f / 180.0f ) ;
        float cosH = std::cos( dh ) ;
        float sinH = std::sin( dh ) ;
        float ds = stShift / 255.0f ;
        float db = brShift / 255.0f ;
        for ( int y = 0 ; y < h ; ++y ) {
            unsigned char *row = pixels + y * pitch ;
            for ( int x = 0 ; x < w ; ++x ) {
                unsigned char *p = row + x * 4 ;
                // YIQ 色空間で hue 回転 + 彩度スケール + 明度
                float B = p[ 0 ] / 255.0f, G = p[ 1 ] / 255.0f, R = p[ 2 ] / 255.0f ;
                float Y = 0.299f * R + 0.587f * G + 0.114f * B ;
                float I = 0.596f * R - 0.274f * G - 0.322f * B ;
                float Q = 0.211f * R - 0.523f * G + 0.312f * B ;
                // 色相
                float ni = I * cosH - Q * sinH ;
                float nq = I * sinH + Q * cosH ;
                // 彩度
                ni *= ( 1.0f + ds ) ;
                nq *= ( 1.0f + ds ) ;
                // 明度
                Y += db ;
                float nR = Y + 0.956f * ni + 0.621f * nq ;
                float nG = Y - 0.272f * ni - 0.647f * nq ;
                float nB = Y - 1.106f * ni + 1.703f * nq ;
                auto clip = []( float v ) -> unsigned char {
                    if ( v < 0 ) v = 0 ; if ( v > 1 ) v = 1 ; return ( unsigned char )( v * 255 ) ;
                } ;
                p[ 0 ] = clip( nB ) ; p[ 1 ] = clip( nG ) ; p[ 2 ] = clip( nR ) ;
            }
        }
        break ;
    }
    case DX_GRAPH_FILTER_TWO_COLOR: {
        // 引数: int Threshold, int LowR, LowG, LowB, LowA, HighR, HighG, HighB, HighA
        int th = va_arg( ap, int ) ;
        int lR = va_arg( ap, int ), lG = va_arg( ap, int ), lB = va_arg( ap, int ), lA = va_arg( ap, int ) ;
        int hR = va_arg( ap, int ), hG = va_arg( ap, int ), hB = va_arg( ap, int ), hA = va_arg( ap, int ) ;
        for ( int y = 0 ; y < h ; ++y ) {
            unsigned char *row = pixels + y * pitch ;
            for ( int x = 0 ; x < w ; ++x ) {
                unsigned char *p = row + x * 4 ;
                int lum = ( p[ 0 ] * 29 + p[ 1 ] * 150 + p[ 2 ] * 77 ) >> 8 ;
                if ( lum < th ) {
                    p[ 0 ] = ( unsigned char )lB ; p[ 1 ] = ( unsigned char )lG ;
                    p[ 2 ] = ( unsigned char )lR ; p[ 3 ] = ( unsigned char )lA ;
                } else {
                    p[ 0 ] = ( unsigned char )hB ; p[ 1 ] = ( unsigned char )hG ;
                    p[ 2 ] = ( unsigned char )hR ; p[ 3 ] = ( unsigned char )hA ;
                }
            }
        }
        break ;
    }
    default:
        // 未対応 FilterType: 何もしない (no-op) + ログ
        std::fprintf( stderr, "[DxGraphicsFilterDesktop] unsupported FilterType %d\n", filterType ) ;
        break ;
    }

    NS_GraphUnLock( gh ) ;
    return 0 ;
}

// --- DxLib public API (DxGateway.cpp は DX_NON_FILTER で殺されているので
//     ここで user 側 API を提供する、Sound / Image と同じパターン) --------

extern int GraphFilter( int GrHandle, int FilterType, ... )
{
    va_list ap ;
    va_start( ap, FilterType ) ;
    int r = desktop_filter_process_in_place( GrHandle, FilterType, ap ) ;
    va_end( ap ) ;
    return r ;
}

// Src → Dst コピー + フィルタ。Dst が Src と同じサイズならまず copy、
// その後 Dst を in-place 処理。
extern int GraphFilterBlt( int SrcGrHandle, int DestGrHandle, int FilterType, ... )
{
    int sw = 0, sh = 0, dw = 0, dh = 0 ;
    NS_GetGraphSize( SrcGrHandle, &sw, &sh ) ;
    NS_GetGraphSize( DestGrHandle, &dw, &dh ) ;
    if ( sw != dw || sh != dh ) {
        std::fprintf( stderr, "[DxGraphicsFilterDesktop] GraphFilterBlt: size mismatch (src=%dx%d dst=%dx%d)\n", sw, sh, dw, dh ) ;
        return -1 ;
    }
    // Src の BASEIMAGE を取得 → Dst へ ReCreate (コピー) → 内部 in-place
    int srcPitch = 0 ;
    void *srcData = nullptr ;
    COLORDATA *srcCD = nullptr ;
    if ( NS_GraphLock( SrcGrHandle, &srcPitch, &srcData, &srcCD, FALSE ) != 0 ) return -1 ;

    // Dst BASEIMAGE を組んで ReCreate
    BASEIMAGE tmp ;
    std::memset( &tmp, 0, sizeof( tmp ) ) ;
    NS_CreateARGB8ColorData( &tmp.ColorData ) ;
    tmp.Width = sw ; tmp.Height = sh ;
    tmp.Pitch = srcPitch ;
    tmp.GraphData = srcData ;
    tmp.MipMapCount = 0 ;
    tmp.GraphDataCount = 0 ;
    NS_ReCreateGraphFromBaseImage( &tmp, DestGrHandle ) ;
    NS_GraphUnLock( SrcGrHandle ) ;

    // Dst を in-place filter
    va_list ap ;
    va_start( ap, FilterType ) ;
    int r = desktop_filter_process_in_place( DestGrHandle, FilterType, ap ) ;
    va_end( ap ) ;
    return r ;
}

// 矩形 src 領域 → dst 座標、in-place フィルタ付
extern int GraphFilterRectBlt( int SrcGrHandle, int DestGrHandle,
    int SrcX1, int SrcY1, int SrcX2, int SrcY2,
    int DestX, int DestY, int FilterType, ... )
{
    (void)SrcX1; (void)SrcY1; (void)SrcX2; (void)SrcY2; (void)DestX; (void)DestY;
    // 簡易版: rect コピー無視で全面 blt
    va_list ap ;
    va_start( ap, FilterType ) ;
    int r = desktop_filter_process_in_place( DestGrHandle, FilterType, ap ) ;
    va_end( ap ) ;
    (void)SrcGrHandle;  // 本来 src copy を経由するが省略
    return r ;
}

// GraphBlend: 2 画像のブレンド。簡易版は未対応
extern int GraphBlend( int GrHandle, int BlendGraph, int BlendRatio, int BlendType )
{
    (void)GrHandle; (void)BlendGraph; (void)BlendRatio; (void)BlendType;
    std::fprintf( stderr, "[DxGraphicsFilterDesktop] GraphBlend not yet implemented\n" ) ;
    return -1 ;
}

#ifndef DX_NON_NAMESPACE
} // end namespace DxLib
#endif
