//
//  hsp3dx_json.cpp — picojson ベースの JSON ヘルパ実装
//
//  ・ハンドル: int。-1 = 無効。スロット方式で最大 1024 本まで保持。
//  ・path: "user.items[0].name" 形式。先頭 "." や "/" は許容 (無視)。
//  ・picojson は value を値型で扱うので、スロットには unique_ptr<value> を置く。
//
#include "hsp3dx_json.h"

#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <memory>
#include <string>
#include <vector>

//  picojson は <iostream> を引き込むので、hsp3dx 側の warning を緩める
#pragma warning(push)
#pragma warning(disable: 4244 4267 4458 4819)
#include "../extlib/picojson/picojson.h"
#pragma warning(pop)

using picojson::value;
using picojson::object;
using picojson::array;

namespace {

struct Slot {
    value *root = nullptr;   //  ownership あり
};

static const int kMaxSlots = 1024;
static Slot g_slots[ kMaxSlots ];

static int alloc_slot( value *v )
{
    for ( int i = 0; i < kMaxSlots; ++i ) {
        if ( !g_slots[i].root ) {
            g_slots[i].root = v;
            return i;
        }
    }
    delete v;
    return -1;
}

static value *slot_root( int handle )
{
    if ( handle < 0 || handle >= kMaxSlots ) return nullptr;
    return g_slots[handle].root;
}

//  ------------------------------------------------------------------
//  path parse: "a.b[0].c" → ["a"] ["b"] [0] ["c"]
//      token: string (obj key) or integer (array index)
//  ------------------------------------------------------------------
struct PathToken {
    bool         is_index;
    int          index;
    std::string  key;
};

static bool parse_path( const char *path, std::vector<PathToken> &out )
{
    out.clear();
    if ( !path ) return true;
    const char *p = path;
    //  先頭 "." や "/" は読み捨てる (JSON Pointer 風)
    while ( *p == '.' || *p == '/' ) ++p;

    while ( *p ) {
        if ( *p == '[' ) {
            //  [数値]
            ++p;
            char *end = nullptr;
            long v = strtol( p, &end, 10 );
            if ( end == p || *end != ']' ) return false;
            PathToken t; t.is_index = true; t.index = (int)v;
            out.push_back( t );
            p = end + 1;
            //  "[0]." や "[0][1]" のように続きうる
            if ( *p == '.' ) ++p;
        } else {
            //  key 読み取り (次の '.' '[' まで)
            std::string k;
            while ( *p && *p != '.' && *p != '[' ) k += *p++;
            if ( k.empty() ) return false;
            PathToken t; t.is_index = false; t.key = std::move(k);
            out.push_back( t );
            if ( *p == '.' ) ++p;
        }
    }
    return true;
}

//  token 列をたどって終端 value への参照を返す (create=true で途中を自動生成)
static value *traverse( value *root, const std::vector<PathToken> &toks,
                        bool create )
{
    value *cur = root;
    for ( size_t i = 0; i < toks.size(); ++i ) {
        const PathToken &t = toks[i];
        if ( t.is_index ) {
            if ( !cur->is<array>() ) {
                if ( !create ) return nullptr;
                *cur = value( array() );
            }
            array &a = cur->get<array>();
            if ( t.index < 0 ) return nullptr;
            if ( (size_t)t.index >= a.size() ) {
                if ( !create ) return nullptr;
                a.resize( (size_t)t.index + 1 );
            }
            cur = &a[ (size_t)t.index ];
        } else {
            if ( !cur->is<object>() ) {
                if ( !create ) return nullptr;
                *cur = value( object() );
            }
            object &o = cur->get<object>();
            auto it = o.find( t.key );
            if ( it == o.end() ) {
                if ( !create ) return nullptr;
                auto ins = o.insert( std::make_pair( t.key, value() ) );
                cur = &ins.first->second;
            } else {
                cur = &it->second;
            }
        }
    }
    return cur;
}

//  path の末尾 1 トークンを除いた親 + 最終トークンを返す。remove 用。
static bool traverse_parent( value *root, const std::vector<PathToken> &toks,
                             value **parent_out, PathToken *last_out )
{
    if ( toks.empty() ) return false;
    std::vector<PathToken> parent_toks( toks.begin(), toks.end() - 1 );
    value *parent = traverse( root, parent_toks, false );
    if ( !parent ) return false;
    *parent_out = parent;
    *last_out = toks.back();
    return true;
}

//  読み取り用 const value* を path から得る
static const value *get_const( int handle, const char *path )
{
    value *root = slot_root( handle );
    if ( !root ) return nullptr;
    std::vector<PathToken> toks;
    if ( !parse_path( path, toks ) ) return nullptr;
    return traverse( root, toks, false );
}

//  書き込み用 value* を (必要なら生成) 返す
static value *get_mut( int handle, const char *path )
{
    value *root = slot_root( handle );
    if ( !root ) return nullptr;
    std::vector<PathToken> toks;
    if ( !parse_path( path, toks ) ) return nullptr;
    return traverse( root, toks, true );
}

} // namespace

