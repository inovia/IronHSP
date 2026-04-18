;
; HSP3 .NET (hsp3net) 32bit GUI 定義・マクロ
;   - WinForms ベースの拡張 GUI
;   - intptr / NSTRUCT / cfuncst / .NET 連携など hsp3net 専用機能を有効化
;
#ifndef __hsp3_net__
#define __hsp3_net__
#runtime "hsp3_net"
#cmpopt utf8 1
; hsp3net 専用識別子 (intptr / NSTRUCT / cfuncst / #defcbcom 等の
;   .NET 限定機能を `#ifdef _HSP_NET` でガード可能にする)
#define global _HSP_NET 1
#endif
