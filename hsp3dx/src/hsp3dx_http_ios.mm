//
//  hsp3dx_http_ios.mm — iOS 版 HTTP クライアント (NSURLSession)
//
//  Android と違い JNI ブリッジ不要、Obj-C で直接書ける。
//  multipart は NSURLSession で NSMutableData を自前で構築して送る。
//
#include "hsp3dx_http.h"

#import <Foundation/Foundation.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//  ---- 共通: ヘッダ文字列 → NSMutableURLRequest に反映 ----
static void apply_headers( NSMutableURLRequest *req, const char *ua,
                            const char *content_type, const char *extra_headers )
{
    if ( ua && *ua ) {
        [req setValue:[NSString stringWithUTF8String:ua] forHTTPHeaderField:@"User-Agent"];
    } else {
        [req setValue:@"hsp3dx/1.0" forHTTPHeaderField:@"User-Agent"];
    }
    if ( content_type && *content_type ) {
        [req setValue:[NSString stringWithUTF8String:content_type] forHTTPHeaderField:@"Content-Type"];
    }
    if ( extra_headers && *extra_headers ) {
        NSString *src = [NSString stringWithUTF8String:extra_headers];
        NSArray *lines = [src componentsSeparatedByCharactersInSet:
                            [NSCharacterSet newlineCharacterSet]];
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
}

static int do_request( const char *method, const char *url,
                        const void *body, size_t size,
                        const char *content_type,
                        const char *user_agent,
                        const char *extra_headers,
                        int timeout_ms,
                        hsp3dx_http_response *out )
{
    if ( out ) { out->status = 0; out->body = nullptr; out->size = 0; out->headers = nullptr; }

    @autoreleasepool {
        NSString *us = url ? [NSString stringWithUTF8String:url] : @"";
        NSURL *u = [NSURL URLWithString:us];
        if ( !u ) return -1;

        NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:u];
        [req setHTTPMethod:[NSString stringWithUTF8String:(method ? method : "GET")]];
        [req setTimeoutInterval:( timeout_ms > 0 ? timeout_ms / 1000.0 : 30.0 )];
        apply_headers( req, user_agent, content_type, extra_headers );

        if ( body && size > 0 ) {
            [req setHTTPBody:[NSData dataWithBytes:body length:size]];
        }

        __block NSData *respData = nil;
        __block NSURLResponse *respObj = nil;
        __block NSError *respErr = nil;
        dispatch_semaphore_t sem = dispatch_semaphore_create( 0 );

        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:req
            completionHandler:^( NSData *d, NSURLResponse *r, NSError *e ) {
                respData = d;
                respObj  = r;
                respErr  = e;
                dispatch_semaphore_signal( sem );
            }];
        [task resume];
        dispatch_semaphore_wait( sem, DISPATCH_TIME_FOREVER );

        if ( respErr ) {
            NSLog( @"hsp3dx.http: error %@ %@", us, respErr.localizedDescription );
            if ( out ) {
                const char *msg = [[respErr localizedDescription] UTF8String];
                size_t L = msg ? strlen(msg) : 0;
                out->body = (char *)malloc( L + 1 );
                if ( out->body ) { if ( L ) memcpy( out->body, msg, L ); out->body[L] = 0; }
                out->size = L;
                out->status = 0;
                out->headers = strdup( "" );
            }
            return 0;
        }

        NSHTTPURLResponse *http = (NSHTTPURLResponse *)respObj;
        if ( out ) {
            out->status = http ? (int)http.statusCode : 0;
            size_t L = respData ? respData.length : 0;
            out->body = (char *)malloc( L + 1 );
            if ( out->body ) {
                if ( L ) memcpy( out->body, respData.bytes, L );
                out->body[L] = 0;
            }
            out->size = L;

            //  allHeaderFields → "Key: Value\r\n" 連結
            NSMutableString *hdrStr = [NSMutableString string];
            if ( http ) {
                for ( NSString *k in http.allHeaderFields ) {
                    id v = http.allHeaderFields[k];
                    [hdrStr appendFormat:@"%@: %@\r\n", k, v];
                }
            }
            const char *hdrUtf8 = [hdrStr UTF8String];
            out->headers = strdup( hdrUtf8 ? hdrUtf8 : "" );
        }
    }
    return 0;
}

