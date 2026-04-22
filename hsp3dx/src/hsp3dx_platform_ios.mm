//
//  hsp3dx_platform_ios.mm — iOS 版プラットフォーム実装 (exec/dialog/pref)
//
#ifdef __APPLE__

#include "hsp3dx_platform.h"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <CoreMotion/CoreMotion.h>

#include <stdio.h>
#include <string.h>

//  ----------------------------------------------------------------
//  exec: URL スキームを UIApplication で開く (mailto:/https:/tel: など)
//  ----------------------------------------------------------------
extern "C" int hsp3dx_platform_exec( const char *url_or_path, const char * /*param*/, int /*mode*/ )
{
    if ( !url_or_path || !*url_or_path ) return -1;
    __block int rc = -1;
    @autoreleasepool {
        NSString *s = [NSString stringWithUTF8String:url_or_path];
        NSURL *u = [NSURL URLWithString:s];
        if ( u == nil ) {
            //  スキーム無しならファイル URL 扱い (iOS は別アプリで開けないが、一応)
            u = [NSURL fileURLWithPath:s];
        }
        if ( u == nil ) return -1;
        UIApplication *app = [UIApplication sharedApplication];
        dispatch_sync( dispatch_get_main_queue(), ^{
            if ( [app canOpenURL:u] ) {
                [app openURL:u options:@{} completionHandler:^(BOOL ok) {
                    rc = ok ? 0 : -1;
                }];
                rc = 0;  //  openURL 完了を待たない (async completion 用)
            } else {
                rc = -1;
            }
        } );
    }
    return rc;
}

//  ----------------------------------------------------------------
//  dialog: UIAlertController (UIViewController.presentViewController 経由)
//  ----------------------------------------------------------------
extern "C" int hsp3dx_platform_dialog( const char *text, const char *title, int mode )
{
    __block int rc = -1;
    dispatch_semaphore_t sem = dispatch_semaphore_create( 0 );

    dispatch_async( dispatch_get_main_queue(), ^{
        @autoreleasepool {
            NSString *t = text  ? [NSString stringWithUTF8String:text ] : @"";
            NSString *c = title ? [NSString stringWithUTF8String:title] : @"hsp3dx";
            UIAlertController *alert = [UIAlertController
                alertControllerWithTitle:c message:t
                preferredStyle:UIAlertControllerStyleAlert];

            //  ボタン構築 (モード別)
            void (^handler1)(UIAlertAction *) = ^( UIAlertAction *a ) { rc = 1; dispatch_semaphore_signal( sem ); };
            void (^handler2)(UIAlertAction *) = ^( UIAlertAction *a ) { rc = 2; dispatch_semaphore_signal( sem ); };
            void (^handler3)(UIAlertAction *) = ^( UIAlertAction *a ) { rc = 3; dispatch_semaphore_signal( sem ); };
            switch ( mode ) {
            case 1:
                [alert addAction:[UIAlertAction actionWithTitle:@"OK"     style:UIAlertActionStyleDefault handler:handler1]];
                [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel  handler:handler2]];
                break;
            case 2:
                [alert addAction:[UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:handler1]];
                [alert addAction:[UIAlertAction actionWithTitle:@"No"  style:UIAlertActionStyleCancel  handler:handler2]];
                break;
            case 3:
                [alert addAction:[UIAlertAction actionWithTitle:@"Yes"    style:UIAlertActionStyleDefault handler:handler1]];
                [alert addAction:[UIAlertAction actionWithTitle:@"No"     style:UIAlertActionStyleDestructive handler:handler2]];
                [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel  handler:handler3]];
                break;
            default:
                [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:handler1]];
                break;
            }

            //  key window の root view controller 経由で present
            UIWindow *win = nil;
            for ( UIScene *s in [UIApplication sharedApplication].connectedScenes ) {
                if ( [s isKindOfClass:[UIWindowScene class]] ) {
                    for ( UIWindow *w in ((UIWindowScene *)s).windows ) {
                        if ( w.isKeyWindow ) { win = w; break; }
                    }
                }
                if ( win ) break;
            }
            UIViewController *root = win ? win.rootViewController : nil;
            while ( root.presentedViewController ) root = root.presentedViewController;
            if ( root ) {
                [root presentViewController:alert animated:YES completion:nil];
            } else {
                rc = -1;
                dispatch_semaphore_signal( sem );
            }
        }
    } );
    dispatch_semaphore_wait( sem, DISPATCH_TIME_FOREVER );
    return rc;
}

