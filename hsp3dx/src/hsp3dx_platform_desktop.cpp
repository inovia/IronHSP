//
//  hsp3dx_platform_desktop.cpp — Mac/Linux/Web 向けプラットフォーム実装
//
//  Win/iOS/Android には本実装があるが Desktop は PoC 段階なのでほぼ stub だった。
//  Mac/Linux 向けの exec / dialog / pref / dev_battery / dev_is_dark を実装。
//  Web (Emscripten) は sandbox で大半が不可能なため stub のまま。
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "hsp3dx_platform.h"
#include "hsp3dx_http.h"
#include "hsp3dx_ws.h"
#include "hsp3dx_platform_io.h"

#if !defined(__EMSCRIPTEN__)
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <spawn.h>
#include <dirent.h>
extern char **environ;
#endif

#if defined(__APPLE__) && !defined(TARGET_OS_IPHONE)
#include <TargetConditionals.h>
#endif

//  ====================================================================
//  platform IO (fopen ベース、desktop はファイルシステムが普通に使えるため)
//  ====================================================================
struct hsp3dx_file {
    FILE *fp;
    size_t size;
};

extern "C" hsp3dx_file *hsp3dx_fopen( const char *utf8_path )
{
    FILE *fp = fopen( utf8_path, "rb" );
    if ( !fp ) return NULL;
    hsp3dx_file *f = (hsp3dx_file *)malloc( sizeof(hsp3dx_file) );
    if ( !f ) { fclose( fp ); return NULL; }
    f->fp = fp;
    fseek( fp, 0, SEEK_END );
    f->size = (size_t)ftell( fp );
    fseek( fp, 0, SEEK_SET );
    return f;
}

extern "C" size_t hsp3dx_fread( void *buf, size_t size, hsp3dx_file *f )
{
    if ( !f || !f->fp ) return 0;
    return fread( buf, 1, size, f->fp );
}

extern "C" size_t hsp3dx_fsize( hsp3dx_file *f )
{
    return f ? f->size : 0;
}

extern "C" void hsp3dx_fclose( hsp3dx_file *f )
{
    if ( !f ) return;
    if ( f->fp ) fclose( f->fp );
    free( f );
}

extern "C" int hsp3dx_load_file_all( const char *utf8_path, void **out_buf, size_t *out_size )
{
    FILE *fp = fopen( utf8_path, "rb" );
    if ( !fp ) return -1;
    fseek( fp, 0, SEEK_END );
    long sz = ftell( fp );
    fseek( fp, 0, SEEK_SET );
    if ( sz < 0 ) { fclose( fp ); return -1; }
    void *buf = malloc( (size_t)sz + 1 );
    if ( !buf ) { fclose( fp ); return -1; }
    size_t rd = fread( buf, 1, (size_t)sz, fp );
    fclose( fp );
    ((char *)buf)[rd] = 0;
    *out_buf = buf;
    *out_size = rd;
    return 0;
}

extern "C" void hsp3dx_free_file_buf( void *buf )
{
    free( buf );
}

extern "C" long hsp3dx_file_size_if_exists( const char *utf8_path )
{
    FILE *fp = fopen( utf8_path, "rb" );
    if ( !fp ) return -1;
    fseek( fp, 0, SEEK_END );
    long sz = ftell( fp );
    fclose( fp );
    return sz;
}

//  ====================================================================
//  platform misc — Mac/Linux 実装、Web は stub のまま
//  ====================================================================

#if !defined(__EMSCRIPTEN__)

//  posix_spawn で外部プロセスを fire-and-forget で起動。stdin/stdout は dev/null。
//  parent は WNOHANG 風に放置 (子は zombie にならないよう setsid + double fork)。
static int spawn_detached( const char *argv0, char *const argv[] )
{
    posix_spawn_file_actions_t fa;
    posix_spawn_file_actions_init( &fa );
    posix_spawn_file_actions_addopen( &fa, 0, "/dev/null", O_RDONLY, 0 );
    posix_spawn_file_actions_addopen( &fa, 1, "/dev/null", O_WRONLY, 0 );
    posix_spawn_file_actions_addopen( &fa, 2, "/dev/null", O_WRONLY, 0 );

    pid_t pid = -1;
    int rc = posix_spawnp( &pid, argv0, &fa, NULL, argv, environ );
    posix_spawn_file_actions_destroy( &fa );
    if ( rc != 0 ) return -1;
    //  zombie 防止: 子の終了を非同期に reap (短命なので waitpid で待つだけで充分)
    int st;
    waitpid( pid, &st, WNOHANG );
    return 0;
}

