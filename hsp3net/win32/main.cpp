/*--------------------------------------------------------
	HSP3 interpreter main
									  1995/10 onitama
									  1997/7  onitama
									  1999/8  onitama
									  2003/4  onitama
  --------------------------------------------------------*/

#include <stdio.h>
#include <string.h>
#include "hsp3cl.h"
#ifdef HSP_TEST_MODE
#include "../hsp3_test_hooks.h"
#endif

/*----------------------------------------------------------*/

int main( int argc, char *argv[] )
{
	int res;
	char *p;

#ifdef HSP3_DAP_MODE
	// DAP モードでは stdout/stderr をラインバッファ化する。デフォルトの
	// ブロックバッファだと mes 出力が end まで溜め込まれ、VS Code の
	// Debug Console にリアルタイムに流れない。
	setvbuf( stdout, NULL, _IONBF, 0 );
	setvbuf( stderr, NULL, _IONBF, 0 );
#endif

#ifdef HSPDEBUG
	if ( argc > 1 ) p = argv[ 1 ]; else p = "";
#else
	p = NULL;
#endif

#ifdef HSP_TEST_MODE
	hsptest_init( argv[0], p );
#endif

	res = hsp3cl_init( p );
	if ( res ) {
#ifdef HSP_TEST_MODE
		if ( hsptest_get_exit_code() == 0 ) hsptest_set_exit_code( res );
		hsptest_emit_end( hsptest_get_exit_code() );
		return hsptest_get_exit_code();
#endif
		return res;
	}
	res = hsp3cl_exec();

#ifdef HSP_TEST_MODE
	if ( hsptest_get_exit_code() == 0 && res != 0 ) hsptest_set_exit_code( res );
	hsptest_emit_end( hsptest_get_exit_code() );
	return hsptest_get_exit_code();
#endif
	return res;
}



