//
//  hsp3dx_platform_common.cpp — プラットフォーム非依存の共通 pref ラッパ
//
//  pref_set_double / pref_get_double は各プラットフォームで共通実装 (文字列経由)。
//  各 OS 固有 double ストレージ (NSUserDefaults.doubleForKey 等) は使わず、
//  hsp3dx_pref_set_str / _get_str をそのまま呼び出す。
//
#include "hsp3dx_platform.h"

#include <stdio.h>
#include <stdlib.h>

extern "C" int hsp3dx_pref_set_double( const char *section, const char *key, double value )
{
    char tmp[64];
    //  17 桁精度で double → 文字列化 (IEEE754 往復ロスレス)
    snprintf( tmp, sizeof(tmp), "%.17g", value );
    return hsp3dx_pref_set_str( section, key, tmp );
}

extern "C" double hsp3dx_pref_get_double( const char *section, const char *key, double default_value )
{
    char buf[64];
    int rc = hsp3dx_pref_get_str( section, key, buf, sizeof(buf), "" );
    if ( rc < 0 || buf[0] == 0 ) return default_value;
    return atof( buf );
}