extern "C" int hsp3dx_platform_exec( const char *url_or_path, const char *param, int /*mode*/ )
{
    if ( !url_or_path || !*url_or_path ) return -1;
#if defined(__APPLE__)
    const char *opener = "open";
#else
    const char *opener = "xdg-open";
#endif
    char *args[ 4 ];
    args[ 0 ] = (char *)opener;
    args[ 1 ] = (char *)url_or_path;
    if ( param && *param ) {
        args[ 2 ] = (char *)param;
        args[ 3 ] = NULL;
    } else {
        args[ 2 ] = NULL;
    }
    return spawn_detached( opener, args );
}

//  dialog: Mac は osascript、Linux は zenity → kdialog → SDL fallback。
//  戻り値: 1=OK/Yes, 2=Cancel/No, 3=Cancel(mode3)
static int run_capture( char *const argv[], char *out_buf, size_t out_cap )
{
    int pipefd[ 2 ];
    if ( pipe( pipefd ) != 0 ) return -1;

    posix_spawn_file_actions_t fa;
    posix_spawn_file_actions_init( &fa );
    posix_spawn_file_actions_adddup2 ( &fa, pipefd[ 1 ], 1 );
    posix_spawn_file_actions_addclose( &fa, pipefd[ 0 ] );
    posix_spawn_file_actions_addclose( &fa, pipefd[ 1 ] );

    pid_t pid = -1;
    int rc = posix_spawnp( &pid, argv[ 0 ], &fa, NULL, argv, environ );
    posix_spawn_file_actions_destroy( &fa );
    close( pipefd[ 1 ] );
    if ( rc != 0 ) { close( pipefd[ 0 ] ); return -1; }

    size_t total = 0;
    if ( out_buf && out_cap > 0 ) {
        ssize_t n;
        while ( total + 1 < out_cap &&
                ( n = read( pipefd[ 0 ], out_buf + total, out_cap - 1 - total ) ) > 0 )
            total += (size_t)n;
        out_buf[ total ] = 0;
    } else {
        char tmp[ 256 ];
        while ( read( pipefd[ 0 ], tmp, sizeof(tmp) ) > 0 ) {}
    }
    close( pipefd[ 0 ] );

    int status = 0;
    waitpid( pid, &status, 0 );
    if ( WIFEXITED( status ) ) return WEXITSTATUS( status );
    return -1;
}

#if defined(__APPLE__)
//  Mac: osascript で AppleScript dialog を実行。ボタン押下を stdout に出力。
static int dialog_mac( const char *text, const char *title, int mode )
{
    char script[ 8192 ];
    const char *btns;
    const char *def;
    switch ( mode ) {
    case 1:  btns = "{\"Cancel\", \"OK\"}";       def = "OK";     break;
    case 2:  btns = "{\"No\", \"Yes\"}";          def = "Yes";    break;
    case 3:  btns = "{\"Cancel\", \"No\", \"Yes\"}"; def = "Yes"; break;
    default: btns = "{\"OK\"}";                    def = "OK";     break;
    }
    //  AppleScript 内 " と \ をエスケープ
    auto esc = []( const char *s, char *o, size_t cap ) {
        size_t i = 0;
        for ( ; *s && i + 2 < cap; s++ ) {
            if ( *s == '"' || *s == '\\' ) o[ i++ ] = '\\';
            o[ i++ ] = *s;
        }
        o[ i ] = 0;
    };
    char et[ 2048 ], etitle[ 256 ];
    esc( text  ? text  : "", et,     sizeof( et ) );
    esc( title ? title : "hsp3dx", etitle, sizeof( etitle ) );
    snprintf( script, sizeof( script ),
        "display dialog \"%s\" with title \"%s\" buttons %s default button \"%s\"",
        et, etitle, btns, def );

    char *args[ 4 ] = { (char *)"osascript", (char *)"-e", script, NULL };
    char buf[ 256 ] = { 0 };
    int rc = run_capture( args, buf, sizeof( buf ) );
    //  Cancel ボタンは exit code 1 + stderr。それ以外は stdout に "button returned:Yes" 等
    if ( rc != 0 ) {
        //  Cancel
        return ( mode == 3 ) ? 3 : 2;
    }
    if ( strstr( buf, "Yes" ) || strstr( buf, "OK" ) ) return 1;
    if ( strstr( buf, "No" ) ) return 2;
    return 1;
}
#endif

