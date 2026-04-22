//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop 用 Theora (.ogv) ムービー decoder
//
//      libogg + libtheoradec (bundled) を使って Ogg/Theora ファイルを decode
//      する minimal 実装。DxMovieDesktop.cpp から extern "C" で呼び出す。
//
//      対応: YUV420 / YUV422 / YUV444 全て → BGRA へ CPU 変換。
//      非対応: 音声ストリーム (後段 D4 で libvorbis 側と同期再生する予定)
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#ifdef _WIN32
#include <windows.h>
#endif

#include "../DxCompileConfig.h"
#include "../DxLib.h"

#include <SDL.h>
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <vector>

extern "C" {
#include <ogg/ogg.h>
#include <theora/theoradec.h>
}

// このファイルは extern "C" の API を export するだけなので、namespace DxLib に
// 入れない。中で DxLib.h の型を使わなければ衝突の心配も無い。

// DxMovieDesktop.cpp から参照する最小インターフェース
struct TheoraMovie
{
    FILE           *fp ;
    ogg_sync_state  oy ;
    ogg_stream_state tstream ;
    th_info         tinfo ;
    th_comment      tcomment ;
    th_setup_info  *tsetup ;
    th_dec_ctx     *tctx ;
    int  width ;
    int  height ;
    int  frame_num_n ;
    int  frame_num_d ;
    long long total_frames ;
    long long cur_frame ;
    std::vector<unsigned char> frame_bgra ;
} ;

static void theora_movie_init( TheoraMovie *m )
{
    m->fp = nullptr ;
    std::memset( &m->oy,      0, sizeof( m->oy      ) ) ;
    std::memset( &m->tstream, 0, sizeof( m->tstream ) ) ;
    std::memset( &m->tinfo,    0, sizeof( m->tinfo    ) ) ;
    std::memset( &m->tcomment, 0, sizeof( m->tcomment ) ) ;
    m->tsetup = nullptr ;
    m->tctx   = nullptr ;
    m->width = 0 ; m->height = 0 ;
    m->frame_num_n = 0 ; m->frame_num_d = 0 ;
    m->total_frames = 0 ;
    m->cur_frame = 0 ;
}

// ---- Ogg sync helper --------------------------------------------------
// page を取り出せるまで file から読み続ける
static int theora_buffer_data( TheoraMovie *m )
{
    char *buffer = ogg_sync_buffer( &m->oy, 4096 ) ;
    size_t n = std::fread( buffer, 1, 4096, m->fp ) ;
    ogg_sync_wrote( &m->oy, ( long )n ) ;
    return ( int )n ;
}

// YUV420/422/444 → BGRA 変換 (BT.601 係数、libyuv 無しで十分な品質)
// th_ycbcr_buffer は th_img_plane[3] の typedef なので decay 先の配列 pointer を受ける
static void theora_yuv_to_bgra(
    const th_img_plane *yuv,
    int W, int H,
    unsigned char *dst, int pitch_bytes )
{
    // planeY: [0], planeU: [1], planeV: [2]. U/V は 420 なら幅/高さが半分、
    // 422 なら幅だけ半分、444 なら等倍。
    int cx_shift = 0, cy_shift = 0 ;
    if ( yuv[1].width  < yuv[0].width  ) cx_shift = 1 ;
    if ( yuv[1].height < yuv[0].height ) cy_shift = 1 ;

    for ( int y = 0 ; y < H ; ++y )
    {
        const unsigned char *py = yuv[0].data + y * yuv[0].stride ;
        const unsigned char *pu = yuv[1].data + ( y >> cy_shift ) * yuv[1].stride ;
        const unsigned char *pv = yuv[2].data + ( y >> cy_shift ) * yuv[2].stride ;
        unsigned char *row = dst + y * pitch_bytes ;
        for ( int x = 0 ; x < W ; ++x )
        {
            int Y = py[ x ] ;
            int U = pu[ x >> cx_shift ] - 128 ;
            int V = pv[ x >> cx_shift ] - 128 ;
            int R = Y + ( ( 91881 * V ) >> 16 ) ;
            int G = Y - ( ( 22554 * U + 46802 * V ) >> 16 ) ;
            int B = Y + ( (116130 * U ) >> 16 ) ;
            if ( R < 0 ) R = 0 ; else if ( R > 255 ) R = 255 ;
            if ( G < 0 ) G = 0 ; else if ( G > 255 ) G = 255 ;
            if ( B < 0 ) B = 0 ; else if ( B > 255 ) B = 255 ;
            // DxLib ARGB8 (= BGRA byte order): B, G, R, A
            row[ x * 4 + 0 ] = ( unsigned char )B ;
            row[ x * 4 + 1 ] = ( unsigned char )G ;
            row[ x * 4 + 2 ] = ( unsigned char )R ;
            row[ x * 4 + 3 ] = 255 ;
        }
    }
}

// ---- extern "C" API for DxMovieDesktop.cpp -----------------------------