//  ----------------------------------------------------------------
//  KV 永続ストア: NSUserDefaults
//    section/key を "section/key" 形式の単一キーとして保持
//  ----------------------------------------------------------------
static NSString *full_key( const char *section, const char *key )
{
    NSString *s = ( section && *section ) ? [NSString stringWithUTF8String:section] : nil;
    NSString *k = [NSString stringWithUTF8String:( key ? key : "" )];
    return s ? [NSString stringWithFormat:@"%@/%@", s, k] : k;
}

extern "C" int hsp3dx_pref_set_str( const char *section, const char *key, const char *value )
{
    if ( !key ) return -1;
    @autoreleasepool {
        NSString *fk = full_key( section, key );
        NSString *v  = [NSString stringWithUTF8String:( value ? value : "" )];
        [[NSUserDefaults standardUserDefaults] setObject:v forKey:fk];
    }
    return 0;
}

extern "C" int hsp3dx_pref_set_int( const char *section, const char *key, int value )
{
    if ( !key ) return -1;
    @autoreleasepool {
        NSString *fk = full_key( section, key );
        [[NSUserDefaults standardUserDefaults] setInteger:value forKey:fk];
    }
    return 0;
}

extern "C" int hsp3dx_pref_get_str( const char *section, const char *key,
                                     char *out, size_t out_cap, const char *default_value )
{
    if ( !key || !out || out_cap == 0 ) return -1;
    @autoreleasepool {
        NSString *fk = full_key( section, key );
        NSString *v = [[NSUserDefaults standardUserDefaults] stringForKey:fk];
        const char *src = nullptr;
        if ( v ) src = [v UTF8String];
        if ( !src ) src = default_value ? default_value : "";
        strncpy( out, src, out_cap - 1 );
        out[out_cap - 1] = 0;
        return (int)strlen( out );
    }
}

extern "C" int hsp3dx_pref_get_int( const char *section, const char *key, int default_value )
{
    if ( !key ) return default_value;
    @autoreleasepool {
        NSString *fk = full_key( section, key );
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        if ( [ud objectForKey:fk] == nil ) return default_value;
        return (int)[ud integerForKey:fk];
    }
}

extern "C" int hsp3dx_pref_remove( const char *section, const char *key )
{
    if ( !key ) return -1;
    @autoreleasepool {
        NSString *fk = full_key( section, key );
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:fk];
    }
    return 0;
}

extern "C" int hsp3dx_pref_exists( const char *section, const char *key )
{
    if ( !key ) return 0;
    @autoreleasepool {
        NSString *fk = full_key( section, key );
        return [[NSUserDefaults standardUserDefaults] objectForKey:fk] != nil ? 1 : 0;
    }
}

extern "C" int hsp3dx_pref_list_keys( const char *section, char *out, size_t out_cap )
{
    if ( !out || out_cap == 0 ) return -1;
    out[0] = 0;
    @autoreleasepool {
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        NSDictionary *all = [ud dictionaryRepresentation];
        NSString *prefix = ( section && *section )
                           ? [NSString stringWithFormat:@"%s/", section]
                           : nil;
        int count = 0;
        size_t oi = 0;
        for ( NSString *k in all.allKeys ) {
            NSString *keyOnly;
            if ( prefix ) {
                if ( ![k hasPrefix:prefix] ) continue;
                keyOnly = [k substringFromIndex:prefix.length];
            } else {
                keyOnly = k;
            }
            const char *c = [keyOnly UTF8String];
            if ( !c ) continue;
            size_t L = strlen( c );
            if ( oi + L + 2 > out_cap ) break;
            memcpy( out + oi, c, L );
            oi += L;
            out[oi++] = '\n';
            out[oi] = 0;
            count++;
        }
        if ( count > 0 && oi > 0 && out[oi-1] == '\n' ) out[--oi] = 0;
        return count;
    }
}

extern "C" int hsp3dx_pref_clear( const char *section )
{
    @autoreleasepool {
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        NSDictionary *all = [ud dictionaryRepresentation];
        if ( section && *section ) {
            NSString *prefix = [NSString stringWithFormat:@"%s/", section];
            for ( NSString *k in all.allKeys ) {
                if ( [k hasPrefix:prefix] ) [ud removeObjectForKey:k];
            }
        } else {
            for ( NSString *k in all.allKeys ) [ud removeObjectForKey:k];
        }
    }
    return 0;
}

//  ================================================================
//  Phase M.4: デバイス情報 / 制御
//  ================================================================

extern "C" void hsp3dx_dev_vibrate( int /*ms*/ )
{
    //  iOS は ms 指定のパターン振動が非公開。標準の短い振動のみ。
    AudioServicesPlaySystemSound( kSystemSoundID_Vibrate );
}

