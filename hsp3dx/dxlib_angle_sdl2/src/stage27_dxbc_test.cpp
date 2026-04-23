//
// Stage 27: DXBC → GLSL translator の単体テスト
//
// 使い方: stage27_dxbc_test.exe [path/to/file.vso|.pso]
//   指定ファイルを DXBC として parse + GLSL 翻訳し、stderr に disassembly
//   ダンプと翻訳結果を出力する。GL context は作成しない (pure test)。
//
#include "Desktop/DxDxbcTranslator.h"

#include <cstdio>
#include <cstdlib>
#include <string>
#include <vector>

int main( int argc, char **argv )
{
    if ( argc < 2 ) {
        std::fprintf( stderr, "usage: %s <file.vso|file.pso>\n", argv[ 0 ] ) ;
        return 1 ;
    }
    FILE *f = std::fopen( argv[ 1 ], "rb" ) ;
    if ( !f ) { std::perror( argv[ 1 ] ) ; return 1 ; }
    std::fseek( f, 0, SEEK_END ) ;
    long sz = std::ftell( f ) ;
    std::fseek( f, 0, SEEK_SET ) ;
    std::vector<unsigned char> buf( sz ) ;
    std::fread( buf.data(), 1, sz, f ) ;
    std::fclose( f ) ;

    std::fprintf( stderr, "=== Disassembly ===\n" ) ;
    DxDxbc_Disassemble( buf.data(), ( int )sz ) ;

    std::fprintf( stderr, "\n=== Translation ===\n" ) ;
    std::string glsl ;
    int prog_type = -1 ;
    int rc = DxDxbc_Translate( buf.data(), ( int )sz, &glsl, &prog_type ) ;
    std::fprintf( stderr, "rc=%d program_type=%d\n", rc, prog_type ) ;
    std::fprintf( stderr, "--- BEGIN GLSL ---\n%s--- END GLSL ---\n", glsl.c_str() ) ;
    return rc == 0 ? 0 : 2 ;
}