extern "C" TheoraMovie *Desktop_TheoraOpen( const char *path, int *out_w, int *out_h )
{
    TheoraMovie *m = new TheoraMovie() ;
    theora_movie_init( m ) ;
    m->fp = std::fopen( path, "rb" ) ;
    if ( !m->fp ) { delete m ; return nullptr ; }

    ogg_sync_init( &m->oy ) ;
    th_info_init( &m->tinfo ) ;
    th_comment_init( &m->tcomment ) ;

    // ヘッダ packet を集める: Theora は常に 3 つの header packet を持つ
    int tstream_initialized = 0 ;
    int headers_got = 0 ;
    ogg_page og ;
    ogg_packet op ;

    while ( headers_got < 3 )
    {
        int rv = ogg_sync_pageout( &m->oy, &og ) ;
        if ( rv == 0 ) {
            if ( theora_buffer_data( m ) == 0 ) goto fail ;
            continue ;
        }
        if ( rv < 0 ) continue ;

        if ( !tstream_initialized )
        {
            // 最初のページは BOS。Theora serialno を拾う
            ogg_stream_state test ;
            ogg_stream_init( &test, ogg_page_serialno( &og ) ) ;
            ogg_stream_pagein( &test, &og ) ;
            ogg_stream_packetout( &test, &op ) ;
            int pr = th_decode_headerin( &m->tinfo, &m->tcomment, &m->tsetup, &op ) ;
            if ( pr < 0 ) { ogg_stream_clear( &test ) ; continue ; }
            // OK this is Theora
            m->tstream = test ;
            tstream_initialized = 1 ;
            headers_got = 1 ;
        }
        else
        {
            if ( ogg_stream_pagein( &m->tstream, &og ) < 0 ) continue ;
            while ( headers_got < 3 ) {
                int pr = ogg_stream_packetout( &m->tstream, &op ) ;
                if ( pr == 0 ) break ;
                if ( pr < 0 ) goto fail ;
                if ( th_decode_headerin( &m->tinfo, &m->tcomment, &m->tsetup, &op ) < 0 ) goto fail ;
                headers_got++ ;
            }
        }
    }

    m->tctx = th_decode_alloc( &m->tinfo, m->tsetup ) ;
    if ( !m->tctx ) goto fail ;

    m->width       = ( int )m->tinfo.pic_width  ;
    m->height      = ( int )m->tinfo.pic_height ;
    m->frame_num_n = ( int )m->tinfo.fps_numerator   ;
    m->frame_num_d = ( int )m->tinfo.fps_denominator ;
    if ( m->frame_num_d == 0 ) m->frame_num_d = 1 ;
    *out_w = m->width ;
    *out_h = m->height ;
    return m ;

fail:
    if ( m->tsetup )  { th_setup_free( m->tsetup )  ; m->tsetup  = nullptr ; }
    if ( tstream_initialized ) ogg_stream_clear( &m->tstream ) ;
    ogg_sync_clear( &m->oy ) ;
    th_info_clear( &m->tinfo ) ;
    th_comment_clear( &m->tcomment ) ;
    if ( m->fp ) std::fclose( m->fp ) ;
    delete m ;
    return nullptr ;
}

// 次のフレームを取得して m->frame_bgra に BGRA を入れる。EOS=1、エラー=-1、成功=0
extern "C" int Desktop_TheoraReadFrame( TheoraMovie *m )
{
    ogg_page    og ;
    ogg_packet  op ;
    for ( ; ; )
    {
        int pr = ogg_stream_packetout( &m->tstream, &op ) ;
        if ( pr == 1 )
        {
            ogg_int64_t gpos = -1 ;
            if ( th_decode_packetin( m->tctx, &op, &gpos ) < 0 ) continue ;
            th_ycbcr_buffer yuv ;
            if ( th_decode_ycbcr_out( m->tctx, yuv ) < 0 ) return -1 ;

            m->frame_bgra.resize( ( size_t )m->width * m->height * 4 ) ;
            theora_yuv_to_bgra( yuv, m->width, m->height, m->frame_bgra.data(), m->width * 4 ) ;
            m->cur_frame++ ;
            return 0 ;
        }
        if ( pr < 0 ) continue ;

        // packet が無ければ page を読む
        int rv = ogg_sync_pageout( &m->oy, &og ) ;
        if ( rv == 1 ) {
            ogg_stream_pagein( &m->tstream, &og ) ;
            continue ;
        }
        // データが足りなければファイルから読み足す
        if ( theora_buffer_data( m ) == 0 ) {
            // EOF
            return 1 ;
        }
    }
}

extern "C" void Desktop_TheoraSeekToStart( TheoraMovie *m )
{
    if ( !m || !m->fp ) return ;
    std::rewind( m->fp ) ;
    ogg_sync_reset( &m->oy ) ;
    // stream state は再構築する必要がある (単純には close + open が楽)
    // ここでは packet 側をリセットするのみ (page 読み直しで復元)
    ogg_stream_reset( &m->tstream ) ;
    m->cur_frame = 0 ;
}

extern "C" int Desktop_TheoraFps( TheoraMovie *m, int *num, int *den )
{
    if ( !m ) return -1 ;
    *num = m->frame_num_n ;
    *den = m->frame_num_d ;
    return 0 ;
}

extern "C" const unsigned char *Desktop_TheoraFrameBGRA( TheoraMovie *m, int *bytes )
{
    if ( !m || m->frame_bgra.empty() ) { *bytes = 0 ; return nullptr ; }
    *bytes = ( int )m->frame_bgra.size() ;
    return m->frame_bgra.data() ;
}

extern "C" void Desktop_TheoraClose( TheoraMovie *m )
{
    if ( !m ) return ;
    if ( m->tctx )   { th_decode_free( m->tctx )   ; m->tctx   = nullptr ; }
    if ( m->tsetup ) { th_setup_free ( m->tsetup ) ; m->tsetup = nullptr ; }
    ogg_stream_clear( &m->tstream ) ;
    ogg_sync_clear( &m->oy ) ;
    th_info_clear( &m->tinfo ) ;
    th_comment_clear( &m->tcomment ) ;
    if ( m->fp ) std::fclose( m->fp ) ;
    delete m ;
}
