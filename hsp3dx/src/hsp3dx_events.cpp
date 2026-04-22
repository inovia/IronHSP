//
//  hsp3dx_events.cpp — イベント queue + HSP ラベル発火
//
//  code_callback() は HSP VM のメインスレッドからしか安全に呼べない。
//  プラットフォーム通知は別スレッドから来るケースがあるため、
//  ここに static queue を挟み、メインループの hsp3dx_events_poll() で
//  順に発火する。queue 長は小さい (16) ので同一イベントが高頻度で来ると
//  弾かれる可能性があるが、UI ライフサイクルは低頻度なので実用上問題なし。
//
#include "hsp3dx_events.h"

#include "../../hsp3/hsp3config.h"
#include "../../hsp3/hsp3code.h"

#include <atomic>
#include <stddef.h>

#if defined(__ANDROID__)
#include <android/log.h>
#define EVT_LOG(...) __android_log_print( ANDROID_LOG_INFO, "hsp3dx.evt", __VA_ARGS__ )
#else
#define EVT_LOG(...) (void)0
#endif

static unsigned short *s_event_labels[HSP3DX_EVT_COUNT] = { nullptr };

//  ---- queue: MPMC ではないが、producer は複数スレッドあり得る ----
//  簡易実装として atomic int の bit flag を使う (同一イベントの複数キュー無視)
static std::atomic<int> s_pending_bits{ 0 };

extern "C" int hsp3dx_events_register( int event_id, unsigned short *label )
{
    if ( event_id < 0 || event_id >= HSP3DX_EVT_COUNT ) return -1;
    s_event_labels[event_id] = label;
    EVT_LOG( "register event=%d label=%p", event_id, (void *)label );
    return 0;
}

extern "C" void hsp3dx_events_fire( int event_id )
{
    if ( event_id < 0 || event_id >= HSP3DX_EVT_COUNT ) return;
    s_pending_bits.fetch_or( 1 << event_id, std::memory_order_acq_rel );
    EVT_LOG( "fire event=%d", event_id );
}

extern "C" void hsp3dx_events_poll( void )
{
    //  pending_bits を atomic に読んで 0 に戻し、立っていた bit について発火
    int pending = s_pending_bits.exchange( 0, std::memory_order_acq_rel );
    if ( pending == 0 ) return;
    EVT_LOG( "poll pending=0x%x", pending );
    for ( int i = 0; i < HSP3DX_EVT_COUNT; i++ ) {
        if ( pending & (1 << i) ) {
            if ( s_event_labels[i] ) {
                EVT_LOG( "  dispatch event=%d label=%p", i, (void *)s_event_labels[i] );
                //  code_callback は gosub 相当で当該ラベルを実行、return で戻る。
                //  例外が飛んだ場合はメインループ側で handle される。
                code_callback( s_event_labels[i] );
            } else {
                EVT_LOG( "  event=%d has no label", i );
            }
        }
    }
}
