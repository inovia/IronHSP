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
#define NOMINMAX 1
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
#include <vector>

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
    case DX_GRAPH_FILTER_GAUSS: {
        // 引数: int PixelWidth (4/8/16), int Param (係数、通常 1000)
        int pw = va_arg( ap, int ) ;
        int param = va_arg( ap, int ) ;
        (void)param;
        int radius = pw > 0 ? pw / 2 : 1 ;
        if ( radius < 1 ) radius = 1 ;
        // separable Gaussian: σ = radius/2 相当で 1D kernel を作成
        double sigma = radius * 0.5 ;
        std::vector<float> kernel( 2 * radius + 1 ) ;
        double sum = 0 ;
        for ( int i = -radius ; i <= radius ; ++i ) {
            double v = std::exp( -( i * i ) / ( 2.0 * sigma * sigma ) ) ;
            kernel[ i + radius ] = ( float )v ;
            sum += v ;
        }
        for ( float &v : kernel ) v = ( float )( v / sum ) ;

        std::vector<unsigned char> tmp( ( size_t )w * h * 4 ) ;
        // horizontal pass
        for ( int y = 0 ; y < h ; ++y ) {
            for ( int x = 0 ; x < w ; ++x ) {
                float r = 0, g = 0, b = 0, a = 0 ;
                for ( int k = -radius ; k <= radius ; ++k ) {
                    int sx = x + k ; if ( sx < 0 ) sx = 0 ; if ( sx >= w ) sx = w - 1 ;
                    const unsigned char *p = pixels + y * pitch + sx * 4 ;
                    float kk = kernel[ k + radius ] ;
                    b += p[0] * kk ; g += p[1] * kk ; r += p[2] * kk ; a += p[3] * kk ;
                }
                unsigned char *o = tmp.data() + ( ( size_t )y * w + x ) * 4 ;
                o[0] = ( unsigned char )( b + 0.5f ) ; o[1] = ( unsigned char )( g + 0.5f ) ;
                o[2] = ( unsigned char )( r + 0.5f ) ; o[3] = ( unsigned char )( a + 0.5f ) ;
            }
        }
        // vertical pass → pixels に書き戻し
        for ( int y = 0 ; y < h ; ++y ) {
            for ( int x = 0 ; x < w ; ++x ) {
                float r = 0, g = 0, b = 0, a = 0 ;
                for ( int k = -radius ; k <= radius ; ++k ) {
                    int sy = y + k ; if ( sy < 0 ) sy = 0 ; if ( sy >= h ) sy = h - 1 ;
                    const unsigned char *p = tmp.data() + ( ( size_t )sy * w + x ) * 4 ;
                    float kk = kernel[ k + radius ] ;
                    b += p[0] * kk ; g += p[1] * kk ; r += p[2] * kk ; a += p[3] * kk ;
                }
                unsigned char *o = pixels + y * pitch + x * 4 ;
                o[0] = ( unsigned char )( b + 0.5f ) ; o[1] = ( unsigned char )( g + 0.5f ) ;
                o[2] = ( unsigned char )( r + 0.5f ) ; o[3] = ( unsigned char )( a + 0.5f ) ;
            }
        }
        break ;
    }
    case DX_GRAPH_FILTER_LEVEL: {
        // 引数: int MinIn, int MaxIn, double Gamma, int MinOut, int MaxOut
        int mnIn  = va_arg( ap, int ) ;
        int mxIn  = va_arg( ap, int ) ;
        double gm = va_arg( ap, double ) ;
        int mnOut = va_arg( ap, int ) ;
        int mxOut = va_arg( ap, int ) ;
        if ( mxIn == mnIn ) mxIn = mnIn + 1 ;
        if ( gm < 0.01 ) gm = 1.0 ;
        unsigned char lut[ 256 ] ;
        for ( int i = 0 ; i < 256 ; ++i ) {
            double t = ( double )( i - mnIn ) / ( mxIn - mnIn ) ;
            if ( t < 0 ) t = 0 ; if ( t > 1 ) t = 1 ;
            t = std::pow( t, 1.0 / gm ) ;
            int out = ( int )( mnOut + t * ( mxOut - mnOut ) ) ;
            if ( out < 0 ) out = 0 ; if ( out > 255 ) out = 255 ;
            lut[ i ] = ( unsigned char )out ;
        }
        for ( int y = 0 ; y < h ; ++y ) {
            unsigned char *row = pixels + y * pitch ;
            for ( int x = 0 ; x < w ; ++x ) {
                unsigned char *p = row + x * 4 ;
                p[0] = lut[ p[0] ] ; p[1] = lut[ p[1] ] ; p[2] = lut[ p[2] ] ;
            }
        }
        break ;
    }
    case DX_GRAPH_FILTER_GRADIENT_MAP: {
        // 引数: int MapGrHandle (0..255 の 1D グラデーション画像、色マップ),
        //        int Reverse (TRUE=右から)
        int mapH = va_arg( ap, int ) ;
        int reverse = va_arg( ap, int ) ;
        // グラデーション画像を取得 (256 色テーブル化)
        int mw = 0, mh = 0 ;
        NS_GetGraphSize( mapH, &mw, &mh ) ;
        if ( mw <= 0 ) break ;
        int mpitch = 0 ; void *mdata = nullptr ; COLORDATA *mcd = nullptr ;
        // 一旦 base を解放
        NS_GraphUnLock( gh ) ;
        if ( NS_GraphLock( mapH, &mpitch, &mdata, &mcd, FALSE ) != 0 ) {
            NS_GraphLock( gh, &pitch, &data, &cd, FALSE ) ;
            pixels = ( unsigned char * )data ;
            break ;
        }
        // 256 バケットに compress (nearest)
        unsigned char palette[ 256 ][ 4 ] ;
        for ( int i = 0 ; i < 256 ; ++i ) {
            int u = ( i * ( mw - 1 ) ) / 255 ;
            if ( reverse ) u = mw - 1 - u ;
            const unsigned char *mp = ( const unsigned char * )mdata + u * 4 ;
            palette[ i ][ 0 ] = mp[ 0 ] ; palette[ i ][ 1 ] = mp[ 1 ] ;
            palette[ i ][ 2 ] = mp[ 2 ] ; palette[ i ][ 3 ] = mp[ 3 ] ;
        }
        NS_GraphUnLock( mapH ) ;
        // 再 lock
        if ( NS_GraphLock( gh, &pitch, &data, &cd, FALSE ) != 0 ) return -1 ;
        pixels = ( unsigned char * )data ;
        for ( int y = 0 ; y < h ; ++y ) {
            unsigned char *row = pixels + y * pitch ;
            for ( int x = 0 ; x < w ; ++x ) {
                unsigned char *p = row + x * 4 ;
                int lum = ( p[0] * 29 + p[1] * 150 + p[2] * 77 ) >> 8 ;
                p[0] = palette[ lum ][ 0 ] ; p[1] = palette[ lum ][ 1 ] ;
                p[2] = palette[ lum ][ 2 ] ;
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

// ----- BICUBIC / LANCZOS3 scaling helper (dst サイズ != src サイズ 対応) ----

static inline float bicubic_weight( float t )
{
    // Catmull-Rom (a = -0.5) の bicubic カーネル
    float at = t < 0 ? -t : t ;
    if ( at < 1.0f ) return 1.5f * at * at * at - 2.5f * at * at + 1.0f ;
    if ( at < 2.0f ) return -0.5f * at * at * at + 2.5f * at * at - 4.0f * at + 2.0f ;
    return 0 ;
}

static inline float lanczos3_weight( float t )
{
    if ( t == 0 ) return 1.0f ;
    if ( t < 0 ) t = -t ;
    if ( t >= 3.0f ) return 0 ;
    float px = 3.14159265f * t ;
    return 3.0f * std::sin( px ) * std::sin( px / 3.0f ) / ( px * px ) ;
}

static int desktop_resample(
    const unsigned char *src, int srcPitch, int srcW, int srcH,
          unsigned char *dst, int dstPitch, int dstW, int dstH,
    float (*kern)( float ), int support )
{
    float sx_ratio = ( float )srcW / dstW ;
    float sy_ratio = ( float )srcH / dstH ;
    for ( int y = 0 ; y < dstH ; ++y )
    {
        float syf = ( y + 0.5f ) * sy_ratio - 0.5f ;
        int   syi = ( int )std::floor( syf ) ;
        for ( int x = 0 ; x < dstW ; ++x )
        {
            float sxf = ( x + 0.5f ) * sx_ratio - 0.5f ;
            int   sxi = ( int )std::floor( sxf ) ;
            float acc[ 4 ] = { 0, 0, 0, 0 } ;
            float wsum = 0 ;
            for ( int j = -support + 1 ; j <= support ; ++j )
            {
                int yy = syi + j ; if ( yy < 0 ) yy = 0 ; if ( yy >= srcH ) yy = srcH - 1 ;
                float wy = kern( syf - ( syi + j ) ) ;
                for ( int i = -support + 1 ; i <= support ; ++i )
                {
                    int xx = sxi + i ; if ( xx < 0 ) xx = 0 ; if ( xx >= srcW ) xx = srcW - 1 ;
                    float wx = kern( sxf - ( sxi + i ) ) ;
                    float w = wx * wy ;
                    const unsigned char *p = src + yy * srcPitch + xx * 4 ;
                    acc[ 0 ] += p[0] * w ; acc[ 1 ] += p[1] * w ;
                    acc[ 2 ] += p[2] * w ; acc[ 3 ] += p[3] * w ;
                    wsum += w ;
                }
            }
            if ( wsum <= 0 ) wsum = 1 ;
            unsigned char *o = dst + y * dstPitch + x * 4 ;
            for ( int c = 0 ; c < 4 ; ++c ) {
                int v = ( int )( acc[ c ] / wsum + 0.5f ) ;
                if ( v < 0 ) v = 0 ; if ( v > 255 ) v = 255 ;
                o[ c ] = ( unsigned char )v ;
            }
        }
    }
    return 0 ;
}

// Src → Dst コピー + フィルタ。
// BICUBIC / LANCZOS3 は Src != Dst サイズで resample、それ以外は同サイズ in-place。
extern int GraphFilterBlt( int SrcGrHandle, int DestGrHandle, int FilterType, ... )
{
    int sw = 0, sh = 0, dw = 0, dh = 0 ;
    NS_GetGraphSize( SrcGrHandle, &sw, &sh ) ;
    NS_GetGraphSize( DestGrHandle, &dw, &dh ) ;

    // BICUBIC / LANCZOS3 は resample フィルタ (サイズ変更可)
    if ( FilterType == DX_GRAPH_FILTER_BICUBIC_SCALE ||
         FilterType == DX_GRAPH_FILTER_LANCZOS3_SCALE )
    {
        if ( sw <= 0 || sh <= 0 || dw <= 0 || dh <= 0 ) return -1 ;
        int srcP = 0 ; void *srcD = nullptr ; COLORDATA *srcCD = nullptr ;
        if ( NS_GraphLock( SrcGrHandle, &srcP, &srcD, &srcCD, FALSE ) != 0 ) return -1 ;
        std::vector<unsigned char> src_copy( ( size_t )srcP * sh ) ;
        std::memcpy( src_copy.data(), srcD, src_copy.size() ) ;
        NS_GraphUnLock( SrcGrHandle ) ;

        int dstP = 0 ; void *dstD = nullptr ; COLORDATA *dstCD = nullptr ;
        if ( NS_GraphLock( DestGrHandle, &dstP, &dstD, &dstCD, FALSE ) != 0 ) return -1 ;
        float (*kern)( float ) = ( FilterType == DX_GRAPH_FILTER_BICUBIC_SCALE ) ? bicubic_weight : lanczos3_weight ;
        int support = ( FilterType == DX_GRAPH_FILTER_BICUBIC_SCALE ) ? 2 : 3 ;
        desktop_resample( src_copy.data(), srcP, sw, sh,
                          ( unsigned char * )dstD, dstP, dw, dh,
                          kern, support ) ;
        NS_GraphUnLock( DestGrHandle ) ;
        return 0 ;
    }

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

// ----- GraphBlend 実装 -----------------------------------------------------
// 2 画像を BlendType に従って合成し、base (GrHandle) を更新する。
// BlendRatio は 0..255 (0=src のまま、255=blend 100% 適用)。
// 入出力は BGRA バイト順 (DxLib 内部 ARGB8)。

static inline int clampi( int v, int lo, int hi ) { return v < lo ? lo : ( v > hi ? hi : v ) ; }

static int desktop_blend_pixels( unsigned char *base, int bpitch,
                                  const unsigned char *blend, int sppitch,
                                  int w, int h, int ratio, int blendType )
{
    if ( ratio < 0 ) ratio = 0 ;
    if ( ratio > 255 ) ratio = 255 ;
    for ( int y = 0 ; y < h ; ++y )
    {
        unsigned char *D = base  + y * bpitch ;
        const unsigned char *S = blend + y * sppitch ;
        for ( int x = 0 ; x < w ; ++x )
        {
            // BGRA バイト順
            int dB = D[0], dG = D[1], dR = D[2], dA = D[3] ;
            int sB = S[0], sG = S[1], sR = S[2], sA = S[3] ;
            int oR = dR, oG = dG, oB = dB, oA = dA ;

            switch ( blendType )
            {
            case 0 /*NORMAL*/:
                // src alpha で補間した後に ratio で元画像と線形補間
                {
                    int a = sA ;
                    oR = ( dR * ( 255 - a ) + sR * a ) / 255 ;
                    oG = ( dG * ( 255 - a ) + sG * a ) / 255 ;
                    oB = ( dB * ( 255 - a ) + sB * a ) / 255 ;
                }
                break ;
            case 2 /*MULTIPLE*/:
                oR = ( dR * sR ) / 255 ;
                oG = ( dG * sG ) / 255 ;
                oB = ( dB * sB ) / 255 ;
                break ;
            case 3 /*DIFFERENCE*/:
                oR = dR > sR ? dR - sR : sR - dR ;
                oG = dG > sG ? dG - sG : sG - dG ;
                oB = dB > sB ? dB - sB : sB - dB ;
                break ;
            case 4 /*ADD*/:
                oR = clampi( dR + sR, 0, 255 ) ;
                oG = clampi( dG + sG, 0, 255 ) ;
                oB = clampi( dB + sB, 0, 255 ) ;
                break ;
            case 5 /*SCREEN*/:
                oR = 255 - ( ( 255 - dR ) * ( 255 - sR ) ) / 255 ;
                oG = 255 - ( ( 255 - dG ) * ( 255 - sG ) ) / 255 ;
                oB = 255 - ( ( 255 - dB ) * ( 255 - sB ) ) / 255 ;
                break ;
            case 6 /*OVERLAY*/:
                oR = dR < 128 ? ( 2 * dR * sR ) / 255 : 255 - ( 2 * ( 255 - dR ) * ( 255 - sR ) ) / 255 ;
                oG = dG < 128 ? ( 2 * dG * sG ) / 255 : 255 - ( 2 * ( 255 - dG ) * ( 255 - sG ) ) / 255 ;
                oB = dB < 128 ? ( 2 * dB * sB ) / 255 : 255 - ( 2 * ( 255 - dB ) * ( 255 - sB ) ) / 255 ;
                break ;
            case 7 /*DODGE*/:
                oR = sR >= 255 ? 255 : clampi( ( dR * 255 ) / ( 255 - sR ), 0, 255 ) ;
                oG = sG >= 255 ? 255 : clampi( ( dG * 255 ) / ( 255 - sG ), 0, 255 ) ;
                oB = sB >= 255 ? 255 : clampi( ( dB * 255 ) / ( 255 - sB ), 0, 255 ) ;
                break ;
            case 8 /*BURN*/:
                oR = sR == 0 ? 0 : clampi( 255 - ( ( 255 - dR ) * 255 ) / sR, 0, 255 ) ;
                oG = sG == 0 ? 0 : clampi( 255 - ( ( 255 - dG ) * 255 ) / sG, 0, 255 ) ;
                oB = sB == 0 ? 0 : clampi( 255 - ( ( 255 - dB ) * 255 ) / sB, 0, 255 ) ;
                break ;
            case 9 /*DARKEN*/:
                oR = std::min( dR, sR ) ;
                oG = std::min( dG, sG ) ;
                oB = std::min( dB, sB ) ;
                break ;
            case 10 /*LIGHTEN*/:
                oR = std::max( dR, sR ) ;
                oG = std::max( dG, sG ) ;
                oB = std::max( dB, sB ) ;
                break ;
            case 11 /*SOFTLIGHT*/:
                {
                    auto sl = []( int d, int s ) -> int {
                        if ( s < 128 ) return ( d * ( 256 - ( 255 - 2 * s ) * ( 255 - d ) / 255 ) ) / 256 ;
                        return d + ( ( 2 * s - 255 ) * ( d - d*d/255 ) ) / 255 ;
                    } ;
                    oR = clampi( sl( dR, sR ), 0, 255 ) ;
                    oG = clampi( sl( dG, sG ), 0, 255 ) ;
                    oB = clampi( sl( dB, sB ), 0, 255 ) ;
                }
                break ;
            case 12 /*HARDLIGHT*/:
                oR = sR < 128 ? ( 2 * dR * sR ) / 255 : 255 - ( 2 * ( 255 - dR ) * ( 255 - sR ) ) / 255 ;
                oG = sG < 128 ? ( 2 * dG * sG ) / 255 : 255 - ( 2 * ( 255 - dG ) * ( 255 - sG ) ) / 255 ;
                oB = sB < 128 ? ( 2 * dB * sB ) / 255 : 255 - ( 2 * ( 255 - dB ) * ( 255 - sB ) ) / 255 ;
                break ;
            case 13 /*EXCLUSION*/:
                oR = clampi( dR + sR - ( 2 * dR * sR ) / 255, 0, 255 ) ;
                oG = clampi( dG + sG - ( 2 * dG * sG ) / 255, 0, 255 ) ;
                oB = clampi( dB + sB - ( 2 * dB * sB ) / 255, 0, 255 ) ;
                break ;
            case 14 /*NORMAL_ALPHACH*/:
                {
                    // src alpha channel で線形補間 + alpha も合成
                    int a = sA ;
                    oR = ( dR * ( 255 - a ) + sR * a ) / 255 ;
                    oG = ( dG * ( 255 - a ) + sG * a ) / 255 ;
                    oB = ( dB * ( 255 - a ) + sB * a ) / 255 ;
                    oA = clampi( dA + a * ( 255 - dA ) / 255, 0, 255 ) ;
                }
                break ;
            case 15 /*ADD_ALPHACH*/:
                oR = clampi( dR + sR * sA / 255, 0, 255 ) ;
                oG = clampi( dG + sG * sA / 255, 0, 255 ) ;
                oB = clampi( dB + sB * sA / 255, 0, 255 ) ;
                break ;
            case 16 /*MULTIPLE_A_ONLY*/:
                oA = ( dA * sA ) / 255 ;
                break ;
            default:
                // 未対応 (RGBA_SELECT_MIX / PMA_* 等) は元画像維持
                break ;
            }

            // BlendRatio で元画像と最終結果を線形補間
            if ( ratio != 255 )
            {
                oR = ( dR * ( 255 - ratio ) + oR * ratio ) / 255 ;
                oG = ( dG * ( 255 - ratio ) + oG * ratio ) / 255 ;
                oB = ( dB * ( 255 - ratio ) + oB * ratio ) / 255 ;
                oA = ( dA * ( 255 - ratio ) + oA * ratio ) / 255 ;
            }

            D[0] = ( unsigned char )clampi( oB, 0, 255 ) ;
            D[1] = ( unsigned char )clampi( oG, 0, 255 ) ;
            D[2] = ( unsigned char )clampi( oR, 0, 255 ) ;
            D[3] = ( unsigned char )clampi( oA, 0, 255 ) ;
            D += 4 ; S += 4 ;
        }
    }
    return 0 ;
}

extern int GraphBlend( int GrHandle, int BlendGraph, int BlendRatio, int BlendType )
{
    int bw = 0, bh = 0, sw = 0, sh = 0 ;
    NS_GetGraphSize( GrHandle,   &bw, &bh ) ;
    NS_GetGraphSize( BlendGraph, &sw, &sh ) ;
    if ( bw <= 0 || bh <= 0 || sw <= 0 || sh <= 0 ) return -1 ;
    int w = std::min( bw, sw ), h = std::min( bh, sh ) ;

    int bpitch = 0, sppitch = 0 ;
    void *bdata = nullptr, *sdata = nullptr ;
    COLORDATA *bcd = nullptr, *scd = nullptr ;
    if ( NS_GraphLock( GrHandle,   &bpitch, &bdata, &bcd, FALSE ) != 0 ) return -1 ;
    // 2 枚同時 Lock はグローバル state が 1 本なので、blend 側をまず temp 取得
    // → base を lock する前に blend の image データをコピーしておく
    // ここでは素朴に「base lock → blend lock → unlock blend → blend in memory → unlock base」
    // の順が不可能。代案: GraphLock を 2 回目呼ぶと最初の lock が上書きされるため、
    // blend side は先に GetGraphImageFullColorCode 相当で読み取り配列を作る。
    std::vector<unsigned char> blend_argb( ( size_t )sw * sh * 4 ) ;
    NS_GraphUnLock( GrHandle ) ;  // 一旦解放してから blend 側を取得
    if ( NS_GraphLock( BlendGraph, &sppitch, &sdata, &scd, FALSE ) != 0 ) return -1 ;
    for ( int y = 0 ; y < sh ; ++y ) {
        std::memcpy( &blend_argb[ ( size_t )y * sw * 4 ],
                     ( const unsigned char * )sdata + y * sppitch,
                     ( size_t )sw * 4 ) ;
    }
    NS_GraphUnLock( BlendGraph ) ;
    // base 再 lock
    if ( NS_GraphLock( GrHandle, &bpitch, &bdata, &bcd, FALSE ) != 0 ) return -1 ;
    desktop_blend_pixels( ( unsigned char * )bdata, bpitch,
                          blend_argb.data(), sw * 4,
                          w, h, BlendRatio, BlendType ) ;
    NS_GraphUnLock( GrHandle ) ;
    return 0 ;
}

#ifndef DX_NON_NAMESPACE
} // end namespace DxLib
#endif