#if !defined(__APPLE__)
//  Linux: zenity 優先、無ければ kdialog、最後は stderr fallback
static int dialog_linux( const char *text, const char *title, int mode )
{
    //  zenity 試行
    if ( access( "/usr/bin/zenity", X_OK ) == 0 ) {
        char title_arg[ 256 ], text_arg[ 4096 ];
        snprintf( title_arg, sizeof( title_arg ), "--title=%s", title ? title : "hsp3dx" );
        snprintf( text_arg,  sizeof( text_arg  ), "--text=%s",  text  ? text  : "" );
        char *args[ 8 ];
        int n = 0;
        args[ n++ ] = (char *)"zenity";
        switch ( mode ) {
        case 1: case 2: case 3:
            args[ n++ ] = (char *)"--question";
            args[ n++ ] = (char *)"--ok-label=Yes";
            args[ n++ ] = (char *)"--cancel-label=No";
            break;
        default:
            args[ n++ ] = (char *)"--info";
            break;
        }
        args[ n++ ] = title_arg;
        args[ n++ ] = text_arg;
        args[ n   ] = NULL;
        int rc = run_capture( args, NULL, 0 );
        if ( mode == 0 ) return 1;
        if ( rc == 0 ) return 1;        // Yes/OK
        if ( rc == 1 ) return ( mode == 3 ) ? 3 : 2;  // No (zenity に 3-button 無いので Cancel 同等)
        return -1;
    }
    //  fallback: stderr
    fprintf( stderr, "[dialog mode %d] %s: %s\n",
             mode, title ? title : "hsp3dx", text ? text : "" );
    return ( mode == 0 ) ? 1 : 1;
}
#endif

extern "C" int hsp3dx_platform_dialog( const char *text, const char *title, int mode )
{
#if defined(__APPLE__)
    return dialog_mac( text, title, mode );
#else
    return dialog_linux( text, title, mode );
#endif
}

//  --------------------------------------------------------------------
//  pref: ~/.config/hsp3dx/prefs.ini (Linux/Mac 共通) — XDG 準拠
//        セクションは [section] 行で区切り、key=value 行で保持。
//  --------------------------------------------------------------------
static void get_pref_path( char *out, size_t cap )
{
    if ( !out || cap < 8 ) return;
    out[ 0 ] = 0;
    const char *xdg = getenv( "XDG_CONFIG_HOME" );
    const char *home = getenv( "HOME" );
    char dir[ 1024 ];
    if ( xdg && *xdg )
        snprintf( dir, sizeof( dir ), "%s/hsp3dx", xdg );
    else if ( home && *home )
        snprintf( dir, sizeof( dir ), "%s/.config/hsp3dx", home );
    else
        snprintf( dir, sizeof( dir ), "/tmp/hsp3dx" );

    //  mkdir -p (親も作る)
    char tmp[ 1024 ];
    snprintf( tmp, sizeof( tmp ), "%s", dir );
    for ( char *p = tmp + 1; *p; p++ ) {
        if ( *p == '/' ) { *p = 0; mkdir( tmp, 0700 ); *p = '/'; }
    }
    mkdir( tmp, 0700 );

    snprintf( out, cap, "%s/prefs.ini", dir );
}

//  簡易 INI parse: 全行を memory に読み、行単位で操作。
//  パフォーマンスより素直さ優先 (キー数が大きくなる用途は想定しない)。
struct IniLine { char *line; };  //  各行 (改行込み or 改行なし末尾)
struct IniBuf {
    char  *raw;
    size_t raw_len;
};

static int ini_load( const char *path, IniBuf *b )
{
    b->raw = NULL; b->raw_len = 0;
    FILE *fp = fopen( path, "rb" );
    if ( !fp ) return -1;
    fseek( fp, 0, SEEK_END );
    long sz = ftell( fp );
    fseek( fp, 0, SEEK_SET );
    if ( sz < 0 ) { fclose( fp ); return -1; }
    b->raw = (char *)malloc( (size_t)sz + 2 );
    if ( !b->raw ) { fclose( fp ); return -1; }
    fread( b->raw, 1, (size_t)sz, fp );
    fclose( fp );
    b->raw[ sz ] = 0;
    b->raw_len = (size_t)sz;
    return 0;
}

static int ini_save( const char *path, const char *content, size_t len )
{
    FILE *fp = fopen( path, "wb" );
    if ( !fp ) return -1;
    if ( len > 0 ) fwrite( content, 1, len, fp );
    fclose( fp );
    return 0;
}

