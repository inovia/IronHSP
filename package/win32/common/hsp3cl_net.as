;
; HSP3 .NET (hsp3net) 32bit コンソール 定義・マクロ
;   - コンソールモード (mes / stop が stdout に出力)
;   - hsp3net 専用機能 (intptr / NSTRUCT / .NET 連携) 全て有効
;   - テストやヘッドレス実行に便利
;
#ifndef __hsp3cl_net__
#define __hsp3cl_net__
#runtime "hsp3cl_net"
#cmpopt utf8 1
; hsp3net 専用識別子 (intptr / NSTRUCT / cfuncst / #defcbcom 等の
;   .NET 限定機能を `#ifdef _HSP_NET` でガード可能にする)
#define global _HSP_NET 1
#endif