extern "C" int hsp3dx_http_request( const char *method, const char *url,
                                     const void *body, size_t size,
                                     const char *content_type,
                                     const char *user_agent,
                                     const char *extra_headers,
                                     int timeout_ms,
                                     hsp3dx_http_response *out )
{
    return do_request( method, url, body, size, content_type, user_agent,
                        extra_headers, timeout_ms, out );
}

extern "C" int hsp3dx_http_get( const char *url, const char *ua, const char *xhdr,
                                 int timeout_ms, hsp3dx_http_response *out )
{
    return do_request( "GET", url, nullptr, 0, nullptr, ua, xhdr, timeout_ms, out );
}

extern "C" int hsp3dx_http_post( const char *url, const void *body, size_t size,
                                  const char *content_type, const char *ua,
                                  const char *xhdr, int timeout_ms,
                                  hsp3dx_http_response *out )
{
    return do_request( "POST", url, body, size, content_type, ua, xhdr, timeout_ms, out );
}

extern "C" int hsp3dx_http_put( const char *url, const void *body, size_t size,
                                 const char *content_type, const char *ua,
                                 const char *xhdr, int timeout_ms,
                                 hsp3dx_http_response *out )
{
    return do_request( "PUT", url, body, size, content_type, ua, xhdr, timeout_ms, out );
}

extern "C" int hsp3dx_http_delete( const char *url, const char *ua, const char *xhdr,
                                    int timeout_ms, hsp3dx_http_response *out )
{
    return do_request( "DELETE", url, nullptr, 0, nullptr, ua, xhdr, timeout_ms, out );
}

extern "C" int hsp3dx_http_patch( const char *url, const void *body, size_t size,
                                   const char *content_type, const char *ua,
                                   const char *xhdr, int timeout_ms,
                                   hsp3dx_http_response *out )
{
    return do_request( "PATCH", url, body, size, content_type, ua, xhdr, timeout_ms, out );
}

extern "C" int hsp3dx_http_download( const char *url, const char *dest_path_u8,
                                      const char *ua, const char *xhdr,
                                      int timeout_ms, int *out_status, size_t *out_size )
{
    hsp3dx_http_response r;
    int rc = do_request( "GET", url, nullptr, 0, nullptr, ua, xhdr, timeout_ms, &r );
    if ( rc != 0 ) { if ( out_status ) *out_status = 0; if ( out_size ) *out_size = 0; return -1; }
    if ( out_status ) *out_status = r.status;
    FILE *fp = fopen( dest_path_u8, "wb" );
    size_t written = 0;
    if ( fp && r.body ) { written = fwrite( r.body, 1, r.size, fp ); fclose( fp ); }
    if ( out_size ) *out_size = written;
    if ( r.body ) free( r.body );
    if ( r.headers ) free( r.headers );
    return 0;
}

//  resp->headers ("Key: Value\r\n" 連結) から name を大小無視で検索し、値を out に書く。
extern "C" int hsp3dx_http_get_header( const hsp3dx_http_response *resp,
                                        const char *name,
                                        char *out, size_t out_cap )
{
    if ( !resp || !resp->headers || !name || !out || out_cap == 0 ) return -1;
    const char *p = resp->headers;
    size_t name_len = strlen( name );
    while ( *p ) {
        const char *colon = strchr( p, ':' );
        const char *eol   = strstr( p, "\r\n" );
        if ( !eol ) eol = p + strlen( p );
        if ( colon && colon < eol ) {
            size_t key_len = (size_t)( colon - p );
            if ( key_len == name_len ) {
                int match = 1;
                for ( size_t i = 0; i < name_len; i++ ) {
                    char a = p[i], b = name[i];
                    if ( a >= 'A' && a <= 'Z' ) a = (char)(a - 'A' + 'a');
                    if ( b >= 'A' && b <= 'Z' ) b = (char)(b - 'A' + 'a');
                    if ( a != b ) { match = 0; break; }
                }
                if ( match ) {
                    const char *vstart = colon + 1;
                    while ( vstart < eol && ( *vstart == ' ' || *vstart == '\t' ) ) vstart++;
                    size_t vlen = (size_t)( eol - vstart );
                    if ( vlen >= out_cap ) vlen = out_cap - 1;
                    memcpy( out, vstart, vlen );
                    out[vlen] = 0;
                    return 0;
                }
            }
        }
        if ( *eol == 0 ) break;
        p = eol + 2;
    }
    out[0] = 0;
    return -1;
}