//  指定 section/key の値を out にコピー。見つからなければ default を入れて -1 返す。
//  返り値は文字数 (default fallback 時は -1)。
static int ini_get( const IniBuf *b, const char *section, const char *key,
                    char *out, size_t cap, const char *def )
{
    const char *want_sec = ( section && *section ) ? section : "General";
    const char *p = b->raw ? b->raw : "";
    char cur_sec[ 128 ] = "General";
    while ( *p ) {
        //  行を取り出し
        const char *eol = strchr( p, '\n' );
        size_t llen = eol ? (size_t)( eol - p ) : strlen( p );
        char line[ 4096 ];
        size_t cp = llen < sizeof( line ) - 1 ? llen : sizeof( line ) - 1;
        memcpy( line, p, cp );
        line[ cp ] = 0;
        //  trim 末尾 \r
        while ( cp > 0 && ( line[ cp - 1 ] == '\r' || line[ cp - 1 ] == ' ' ) ) line[ --cp ] = 0;
        //  section?
        char *trim = line;
        while ( *trim == ' ' || *trim == '\t' ) trim++;
        if ( *trim == '[' ) {
            char *e = strchr( trim, ']' );
            if ( e ) {
                size_t sl = (size_t)( e - trim - 1 );
                if ( sl < sizeof( cur_sec ) ) {
                    memcpy( cur_sec, trim + 1, sl );
                    cur_sec[ sl ] = 0;
                }
            }
        } else if ( *trim && *trim != ';' && *trim != '#' ) {
            char *eq = strchr( trim, '=' );
            if ( eq && strcmp( cur_sec, want_sec ) == 0 ) {
                *eq = 0;
                //  key trim 末尾
                size_t kl = strlen( trim );
                while ( kl > 0 && ( trim[ kl - 1 ] == ' ' || trim[ kl - 1 ] == '\t' ) ) trim[ --kl ] = 0;
                if ( strcmp( trim, key ) == 0 ) {
                    const char *val = eq + 1;
                    while ( *val == ' ' || *val == '\t' ) val++;
                    if ( out && cap > 0 ) {
                        strncpy( out, val, cap - 1 );
                        out[ cap - 1 ] = 0;
                    }
                    return (int)strlen( val );
                }
            }
        }
        if ( !eol ) break;
        p = eol + 1;
    }
    if ( out && cap > 0 ) {
        if ( def ) { strncpy( out, def, cap - 1 ); out[ cap - 1 ] = 0; }
        else out[ 0 ] = 0;
    }
    return -1;
}

