//
//  hsp3dx_platform_win.cpp — Win32 版プラットフォーム実装 (exec/dialog/pref)
//
#ifdef _WIN32

#include "hsp3dx_platform.h"

#include <windows.h>
#include <shellapi.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#pragma comment(lib, "shell32.lib")

//  UTF-8 → wchar_t ヘルパ (呼び出し元で free 要)
static wchar_t *u8_dup_w( const char *u8 )
{
    if ( u8 == nullptr ) return nullptr;
    int n = MultiByteToWideChar( CP_UTF8, 0, u8, -1, nullptr, 0 );
    if ( n <= 0 ) return nullptr;
    wchar_t *w = (wchar_t *)malloc( n * sizeof(wchar_t) );
    if ( !w ) return nullptr;
    if ( MultiByteToWideChar( CP_UTF8, 0, u8, -1, w, n ) <= 0 ) { free( w ); return nullptr; }
    return w;
}

//  ----------------------------------------------------------------
//  exec
//  ----------------------------------------------------------------
extern "C" int hsp3dx_platform_exec( const char *url_or_path, const char *param, int /*mode*/ )
{
    if ( !url_or_path ) return -1;
    wchar_t *wpath = u8_dup_w( url_or_path );
    wchar_t *wparam = u8_dup_w( param ? param : "" );
    if ( !wpath ) { if ( wparam ) free( wparam ); return -1; }
    HINSTANCE h = ShellExecuteW( nullptr, L"open", wpath,
                                 ( wparam && wparam[0] ) ? wparam : nullptr,
                                 nullptr, SW_SHOWNORMAL );
    free( wpath ); if ( wparam ) free( wparam );
    //  ShellExecute は INT_PTR を HINSTANCE で返す。32 以下は失敗
    return ( (INT_PTR)h > 32 ) ? 0 : -1;
}

//  ----------------------------------------------------------------
//  dialog
//    戻り値 HSP stat: 1=OK/Yes, 2=Cancel/No, 3=Cancel (mode 3 のみ)
//  ----------------------------------------------------------------
extern "C" int hsp3dx_platform_dialog( const char *text, const char *title, int mode )
{
    wchar_t *wt = u8_dup_w( text  ? text  : "" );
    wchar_t *wc = u8_dup_w( title ? title : "hsp3dx" );
    UINT flag;
    switch ( mode ) {
    case 1:  flag = MB_OKCANCEL    | MB_ICONQUESTION; break;
    case 2:  flag = MB_YESNO       | MB_ICONQUESTION; break;
    case 3:  flag = MB_YESNOCANCEL | MB_ICONQUESTION; break;
    default: flag = MB_OK          | MB_ICONINFORMATION; break;
    }
    int r = MessageBoxW( nullptr, wt ? wt : L"", wc ? wc : L"hsp3dx", flag );
    if ( wt ) free( wt );
    if ( wc ) free( wc );
    //  IDOK=1 → 1、IDCANCEL → 2 (mode 1), IDYES → 1, IDNO → 2, IDCANCEL → 3 (mode 3)
    switch ( r ) {
    case IDOK:     return 1;
    case IDYES:    return 1;
    case IDNO:     return 2;
    case IDCANCEL: return ( mode == 3 ) ? 3 : 2;
    default:       return -1;
    }
}

//  ----------------------------------------------------------------
//  KV 永続ストア: EXE と同名の .ini ファイルを使う (セクション対応)
//    <exe path>.ini (例: hsp3dx.exe → hsp3dx.ini)
//  ----------------------------------------------------------------
static void get_ini_path( wchar_t *out, size_t cap )
{
    if ( !out || cap < 8 ) return;
    DWORD n = GetModuleFileNameW( nullptr, out, (DWORD)cap );
    if ( n == 0 || n >= cap ) { out[0] = 0; return; }
    //  末尾の拡張子 .exe を .ini に置換
    size_t len = (size_t)n;
    for ( size_t i = len; i > 0; i-- ) {
        if ( out[i-1] == L'.' ) {
            if ( i + 3 < cap ) {
                out[i] = L'i'; out[i+1] = L'n'; out[i+2] = L'i'; out[i+3] = 0;
            }
            return;
        }
        if ( out[i-1] == L'\\' || out[i-1] == L'/' ) break;  //  拡張子なし EXE
    }
    //  拡張子が無いパスの場合は ".ini" を末尾追加
    if ( len + 4 < cap ) {
        out[len] = L'.'; out[len+1] = L'i'; out[len+2] = L'n'; out[len+3] = L'i'; out[len+4] = 0;
    }
}