//  ==================================================================
//  extern "C" API
//  ==================================================================

extern "C" int hsp3dx_json_parse( const char *src )
{
    if ( !src ) return -1;
    value *v = new value();
    std::string err = picojson::parse( *v, src, src + strlen(src) );
    if ( !err.empty() ) { delete v; return -1; }
    return alloc_slot( v );
}

extern "C" int hsp3dx_json_new_obj( void )
{
    value *v = new value( object() );
    return alloc_slot( v );
}

extern "C" int hsp3dx_json_new_arr( void )
{
    value *v = new value( array() );
    return alloc_slot( v );
}

extern "C" void hsp3dx_json_free( int handle )
{
    if ( handle < 0 || handle >= kMaxSlots ) return;
    delete g_slots[handle].root;
    g_slots[handle].root = nullptr;
}

extern "C" int hsp3dx_json_stringify( int handle, int pretty,
                                       char *out, size_t out_cap )
{
    value *root = slot_root( handle );
    if ( !root ) return -1;
    std::string s = root->serialize( pretty != 0 );
    int n = (int)s.size();
    if ( out && out_cap > 0 ) {
        size_t copy = (s.size() < out_cap - 1) ? s.size() : (out_cap - 1);
        memcpy( out, s.data(), copy );
        out[copy] = 0;
    }
    return n;
}

extern "C" int hsp3dx_json_type( int handle, const char *path )
{
    const value *v = get_const( handle, path );
    if ( !v ) return HSP3DX_JTYPE_INVALID;
    if ( v->is<picojson::null>() ) return HSP3DX_JTYPE_NULL;
    if ( v->is<bool>()            ) return HSP3DX_JTYPE_BOOL;
    if ( v->is<double>()          ) return HSP3DX_JTYPE_NUMBER;
    if ( v->is<std::string>()     ) return HSP3DX_JTYPE_STRING;
    if ( v->is<array>()           ) return HSP3DX_JTYPE_ARRAY;
    if ( v->is<object>()          ) return HSP3DX_JTYPE_OBJECT;
    return HSP3DX_JTYPE_INVALID;
}

extern "C" int hsp3dx_json_size( int handle, const char *path )
{
    const value *v = get_const( handle, path );
    if ( !v ) return -1;
    if ( v->is<array>()  ) return (int)v->get<array>().size();
    if ( v->is<object>() ) return (int)v->get<object>().size();
    return -1;
}

extern "C" int hsp3dx_json_key_at( int handle, const char *path, int index,
                                    char *out, size_t out_cap )
{
    const value *v = get_const( handle, path );
    if ( !v || !v->is<object>() ) { if (out && out_cap) out[0] = 0; return -1; }
    const object &o = v->get<object>();
    if ( index < 0 || (size_t)index >= o.size() ) { if (out && out_cap) out[0] = 0; return -1; }
    auto it = o.begin();
    std::advance( it, index );
    const std::string &k = it->first;
    if ( out && out_cap > 0 ) {
        size_t copy = (k.size() < out_cap - 1) ? k.size() : (out_cap - 1);
        memcpy( out, k.data(), copy );
        out[copy] = 0;
    }
    return 0;
}