//  set: 既存があれば置換、無ければ末尾に追加。section が無ければ作る。
//  delete モード: value=NULL で対象 key を削除。key=NULL で section ごと削除。
static int ini_set( IniBuf *b, const char *section, const char *key, const char *value )
{
    const char *want_sec = ( section && *section ) ? section : "General";
    //  新しい buffer を組み立てる
    size_t cap = ( b->raw_len + 4096 ) * 2;
    char *out = (char *)malloc( cap );
    if ( !out ) return -1;
    size_t oi = 0;
    auto append = [ & ]( const char *s, size_t n ) {
        if ( oi + n + 1 > cap ) {
            cap = ( oi + n ) * 2;
            char *no = (char *)realloc( out, cap );
            if ( !no ) return false;
            out = no;
        }
        memcpy( out + oi, s, n ); oi += n;
        return true;
    };

    bool replaced = false;
    bool in_target_sec = false;
    bool target_sec_seen = false;
    char cur_sec[ 128 ] = "General";
    const char *p = b->raw ? b->raw : "";

    while ( *p ) {
        const char *eol = strchr( p, '\n' );
        size_t llen = eol ? (size_t)( eol - p ) : strlen( p );
        char line[ 4096 ];
        size_t cp = llen < sizeof( line ) - 1 ? llen : sizeof( line ) - 1;
        memcpy( line, p, cp );
        line[ cp ] = 0;
        while ( cp > 0 && ( line[ cp - 1 ] == '\r' ) ) line[ --cp ] = 0;

        char *trim = line;
        while ( *trim == ' ' || *trim == '\t' ) trim++;

        bool emit = true;

        if ( *trim == '[' ) {
            //  section 切り替え。前 section が target で keyが未追加なら、ここで挿入。
            if ( in_target_sec && !replaced && key && value ) {
                char ent[ 4200 ];
                int en = snprintf( ent, sizeof( ent ), "%s=%s\n", key, value );
                if ( !append( ent, (size_t)en ) ) { free( out ); return -1; }
                replaced = true;
            }
            char *e = strchr( trim, ']' );
            if ( e ) {
                size_t sl = (size_t)( e - trim - 1 );
                if ( sl < sizeof( cur_sec ) ) {
                    memcpy( cur_sec, trim + 1, sl );
                    cur_sec[ sl ] = 0;
                }
            }
            in_target_sec = ( strcmp( cur_sec, want_sec ) == 0 );
            if ( in_target_sec ) target_sec_seen = true;
            //  section 全削除モード (key==NULL かつ value==NULL)
            if ( in_target_sec && key == NULL && value == NULL ) {
                emit = false;
            }
        } else if ( in_target_sec && key == NULL && value == NULL ) {
            //  section 全削除中: 行を捨てる
            emit = false;
        } else if ( in_target_sec && *trim && *trim != ';' && *trim != '#' ) {
            char *eq = strchr( trim, '=' );
            if ( eq ) {
                *eq = 0;
                size_t kl = strlen( trim );
                while ( kl > 0 && ( trim[ kl - 1 ] == ' ' ) ) trim[ --kl ] = 0;
                if ( key && strcmp( trim, key ) == 0 ) {
                    if ( value ) {
                        //  置換
                        char ent[ 4200 ];
                        int en = snprintf( ent, sizeof( ent ), "%s=%s", key, value );
                        if ( !append( ent, (size_t)en ) ) { free( out ); return -1; }
                        replaced = true;
                        emit = false;
                    } else {
                        //  値削除
                        emit = false;
                        replaced = true;
                    }
                } else {
                    *eq = '=';
                }
            }
        }

        if ( emit ) {
            if ( !append( p, llen ) ) { free( out ); return -1; }
        }
        if ( eol ) {
            if ( emit ) { if ( !append( "\n", 1 ) ) { free( out ); return -1; } }
        } else {
            break;
        }
        p = eol + 1;
    }

    //  set 命令で既存に当たらなかった場合 → 末尾に section + key=value を追加
    if ( key && value && !replaced ) {
        if ( oi > 0 && out[ oi - 1 ] != '\n' ) { if ( !append( "\n", 1 ) ) { free( out ); return -1; } }
        if ( !target_sec_seen ) {
            char hdr[ 256 ];
            int hn = snprintf( hdr, sizeof( hdr ), "[%s]\n", want_sec );
            if ( !append( hdr, (size_t)hn ) ) { free( out ); return -1; }
        }
        char ent[ 4200 ];
        int en = snprintf( ent, sizeof( ent ), "%s=%s\n", key, value );
        if ( !append( ent, (size_t)en ) ) { free( out ); return -1; }
    }

    char path[ 1024 ];
    get_pref_path( path, sizeof( path ) );
    int rc = ini_save( path, out, oi );
    free( out );
    return rc;
}

extern "C" int hsp3dx_pref_set_str( const char *section, const char *key, const char *value )
{
    if ( !key ) return -1;
    char path[ 1024 ];
    get_pref_path( path, sizeof( path ) );
    IniBuf b = { 0, 0 };
    ini_load( path, &b );
    int rc = ini_set( &b, section, key, value ? value : "" );
    free( b.raw );
    return rc;
}

extern "C" int hsp3dx_pref_set_int( const char *section, const char *key, int value )
{
    char tmp[ 32 ];
    snprintf( tmp, sizeof( tmp ), "%d", value );
    return hsp3dx_pref_set_str( section, key, tmp );
}

extern "C" int hsp3dx_pref_get_str( const char *section, const char *key,
                                     char *out, size_t cap, const char *def )
{
    if ( !key || !out || cap == 0 ) return -1;
    char path[ 1024 ];
    get_pref_path( path, sizeof( path ) );
    IniBuf b = { 0, 0 };
    ini_load( path, &b );
    int rc = ini_get( &b, section, key, out, cap, def );
    free( b.raw );
    return rc;
}

extern "C" int hsp3dx_pref_get_int( const char *section, const char *key, int def )
{
    char buf[ 32 ];
    if ( hsp3dx_pref_get_str( section, key, buf, sizeof( buf ), "" ) < 0 ) return def;
    if ( buf[ 0 ] == 0 ) return def;
    return atoi( buf );
}

extern "C" int hsp3dx_pref_remove( const char *section, const char *key )
{
    char path[ 1024 ];
    get_pref_path( path, sizeof( path ) );
    IniBuf b = { 0, 0 };
    if ( ini_load( path, &b ) != 0 ) return -1;
    int rc = ini_set( &b, section, key, NULL );
    free( b.raw );
    return rc;
}

extern "C" int hsp3dx_pref_clear( const char *section )
{
    char path[ 1024 ];
    get_pref_path( path, sizeof( path ) );
    if ( !section || !*section ) {
        //  ファイル全削除
        unlink( path );
        return 0;
    }
    IniBuf b = { 0, 0 };
    if ( ini_load( path, &b ) != 0 ) return -1;
    int rc = ini_set( &b, section, NULL, NULL );
    free( b.raw );
    return rc;
}

