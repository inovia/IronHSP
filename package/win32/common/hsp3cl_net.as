;
; HSP3 .NET (hsp3net) 32bit Console define and macros
;   - コンソールモード (mes / stop が stdout に出力)
;   - hsp3net 専用機能 (intptr / NSTRUCT / .NET 連携) 全て有効
;   - テストやヘッドレス実行に便利
;
#ifndef __hsp3cl_net__
#define __hsp3cl_net__
#runtime "hsp3cl_net"
#cmpopt utf8 1
#endif
