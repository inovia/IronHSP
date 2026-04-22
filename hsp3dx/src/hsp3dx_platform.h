//
//  hsp3dx_platform.h — Win/iOS/Android 共通の端末機能抽象レイヤ
//
//  Phase M 以降で順次実装する「プラットフォーム固有の単純機能」を
//  このヘッダで宣言する。実装は hsp3dx_platform_win.cpp / _ndk.cpp / _ios.mm。
//
#ifndef __hsp3dx_platform_h
#define __hsp3dx_platform_h

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

//  ----------------------------------------------------------------
//  exec: 外部 URL / ファイル / アプリを既定ハンドラで開く
//    url_or_path: "https://..." / "mailto:..." / ファイルパス等
//    param: Win の ShellExecute 用引数 (iOS/Android は無視)
//    mode : 互換用 (現状どのプラットフォームも未使用、0 推奨)
//  返値: 0=成功、-1=失敗
//  ----------------------------------------------------------------
int hsp3dx_platform_exec( const char *url_or_path, const char *param, int mode );

//  ----------------------------------------------------------------
//  dialog: モーダルメッセージボックス
//    text, title: UTF-8
//    mode: 0=OK / 1=OK+Cancel / 2=Yes+No / 3=Yes+No+Cancel
//  返値 (HSP の dialog stat 相当):
//    1=OK/Yes, 2=Cancel/No (mode=2 では No), 3=Cancel (mode=3 のみ)
//    -1=表示失敗
//  ----------------------------------------------------------------
int hsp3dx_platform_dialog( const char *text, const char *title, int mode );

//  ----------------------------------------------------------------
//  Key-Value 永続ストア (Phase M.2)
//    section: INI のセクション名 (iOS/Android は "section/" prefix として使用、空 OK)
//    key    : キー名
//  ----------------------------------------------------------------
int  hsp3dx_pref_set_str ( const char *section, const char *key, const char *value );
int  hsp3dx_pref_set_int ( const char *section, const char *key, int value );
int  hsp3dx_pref_get_str ( const char *section, const char *key,
                           char *out, size_t out_cap, const char *default_value );
int  hsp3dx_pref_get_int ( const char *section, const char *key, int default_value );
int  hsp3dx_pref_remove  ( const char *section, const char *key );
int  hsp3dx_pref_clear   ( const char *section );   //  "" or NULL で全削除

//  存在チェック: 1=存在、0=無し
int  hsp3dx_pref_exists  ( const char *section, const char *key );

//  浮動小数 (内部的には 17 桁精度の文字列として保存)
int     hsp3dx_pref_set_double( const char *section, const char *key, double value );
double  hsp3dx_pref_get_double( const char *section, const char *key, double default_value );

//  section 内のキー一覧を \n 区切りで out に書く。戻り値 = 見つかった数 (-1=失敗)
int  hsp3dx_pref_list_keys( const char *section, char *out, size_t out_cap );

//  ================================================================
//  Phase M.4: デバイス情報 / 制御 (権限不要な基本のみ)
//  ================================================================

//  バイブレーション (ms ミリ秒、未対応プラットフォームは no-op)。
//  Android は AndroidManifest の VIBRATE 権限必要。iOS は ms 無視で固定短パルス。
void hsp3dx_dev_vibrate( int ms );

//  ダークモード判定: 1=ダーク, 0=ライト (or 取得不能)
int  hsp3dx_dev_is_dark( void );

//  バッテリー残量 (0-100, -1=取得不能) と充電状態
//    state: 0=not charging, 1=charging, 2=full, -1=unknown
void hsp3dx_dev_battery( int *level, int *state );

//  画面向き: 0=portrait, 1=landscape-left, 2=portrait-upside-down, 3=landscape-right
int  hsp3dx_dev_orientation( void );

//  システムサウンド再生 (短いビープ等、権限不要)。
//    id: iOS の SystemSoundID (1000〜 予約済 UI サウンド) 相当、他 OS は無視可
void hsp3dx_dev_sound( int id );

//  センサー: 初回呼び出し時に自動 start、以降は最新値を返す。
//  未対応プラットフォーム / センサー未搭載時は 0.0 を返す (要 start 判定は省略)。
//    accel    : x,y,z (m/s^2 or g 単位は OS 依存、iOS=g、Android=m/s^2)
//    gyro     : x,y,z 回転速度 (rad/s)
//    attitude : roll, pitch, yaw (radian、iOS は deviceMotion、Android は rotationVector から計算)
void hsp3dx_dev_accel   ( double *x, double *y, double *z );
void hsp3dx_dev_gyro    ( double *x, double *y, double *z );
void hsp3dx_dev_attitude( double *roll, double *pitch, double *yaw );

//  Phase M.6: 権限要系 (実行時に OS 側で permission プロンプト)

//  GPS: 初回 start で権限要求、以降 get で最新 (lat, lng) 取得。未取得時は 0,0。
void hsp3dx_dev_gps_start ( void );
void hsp3dx_dev_gps_stop  ( void );
void hsp3dx_dev_gps_get   ( double *lat, double *lng );
//  status: 0=未開始, 1=権限要求中, 2=稼働中(fix あり), 3=denied/error
int  hsp3dx_dev_gps_status( void );

//  トーチ (背面ライト)
int  hsp3dx_dev_torch_supported( void );   //  1=対応, 0=非対応
void hsp3dx_dev_torch          ( int on ); //  0/1 で off/on

#ifdef __cplusplus
}
#endif

#endif