extern "C" int hsp3dx_pref_exists( const char *section, const char *key )
{
    if ( !key ) return 0;
    char path[ 1024 ];
    get_pref_path( path, sizeof( path ) );
    IniBuf b = { 0, 0 };
    if ( ini_load( path, &b ) != 0 ) return 0;
    char tmp[ 8 ];
    int n = ini_get( &b, section, key, tmp, sizeof( tmp ), NULL );
    free( b.raw );
    return ( n >= 0 ) ? 1 : 0;
}

extern "C" int hsp3dx_pref_list_keys( const char *section, char *out, size_t cap )
{
    if ( !out || cap == 0 ) return 0;
    out[ 0 ] = 0;
    char path[ 1024 ];
    get_pref_path( path, sizeof( path ) );
    IniBuf b = { 0, 0 };
    if ( ini_load( path, &b ) != 0 ) return 0;

    const char *want_sec = ( section && *section ) ? section : "General";
    const char *p = b.raw;
    char cur_sec[ 128 ] = "General";
    int count = 0;
    size_t oi = 0;
    while ( *p ) {
        const char *eol = strchr( p, '\n' );
        size_t llen = eol ? (size_t)( eol - p ) : strlen( p );
        char line[ 4096 ];
        size_t cp = llen < sizeof( line ) - 1 ? llen : sizeof( line ) - 1;
        memcpy( line, p, cp );
        line[ cp ] = 0;
        while ( cp > 0 && ( line[ cp - 1 ] == '\r' ) ) line[ --cp ] = 0;
        char *trim = line;
        while ( *trim == ' ' || *trim == '\t' ) trim++;
        if ( *trim == '[' ) {
            char *e = strchr( trim, ']' );
            if ( e ) {
                size_t sl = (size_t)( e - trim - 1 );
                if ( sl < sizeof( cur_sec ) ) {
                    memcpy( cur_sec, trim + 1, sl );
                    cur_sec[ sl ] = 0;
                }
            }
        } else if ( strcmp( cur_sec, want_sec ) == 0 && *trim && *trim != ';' && *trim != '#' ) {
            char *eq = strchr( trim, '=' );
            if ( eq ) {
                *eq = 0;
                size_t kl = strlen( trim );
                while ( kl > 0 && trim[ kl - 1 ] == ' ' ) trim[ --kl ] = 0;
                if ( oi + kl + 2 <= cap ) {
                    memcpy( out + oi, trim, kl );
                    oi += kl;
                    out[ oi++ ] = '\n';
                    out[ oi ]   = 0;
                    count++;
                }
            }
        }
        if ( !eol ) break;
        p = eol + 1;
    }
    if ( count > 0 && oi > 0 && out[ oi - 1 ] == '\n' ) out[ --oi ] = 0;
    free( b.raw );
    return count;
}

//  --------------------------------------------------------------------
//  device info: battery / is_dark
//  --------------------------------------------------------------------
extern "C" int hsp3dx_dev_is_dark( void )
{
#if defined(__APPLE__)
    //  Mac: defaults read -g AppleInterfaceStyle  → 出力が "Dark" ならダーク
    char *args[ 5 ] = { (char *)"defaults", (char *)"read", (char *)"-g",
                        (char *)"AppleInterfaceStyle", NULL };
    char buf[ 64 ] = { 0 };
    int rc = run_capture( args, buf, sizeof( buf ) );
    if ( rc != 0 ) return 0;  //  key 無し = light
    return strstr( buf, "Dark" ) ? 1 : 0;
#else
    //  Linux: GTK_THEME 環境変数 or gsettings query
    const char *env = getenv( "GTK_THEME" );
    if ( env && ( strstr( env, "dark" ) || strstr( env, "Dark" ) ) ) return 1;
    if ( access( "/usr/bin/gsettings", X_OK ) == 0 ) {
        char *args[ 5 ] = { (char *)"gsettings", (char *)"get",
                            (char *)"org.gnome.desktop.interface",
                            (char *)"color-scheme", NULL };
        char buf[ 128 ] = { 0 };
        int rc = run_capture( args, buf, sizeof( buf ) );
        if ( rc == 0 && ( strstr( buf, "dark" ) || strstr( buf, "Dark" ) ) ) return 1;
    }
    return 0;
#endif
}