//  NSURLSession sharedSession は NSHTTPCookieStorage.sharedCookieStorage を
//  デフォルトで使うので Cookie の自動処理は常に ON。
//  dx_http_cookie_enable は 0 時に既存 cookie をクリアする動作で代用。
//  dx_http_cookie_clear は NSHTTPCookieStorage を全削除。
extern "C" void hsp3dx_http_cookie_clear( void )
{
    NSHTTPCookieStorage *store = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *cookies = [store cookies];
    for ( NSHTTPCookie *c in cookies ) [store deleteCookie:c];
}

extern "C" void hsp3dx_http_cookie_set_enabled( int enabled )
{
    if ( !enabled ) hsp3dx_http_cookie_clear();
    //  有効化は no-op (sharedSession はデフォルトで自動 Cookie 処理する)
}

extern "C" void hsp3dx_http_free( hsp3dx_http_response *resp )
{
    if ( !resp ) return;
    if ( resp->body )    free( resp->body );
    if ( resp->headers ) free( resp->headers );
    resp->body = nullptr;
    resp->headers = nullptr;
    resp->size = 0;
    resp->status = 0;
}

//  Basic 認証ヘッダ生成 ("Basic base64(user:pass)")
extern "C" int hsp3dx_http_build_basic_auth( const char *user, const char *pass,
                                              char *out, size_t out_cap )
{
    if ( !user || !pass || !out || out_cap < 32 ) return -1;
    @autoreleasepool {
        NSString *pair = [NSString stringWithFormat:@"%s:%s", user, pass];
        NSData *pairData = [pair dataUsingEncoding:NSUTF8StringEncoding];
        NSString *b64 = [pairData base64EncodedStringWithOptions:0];
        NSString *hdr = [NSString stringWithFormat:@"Basic %@", b64];
        const char *c = [hdr UTF8String];
        if ( !c ) return -1;
        size_t L = strlen( c );
        if ( L + 1 > out_cap ) return -1;
        memcpy( out, c, L );
        out[L] = 0;
    }
    return 0;
}

//  ================================================================
//  multipart/form-data (NSMutableData で自前組み立て)
//  ================================================================
static NSMutableArray *s_mp_parts = nil;   // 各要素: {@"kind": @"text"|@"file", ...}
static NSString       *s_mp_boundary = nil;

extern "C" void hsp3dx_http_mp_begin( void )
{
    s_mp_parts = [[NSMutableArray alloc] init];
    s_mp_boundary = [NSString stringWithFormat:@"----hsp3dx-%@", [[NSUUID UUID] UUIDString]];
}

extern "C" int hsp3dx_http_mp_add_text( const char *name, const char *value )
{
    if ( !s_mp_parts ) return -1;
    [s_mp_parts addObject:@{
        @"kind": @"text",
        @"name": [NSString stringWithUTF8String:name ? name : ""],
        @"value": [NSString stringWithUTF8String:value ? value : ""]
    }];
    return 0;
}

extern "C" int hsp3dx_http_mp_add_file( const char *name, const char *path,
                                         const char *ctype, const char *filename )
{
    if ( !s_mp_parts ) return -1;
    NSString *p = path ? [NSString stringWithUTF8String:path] : @"";
    if ( ![[NSFileManager defaultManager] fileExistsAtPath:p] ) {
        NSLog( @"hsp3dx.http: mp_add_file not found: %@", p );
        return -1;
    }
    [s_mp_parts addObject:@{
        @"kind":     @"file",
        @"name":     [NSString stringWithUTF8String:name ? name : ""],
        @"path":     p,
        @"ctype":    [NSString stringWithUTF8String:(ctype && *ctype) ? ctype : "application/octet-stream"],
        @"filename": [NSString stringWithUTF8String:(filename && *filename) ? filename : [[p lastPathComponent] UTF8String]]
    }];
    return 0;
}