extern "C" int hsp3dx_dev_is_dark( void )
{
    if ( @available( iOS 13.0, * ) ) {
        UITraitCollection *tc = [UITraitCollection currentTraitCollection];
        return tc.userInterfaceStyle == UIUserInterfaceStyleDark ? 1 : 0;
    }
    return 0;
}

extern "C" void hsp3dx_dev_battery( int *level, int *state )
{
    UIDevice *dev = [UIDevice currentDevice];
    BOOL prev = dev.batteryMonitoringEnabled;
    dev.batteryMonitoringEnabled = YES;
    float lv = dev.batteryLevel;
    UIDeviceBatteryState st = dev.batteryState;
    dev.batteryMonitoringEnabled = prev;

    if ( level ) *level = ( lv < 0 ) ? -1 : (int)( lv * 100 );
    if ( state ) {
        int s = -1;
        switch ( st ) {
        case UIDeviceBatteryStateUnplugged: s = 0; break;
        case UIDeviceBatteryStateCharging:  s = 1; break;
        case UIDeviceBatteryStateFull:      s = 2; break;
        default:                            s = -1; break;
        }
        *state = s;
    }
}

extern "C" int hsp3dx_dev_orientation( void )
{
    UIDeviceOrientation o = [UIDevice currentDevice].orientation;
    switch ( o ) {
    case UIDeviceOrientationPortrait:            return 0;
    case UIDeviceOrientationLandscapeLeft:       return 1;
    case UIDeviceOrientationPortraitUpsideDown:  return 2;
    case UIDeviceOrientationLandscapeRight:      return 3;
    default:                                      return 0;
    }
}

extern "C" void hsp3dx_dev_sound( int id )
{
    //  id==0 はデフォルトの短いビープ (kSystemSoundID_Vibrate はバイブのみ)
    //  1000 番台以降は iOS 予約済み UI サウンド ID
    SystemSoundID sid = ( id > 0 ) ? (SystemSoundID)id : 1104;  // 1104 = Tock
    AudioServicesPlaySystemSound( sid );
}

//  ================================================================
//  Phase M.5: センサー (CMMotionManager)
//  ================================================================
static CMMotionManager *g_motion = nil;

static void ensure_motion_started()
{
    if ( g_motion != nil ) return;
    @autoreleasepool {
        g_motion = [[CMMotionManager alloc] init];
        g_motion.accelerometerUpdateInterval = 1.0 / 60.0;
        g_motion.gyroUpdateInterval          = 1.0 / 60.0;
        g_motion.deviceMotionUpdateInterval  = 1.0 / 60.0;
        if ( g_motion.accelerometerAvailable ) {
            [g_motion startAccelerometerUpdates];
        }
        if ( g_motion.gyroAvailable ) {
            [g_motion startGyroUpdates];
        }
        if ( g_motion.deviceMotionAvailable ) {
            [g_motion startDeviceMotionUpdates];
        }
    }
}

extern "C" void hsp3dx_dev_accel( double *x, double *y, double *z )
{
    ensure_motion_started();
    if ( x ) *x = 0; if ( y ) *y = 0; if ( z ) *z = 0;
    if ( !g_motion ) return;
    CMAccelerometerData *d = g_motion.accelerometerData;
    if ( d ) {
        if ( x ) *x = d.acceleration.x;
        if ( y ) *y = d.acceleration.y;
        if ( z ) *z = d.acceleration.z;
    }
}

extern "C" void hsp3dx_dev_gyro( double *x, double *y, double *z )
{
    ensure_motion_started();
    if ( x ) *x = 0; if ( y ) *y = 0; if ( z ) *z = 0;
    if ( !g_motion ) return;
    CMGyroData *d = g_motion.gyroData;
    if ( d ) {
        if ( x ) *x = d.rotationRate.x;
        if ( y ) *y = d.rotationRate.y;
        if ( z ) *z = d.rotationRate.z;
    }
}

extern "C" void hsp3dx_dev_attitude( double *roll, double *pitch, double *yaw )
{
    ensure_motion_started();
    if ( roll ) *roll = 0; if ( pitch ) *pitch = 0; if ( yaw ) *yaw = 0;
    if ( !g_motion ) return;
    CMDeviceMotion *d = g_motion.deviceMotion;
    if ( d ) {
        if ( roll )  *roll  = d.attitude.roll;
        if ( pitch ) *pitch = d.attitude.pitch;
        if ( yaw )   *yaw   = d.attitude.yaw;
    }
}

#endif  // __APPLE__