extern "C" void hsp3dx_dev_battery( int *level, int *state )
{
    if ( level ) *level = -1;
    if ( state ) *state = -1;
#if defined(__APPLE__)
    //  pmset -g batt の出力例: "InternalBattery-0 (id=...) 87%; charging; ..."
    char *args[ 4 ] = { (char *)"pmset", (char *)"-g", (char *)"batt", NULL };
    char buf[ 1024 ] = { 0 };
    if ( run_capture( args, buf, sizeof( buf ) ) != 0 ) return;
    const char *p = strchr( buf, '%' );
    if ( p ) {
        const char *q = p;
        while ( q > buf && ( q[ -1 ] >= '0' && q[ -1 ] <= '9' ) ) q--;
        if ( level ) *level = atoi( q );
    }
    if ( state ) {
        if ( strstr( buf, "charged" ) )       *state = 2;
        else if ( strstr( buf, "charging" ) ) *state = 1;
        else if ( strstr( buf, "discharging" ) ) *state = 0;
        else if ( strstr( buf, "AC Power" ) ) *state = 2;
        else if ( strstr( buf, "Battery Power" ) ) *state = 0;
    }
#else
    //  Linux: /sys/class/power_supply/BAT*/{capacity, status}
    DIR *d = opendir( "/sys/class/power_supply" );
    if ( !d ) return;
    struct dirent *de;
    char path[ 256 ];
    while ( ( de = readdir( d ) ) != NULL ) {
        if ( strncmp( de->d_name, "BAT", 3 ) != 0 ) continue;
        snprintf( path, sizeof( path ), "/sys/class/power_supply/%s/capacity", de->d_name );
        FILE *fp = fopen( path, "r" );
        if ( fp ) { int v; if ( fscanf( fp, "%d", &v ) == 1 && level ) *level = v; fclose( fp ); }
        snprintf( path, sizeof( path ), "/sys/class/power_supply/%s/status", de->d_name );
        fp = fopen( path, "r" );
        if ( fp ) {
            char s[ 32 ] = { 0 };
            if ( fgets( s, sizeof( s ), fp ) && state ) {
                if ( strstr( s, "Full" ) )         *state = 2;
                else if ( strstr( s, "Charging" ) ) *state = 1;
                else if ( strstr( s, "Discharging" ) ) *state = 0;
            }
            fclose( fp );
        }
        break;
    }
    closedir( d );
#endif
}

extern "C" int hsp3dx_dev_orientation( void ) { return 0; }
extern "C" void hsp3dx_dev_vibrate( int ) {}
extern "C" void hsp3dx_dev_sound( int ) { fputc( '\a', stderr ); fflush( stderr ); }

#else  //  __EMSCRIPTEN__ — Web は sandbox で大半が不可能なので stub のまま
extern "C" int hsp3dx_platform_exec( const char *, const char *, int ) { return -1; }
extern "C" int hsp3dx_platform_dialog( const char *text, const char *title, int )
{
    fprintf( stderr, "[dialog] %s: %s\n", title ? title : "hsp3dx", text ? text : "" );
    return 1;
}
extern "C" int  hsp3dx_pref_set_str ( const char *, const char *, const char * ) { return -1; }
extern "C" int  hsp3dx_pref_set_int ( const char *, const char *, int ) { return -1; }
extern "C" int  hsp3dx_pref_get_str ( const char *, const char *, char *out, size_t cap, const char *def )
{
    if ( out && cap > 0 ) {
        if ( def ) { strncpy( out, def, cap - 1 ); out[ cap - 1 ] = 0; }
        else out[ 0 ] = 0;
    }
    return -1;
}
extern "C" int  hsp3dx_pref_get_int ( const char *, const char *, int def ) { return def; }
extern "C" int  hsp3dx_pref_remove  ( const char *, const char * ) { return -1; }
extern "C" int  hsp3dx_pref_clear   ( const char * ) { return -1; }
extern "C" int  hsp3dx_pref_exists  ( const char *, const char * ) { return 0; }
extern "C" int  hsp3dx_pref_list_keys( const char *, char *out, size_t cap )
{
    if ( out && cap > 0 ) out[ 0 ] = 0;
    return 0;
}
extern "C" void hsp3dx_dev_vibrate( int ) {}
extern "C" int  hsp3dx_dev_is_dark( void ) { return 0; }
extern "C" void hsp3dx_dev_battery( int *level, int *state ) { if ( level ) *level = -1; if ( state ) *state = -1; }
extern "C" int  hsp3dx_dev_orientation( void ) { return 1; }
extern "C" void hsp3dx_dev_sound( int ) {}
#endif  //  !__EMSCRIPTEN__
extern "C" void hsp3dx_dev_accel   ( double *x, double *y, double *z ) { if(x)*x=0; if(y)*y=0; if(z)*z=0; }
extern "C" void hsp3dx_dev_gyro    ( double *x, double *y, double *z ) { if(x)*x=0; if(y)*y=0; if(z)*z=0; }
extern "C" void hsp3dx_dev_attitude( double *r, double *p, double *y ) { if(r)*r=0; if(p)*p=0; if(y)*y=0; }
extern "C" void hsp3dx_dev_gps_start ( void ) {}
extern "C" void hsp3dx_dev_gps_stop  ( void ) {}
extern "C" void hsp3dx_dev_gps_get   ( double *lat, double *lng ) { if(lat)*lat=0; if(lng)*lng=0; }
extern "C" int  hsp3dx_dev_gps_status( void ) { return 0; }
extern "C" int  hsp3dx_dev_torch_supported( void ) { return 0; }
extern "C" void hsp3dx_dev_torch          ( int ) {}
extern "C" void hsp3dx_dev_mic_start( void ) {}
extern "C" void hsp3dx_dev_mic_stop ( void ) {}
extern "C" int  hsp3dx_dev_mic_level( void ) { return -1; }
extern "C" int  hsp3dx_dev_biometric_auth( const char * ) { return -1; }

