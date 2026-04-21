//
//  hsp3dx_ws_ndk.cpp — Android 版 WebSocket (stub、Phase 4.x で本実装)
//
#include "hsp3dx_ws.h"

extern "C" int  hsp3dx_ws_connect( const char *, const char *, int ) { return -1; }
extern "C" void hsp3dx_ws_close  ( int, int ) {}
extern "C" void hsp3dx_ws_free   ( int ) {}
extern "C" int  hsp3dx_ws_send_text  ( int, const char *, size_t ) { return -1; }
extern "C" int  hsp3dx_ws_send_binary( int, const void *, size_t ) { return -1; }
extern "C" int  hsp3dx_ws_recv   ( int, int, void *, size_t, size_t *out_len, int *out_type )
{ if ( out_len ) *out_len = 0; if ( out_type ) *out_type = 0; return -1; }
extern "C" int  hsp3dx_ws_status ( int ) { return 3; /* CLOSED */ }