static const wchar_t *sanitize_section( const wchar_t *s )
{
    return ( s && s[0] ) ? s : L"General";
}

extern "C" int hsp3dx_pref_set_str( const char *section, const char *key, const char *value )
{
    if ( !key ) return -1;
    wchar_t ini[_MAX_PATH] = { 0 };
    get_ini_path( ini, _MAX_PATH );
    wchar_t *ws = u8_dup_w( section ? section : "" );
    wchar_t *wk = u8_dup_w( key );
    wchar_t *wv = u8_dup_w( value ? value : "" );
    BOOL r = WritePrivateProfileStringW( sanitize_section( ws ), wk,
                                         wv ? wv : L"", ini );
    if ( ws ) free( ws ); if ( wk ) free( wk ); if ( wv ) free( wv );
    return r ? 0 : -1;
}

extern "C" int hsp3dx_pref_set_int( const char *section, const char *key, int value )
{
    char tmp[32];
    snprintf( tmp, sizeof(tmp), "%d", value );
    return hsp3dx_pref_set_str( section, key, tmp );
}

extern "C" int hsp3dx_pref_get_str( const char *section, const char *key,
                                     char *out, size_t out_cap, const char *default_value )
{
    if ( !key || !out || out_cap == 0 ) return -1;
    wchar_t ini[_MAX_PATH] = { 0 };
    get_ini_path( ini, _MAX_PATH );
    wchar_t *ws = u8_dup_w( section ? section : "" );
    wchar_t *wk = u8_dup_w( key );
    wchar_t *wdef = u8_dup_w( default_value ? default_value : "" );
    wchar_t buf[2048];
    DWORD n = GetPrivateProfileStringW( sanitize_section( ws ), wk,
                                        wdef ? wdef : L"",
                                        buf, (DWORD)(sizeof(buf)/sizeof(wchar_t)), ini );
    if ( ws ) free( ws ); if ( wk ) free( wk ); if ( wdef ) free( wdef );
    int need = WideCharToMultiByte( CP_UTF8, 0, buf, -1, nullptr, 0, nullptr, nullptr );
    if ( need <= 0 || (size_t)need > out_cap ) { out[0] = 0; return -1; }
    WideCharToMultiByte( CP_UTF8, 0, buf, -1, out, (int)out_cap, nullptr, nullptr );
    return (int)n;
}

extern "C" int hsp3dx_pref_get_int( const char *section, const char *key, int default_value )
{
    char buf[32];
    if ( hsp3dx_pref_get_str( section, key, buf, sizeof(buf), "" ) < 0 ) return default_value;
    if ( buf[0] == 0 ) return default_value;
    return atoi( buf );
}

extern "C" int hsp3dx_pref_remove( const char *section, const char *key )
{
    //  WritePrivateProfileString に NULL で値削除、key = NULL で section 削除
    wchar_t ini[_MAX_PATH] = { 0 };
    get_ini_path( ini, _MAX_PATH );
    wchar_t *ws = u8_dup_w( section ? section : "" );
    wchar_t *wk = key ? u8_dup_w( key ) : nullptr;
    BOOL r = WritePrivateProfileStringW( sanitize_section( ws ), wk, nullptr, ini );
    if ( ws ) free( ws ); if ( wk ) free( wk );
    return r ? 0 : -1;
}

extern "C" int hsp3dx_pref_clear( const char *section )
{
    wchar_t ini[_MAX_PATH] = { 0 };
    get_ini_path( ini, _MAX_PATH );
    if ( section && section[0] ) {
        //  セクション全削除
        wchar_t *ws = u8_dup_w( section );
        BOOL r = WritePrivateProfileStringW( ws, nullptr, nullptr, ini );
        if ( ws ) free( ws );
        return r ? 0 : -1;
    }
    //  INI ファイル自体を削除
    return ( DeleteFileW( ini ) || GetLastError() == ERROR_FILE_NOT_FOUND ) ? 0 : -1;
}

#endif  // _WIN32