//  ====================================================================
//  HTTP (stub — libcurl / emscripten fetch 実装予定)
//  ====================================================================
extern "C" int  hsp3dx_http_request( const char *, const char *, const void *, size_t,
                                     const char *, const char *, const char *, int,
                                     hsp3dx_http_response * ) { return -1; }
extern "C" int  hsp3dx_http_get   ( const char *, const char *, const char *, int, hsp3dx_http_response * ) { return -1; }
extern "C" int  hsp3dx_http_post  ( const char *, const void *, size_t, const char *, const char *, const char *, int, hsp3dx_http_response * ) { return -1; }
extern "C" int  hsp3dx_http_put   ( const char *, const void *, size_t, const char *, const char *, const char *, int, hsp3dx_http_response * ) { return -1; }
extern "C" int  hsp3dx_http_delete( const char *, const char *, const char *, int, hsp3dx_http_response * ) { return -1; }
extern "C" int  hsp3dx_http_patch ( const char *, const void *, size_t, const char *, const char *, const char *, int, hsp3dx_http_response * ) { return -1; }
extern "C" int  hsp3dx_http_download( const char *, const char *, const char *, const char *, int, int *, size_t * ) { return -1; }
extern "C" int  hsp3dx_http_get_header( const hsp3dx_http_response *, const char *, char *out, size_t cap ) { if(out&&cap>0)out[0]=0; return -1; }
extern "C" void hsp3dx_http_cookie_clear( void ) {}
extern "C" void hsp3dx_http_cookie_set_enabled( int ) {}
extern "C" void hsp3dx_http_free( hsp3dx_http_response *resp )
{
    if ( !resp ) return;
    free( resp->body ); resp->body = NULL;
    free( resp->headers ); resp->headers = NULL;
}
extern "C" int  hsp3dx_http_build_basic_auth( const char *, const char *, char *out, size_t cap )
{ if (out && cap > 0) out[0] = 0; return -1; }
extern "C" void hsp3dx_http_mp_begin    ( void ) {}
extern "C" int  hsp3dx_http_mp_add_text ( const char *, const char * ) { return -1; }
extern "C" int  hsp3dx_http_mp_add_file ( const char *, const char *, const char *, const char * ) { return -1; }
extern "C" int  hsp3dx_http_mp_post     ( const char *, const char *, const char *, int, hsp3dx_http_response * ) { return -1; }
extern "C" void hsp3dx_http_mp_end      ( void ) {}

//  ====================================================================
//  WebSocket (stub — libwebsockets / emscripten WS 実装予定)
//  ====================================================================
extern "C" int  hsp3dx_ws_connect( const char *, const char *, int ) { return -1; }
extern "C" void hsp3dx_ws_close  ( int, int ) {}
extern "C" void hsp3dx_ws_free   ( int ) {}
extern "C" int  hsp3dx_ws_send_text  ( int, const char *, size_t ) { return -1; }
extern "C" int  hsp3dx_ws_send_binary( int, const void *, size_t ) { return -1; }
extern "C" int  hsp3dx_ws_recv   ( int, int, void *, size_t, size_t *, int * ) { return -1; }
extern "C" int  hsp3dx_ws_status ( int ) { return 3 /* CLOSED */; }