extern "C" int hsp3dx_http_mp_post( const char *url, const char *ua,
                                     const char *xhdr, int timeout_ms,
                                     hsp3dx_http_response *out )
{
    if ( out ) { out->status = 0; out->body = nullptr; out->size = 0; out->headers = nullptr; }
    if ( !s_mp_parts || !s_mp_boundary ) return -1;

    @autoreleasepool {
        NSMutableData *body = [NSMutableData data];
        NSString *bStart = [NSString stringWithFormat:@"--%@\r\n", s_mp_boundary];
        NSString *bEnd   = [NSString stringWithFormat:@"--%@--\r\n", s_mp_boundary];

        for ( NSDictionary *part in s_mp_parts ) {
            [body appendData:[bStart dataUsingEncoding:NSUTF8StringEncoding]];
            if ( [part[@"kind"] isEqualToString:@"text"] ) {
                NSString *hdr = [NSString stringWithFormat:
                    @"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", part[@"name"]];
                [body appendData:[hdr dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[part[@"value"] dataUsingEncoding:NSUTF8StringEncoding]];
                [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            } else {
                NSString *hdr = [NSString stringWithFormat:
                    @"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n"
                     "Content-Type: %@\r\n\r\n",
                    part[@"name"], part[@"filename"], part[@"ctype"]];
                [body appendData:[hdr dataUsingEncoding:NSUTF8StringEncoding]];
                NSData *fileData = [NSData dataWithContentsOfFile:part[@"path"]];
                if ( fileData ) [body appendData:fileData];
                [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            }
        }
        [body appendData:[bEnd dataUsingEncoding:NSUTF8StringEncoding]];

        NSString *ctype = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", s_mp_boundary];
        NSURL *u = [NSURL URLWithString:[NSString stringWithUTF8String:url ? url : ""]];
        if ( !u ) return -1;
        NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:u];
        [req setHTTPMethod:@"POST"];
        [req setTimeoutInterval:( timeout_ms > 0 ? timeout_ms / 1000.0 : 30.0 )];
        [req setValue:ctype forHTTPHeaderField:@"Content-Type"];
        apply_headers( req, ua, nullptr, xhdr );
        [req setHTTPBody:body];

        __block NSData *respData = nil;
        __block NSURLResponse *respObj = nil;
        __block NSError *respErr = nil;
        dispatch_semaphore_t sem = dispatch_semaphore_create( 0 );
        [[[NSURLSession sharedSession] dataTaskWithRequest:req
            completionHandler:^( NSData *d, NSURLResponse *r, NSError *e ) {
                respData = d; respObj = r; respErr = e;
                dispatch_semaphore_signal( sem );
            }] resume];
        dispatch_semaphore_wait( sem, DISPATCH_TIME_FOREVER );

        if ( respErr ) { NSLog( @"hsp3dx.http mp error: %@", respErr.localizedDescription ); return 0; }
        NSHTTPURLResponse *http = (NSHTTPURLResponse *)respObj;
        if ( out ) {
            out->status = http ? (int)http.statusCode : 0;
            size_t L = respData ? respData.length : 0;
            out->body = (char *)malloc( L + 1 );
            if ( out->body ) { if ( L ) memcpy( out->body, respData.bytes, L ); out->body[L] = 0; }
            out->size = L;
            NSMutableString *hdrStr = [NSMutableString string];
            if ( http ) {
                for ( NSString *k in http.allHeaderFields ) {
                    id v = http.allHeaderFields[k];
                    [hdrStr appendFormat:@"%@: %@\r\n", k, v];
                }
            }
            const char *hc = [hdrStr UTF8String];
            out->headers = strdup( hc ? hc : "" );
        }
    }
    return 0;
}

extern "C" void hsp3dx_http_mp_end( void )
{
    s_mp_parts = nil;
    s_mp_boundary = nil;
}
