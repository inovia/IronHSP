//
//  hsp3dx_ws_ios.mm — iOS 版 WebSocket (NSURLSessionWebSocketTask、iOS 13+)
//
//  Android の HspWebSocket.java と対応。受信は非同期 completion handler で
//  NSMutableArray にキューイングし、hsp3dx_ws_recv がポーリングで取り出す。
//  ペイロードフォーマット: type (0=TEXT/1=BIN) は int 戻り値で返す。
//
#include "hsp3dx_ws.h"

#import <Foundation/Foundation.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//  ---- 1 接続ぶんの状態 ----
@interface HspWSSession : NSObject <NSURLSessionWebSocketDelegate>
@property (assign) int handle;
@property (assign) volatile int status;   // 0=OPEN, 1=CONNECTING, 2=CLOSING, 3=CLOSED
@property (strong) NSURLSession                *session;
@property (strong) NSURLSessionWebSocketTask   *task;
@property (strong) NSMutableArray<NSDictionary *> *queue;   // {@"type": NSNumber, @"data": NSData}
@property (strong) NSCondition                 *cond;
- (void) beginReceiveLoop;
@end

@implementation HspWSSession

- (instancetype) init {
    self = [super init];
    if ( self ) {
        _status = 1;   // CONNECTING
        _queue  = [NSMutableArray array];
        _cond   = [[NSCondition alloc] init];
    }
    return self;
}

- (void) URLSession:(NSURLSession *)session
     webSocketTask:(NSURLSessionWebSocketTask *)webSocketTask
   didOpenWithProtocol:(NSString *)protocol
{
    self.status = 0;   // OPEN
}

- (void) URLSession:(NSURLSession *)session
     webSocketTask:(NSURLSessionWebSocketTask *)webSocketTask
   didCloseWithCode:(NSURLSessionWebSocketCloseCode)closeCode
             reason:(NSData *)reason
{
    self.status = 3;   // CLOSED
    [self.cond lock];
    [self.cond broadcast];
    [self.cond unlock];
}

- (void) URLSession:(NSURLSession *)session
               task:(NSURLSessionTask *)task
didCompleteWithError:(NSError *)error
{
    if ( error ) self.status = 3;
    [self.cond lock];
    [self.cond broadcast];
    [self.cond unlock];
}

- (void) beginReceiveLoop
{
    __weak HspWSSession *weakSelf = self;
    [self.task receiveMessageWithCompletionHandler:^(NSURLSessionWebSocketMessage *msg, NSError *err) {
        HspWSSession *s = weakSelf;
        if ( !s ) return;
        if ( err ) {
            s.status = 3;
            [s.cond lock]; [s.cond broadcast]; [s.cond unlock];
            return;
        }
        NSData *d = nil;
        int type = 0;
        if ( msg.type == NSURLSessionWebSocketMessageTypeString ) {
            d = [msg.string dataUsingEncoding:NSUTF8StringEncoding];
            type = 0;
        } else {
            d = msg.data;
            type = 1;
        }
        if ( d ) {
            [s.cond lock];
            [s.queue addObject:@{ @"type": @(type), @"data": d }];
            [s.cond broadcast];
            [s.cond unlock];
        }
        //  次のメッセージを待つ (再帰)
        if ( s.status != 3 ) [s beginReceiveLoop];
    }];
}

@end

//  ---- ハンドル管理 ----
static NSMutableDictionary<NSNumber *, HspWSSession *> *g_sessions = nil;
static int g_next_id = 0;

static void ensure_sessions( void )
{
    if ( !g_sessions ) g_sessions = [NSMutableDictionary dictionary];
}