extern "C" int hsp3dx_json_get_str( int handle, const char *path,
                                     char *out, size_t out_cap,
                                     const char *defval )
{
    const value *v = get_const( handle, path );
    std::string s;
    int rc;
    if ( v && v->is<std::string>() ) { s = v->get<std::string>(); rc = 0; }
    else if ( v )                    { s = v->to_str();            rc = 0; }
    else                             { s = defval ? defval : "";   rc = -1; }
    if ( out && out_cap > 0 ) {
        size_t copy = (s.size() < out_cap - 1) ? s.size() : (out_cap - 1);
        memcpy( out, s.data(), copy );
        out[copy] = 0;
    }
    return rc;
}

extern "C" int hsp3dx_json_get_int( int handle, const char *path, int defval )
{
    const value *v = get_const( handle, path );
    if ( !v ) return defval;
    if ( v->is<double>() ) return (int)v->get<double>();
    if ( v->is<bool>()   ) return v->get<bool>() ? 1 : 0;
    if ( v->is<std::string>() ) {
        const char *s = v->get<std::string>().c_str();
        return (int)strtol( s, nullptr, 10 );
    }
    return defval;
}

extern "C" int hsp3dx_json_get_double( int handle, const char *path,
                                        double *out, double defval )
{
    const value *v = get_const( handle, path );
    if ( !v || !v->is<double>() ) { if (out) *out = defval; return -1; }
    if ( out ) *out = v->get<double>();
    return 0;
}

extern "C" int hsp3dx_json_get_bool( int handle, const char *path, int defval )
{
    const value *v = get_const( handle, path );
    if ( !v ) return defval;
    if ( v->is<bool>()   ) return v->get<bool>() ? 1 : 0;
    if ( v->is<double>() ) return v->get<double>() != 0.0 ? 1 : 0;
    return defval;
}

extern "C" int hsp3dx_json_set_str( int handle, const char *path, const char *value_ )
{
    value *v = get_mut( handle, path );
    if ( !v ) return -1;
    *v = value( value_ ? std::string(value_) : std::string() );
    return 0;
}

extern "C" int hsp3dx_json_set_int( int handle, const char *path, int value_ )
{
    value *v = get_mut( handle, path );
    if ( !v ) return -1;
    *v = value( (double)value_ );
    return 0;
}

extern "C" int hsp3dx_json_set_double( int handle, const char *path, double value_ )
{
    value *v = get_mut( handle, path );
    if ( !v ) return -1;
    *v = value( value_ );
    return 0;
}

extern "C" int hsp3dx_json_set_bool( int handle, const char *path, int value_ )
{
    value *v = get_mut( handle, path );
    if ( !v ) return -1;
    *v = value( value_ != 0 );
    return 0;
}

extern "C" int hsp3dx_json_set_null( int handle, const char *path )
{
    value *v = get_mut( handle, path );
    if ( !v ) return -1;
    *v = value();
    return 0;
}

extern "C" int hsp3dx_json_set_obj( int handle, const char *path )
{
    value *v = get_mut( handle, path );
    if ( !v ) return -1;
    *v = value( object() );
    return 0;
}

extern "C" int hsp3dx_json_set_arr( int handle, const char *path )
{
    value *v = get_mut( handle, path );
    if ( !v ) return -1;
    *v = value( array() );
    return 0;
}

extern "C" int hsp3dx_json_remove( int handle, const char *path )
{
    value *root = slot_root( handle );
    if ( !root ) return -1;
    std::vector<PathToken> toks;
    if ( !parse_path( path, toks ) ) return -1;
    if ( toks.empty() ) {
        *root = value();                //  全消去は null 化
        return 0;
    }
    value *parent = nullptr;
    PathToken last;
    if ( !traverse_parent( root, toks, &parent, &last ) ) return -1;
    if ( last.is_index ) {
        if ( !parent->is<array>() ) return -1;
        array &a = parent->get<array>();
        if ( last.index < 0 || (size_t)last.index >= a.size() ) return -1;
        a.erase( a.begin() + last.index );
    } else {
        if ( !parent->is<object>() ) return -1;
        object &o = parent->get<object>();
        auto it = o.find( last.key );
        if ( it == o.end() ) return -1;
        o.erase( it );
    }
    return 0;
}