extern "C" int hsp3dx_ws_connect( const char *url, const char *xhdr, int timeout_ms )
{
    @autoreleasepool {
        ensure_sessions();
        if ( !url || !*url ) return -1;
        NSURL *u = [NSURL URLWithString:[NSString stringWithUTF8String:url]];
        if ( !u ) return -1;

        NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:u];
        if ( timeout_ms > 0 ) [req setTimeoutInterval:timeout_ms / 1000.0];
        if ( xhdr && *xhdr ) {
            NSArray *lines = [[NSString stringWithUTF8String:xhdr]
                                componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
            for ( NSString *line in lines ) {
                NSRange r = [line rangeOfString:@":"];
                if ( r.location == NSNotFound ) continue;
                NSString *k = [[line substringToIndex:r.location]
                                stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                NSString *v = [[line substringFromIndex:r.location + 1]
                                stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                if ( k.length > 0 ) [req setValue:v forHTTPHeaderField:k];
            }
        }

        HspWSSession *s = [[HspWSSession alloc] init];
        s.handle = ++g_next_id;

        NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
        if ( timeout_ms > 0 ) conf.timeoutIntervalForRequest = timeout_ms / 1000.0;
        s.session = [NSURLSession sessionWithConfiguration:conf delegate:s delegateQueue:nil];
        s.task    = [s.session webSocketTaskWithRequest:req];
        [s.task resume];
        [s beginReceiveLoop];

        g_sessions[@(s.handle)] = s;

        //  OPEN or CLOSED を待つ (最大 timeout)
        NSTimeInterval to = timeout_ms > 0 ? timeout_ms / 1000.0 : 30.0;
        NSDate *deadline = [NSDate dateWithTimeIntervalSinceNow:to];
        [s.cond lock];
        while ( s.status == 1 && [deadline timeIntervalSinceNow] > 0 ) {
            [s.cond waitUntilDate:deadline];
        }
        [s.cond unlock];

        if ( s.status != 0 ) {
            [g_sessions removeObjectForKey:@(s.handle)];
            NSLog( @"hsp3dx.ws: connect failed (status=%d) url=%s", s.status, url );
            return -1;
        }
        NSLog( @"hsp3dx.ws: connected handle=%d url=%s", s.handle, url );
        return s.handle;
    }
}

extern "C" void hsp3dx_ws_close( int handle, int code )
{
    ensure_sessions();
    HspWSSession *s = g_sessions[@(handle)];
    if ( !s ) return;
    s.status = 2;   // CLOSING
    [s.task cancelWithCloseCode:(NSURLSessionWebSocketCloseCode)( code > 0 ? code : 1000 )
                         reason:nil];
}

extern "C" void hsp3dx_ws_free( int handle )
{
    ensure_sessions();
    HspWSSession *s = g_sessions[@(handle)];
    if ( !s ) return;
    if ( s.status != 3 ) {
        [s.task cancelWithCloseCode:NSURLSessionWebSocketCloseCodeNormalClosure reason:nil];
    }
    [s.session invalidateAndCancel];
    [g_sessions removeObjectForKey:@(handle)];
}

extern "C" int hsp3dx_ws_send_text( int handle, const char *text, size_t len )
{
    ensure_sessions();
    HspWSSession *s = g_sessions[@(handle)];
    if ( !s || s.status != 0 ) return -1;

    NSString *str = nil;
    if ( text && len > 0 ) {
        str = [[NSString alloc] initWithBytes:text length:len encoding:NSUTF8StringEncoding];
    } else {
        str = @"";
    }
    NSURLSessionWebSocketMessage *msg =
        [[NSURLSessionWebSocketMessage alloc] initWithString:str];

    __block int rc = 0;
    dispatch_semaphore_t sem = dispatch_semaphore_create( 0 );
    [s.task sendMessage:msg completionHandler:^( NSError *err ) {
        if ( err ) rc = -1;
        dispatch_semaphore_signal( sem );
    }];
    dispatch_semaphore_wait( sem, DISPATCH_TIME_FOREVER );
    return rc;
}

extern "C" int hsp3dx_ws_send_binary( int handle, const void *data, size_t len )
{
    ensure_sessions();
    HspWSSession *s = g_sessions[@(handle)];
    if ( !s || s.status != 0 ) return -1;

    NSData *nd = [NSData dataWithBytes:data length:len];
    NSURLSessionWebSocketMessage *msg =
        [[NSURLSessionWebSocketMessage alloc] initWithData:nd];

    __block int rc = 0;
    dispatch_semaphore_t sem = dispatch_semaphore_create( 0 );
    [s.task sendMessage:msg completionHandler:^( NSError *err ) {
        if ( err ) rc = -1;
        dispatch_semaphore_signal( sem );
    }];
    dispatch_semaphore_wait( sem, DISPATCH_TIME_FOREVER );
    return rc;
}

extern "C" int hsp3dx_ws_recv( int handle, int timeout_ms,
                                void *out, size_t out_cap,
                                size_t *out_len, int *out_type )
{
    if ( out_len )  *out_len  = 0;
    if ( out_type ) *out_type = 0;
    ensure_sessions();
    HspWSSession *s = g_sessions[@(handle)];
    if ( !s ) return -1;

    NSDictionary *msg = nil;
    [s.cond lock];
    if ( s.queue.count == 0 ) {
        if ( s.status == 3 ) { [s.cond unlock]; return -1; }
        if ( timeout_ms > 0 ) {
            NSDate *deadline = [NSDate dateWithTimeIntervalSinceNow:timeout_ms / 1000.0];
            while ( s.queue.count == 0 && s.status != 3 && [deadline timeIntervalSinceNow] > 0 ) {
                [s.cond waitUntilDate:deadline];
            }
        }
    }
    if ( s.queue.count > 0 ) {
        msg = s.queue.firstObject;
        [s.queue removeObjectAtIndex:0];
    }
    [s.cond unlock];

    if ( !msg ) {
        return s.status == 3 ? -1 : 1;   // 1 = タイムアウト
    }

    int type = [msg[@"type"] intValue];
    NSData *data = msg[@"data"];
    size_t L = data.length;
    if ( out ) {
        size_t cp = L < out_cap ? L : ( out_cap > 0 ? out_cap - 1 : 0 );
        if ( cp > 0 ) memcpy( out, data.bytes, cp );
        if ( out_cap > 0 ) ((char *)out)[cp] = 0;
        if ( out_len ) *out_len = cp;
    } else {
        if ( out_len ) *out_len = L;
    }
    if ( out_type ) *out_type = type;
    return 0;
}

extern "C" int hsp3dx_ws_status( int handle )
{
    ensure_sessions();
    HspWSSession *s = g_sessions[@(handle)];
    return s ? s.status : 3;
}
