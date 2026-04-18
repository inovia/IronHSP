#ifndef __hsp3cl_net_64__
#define __hsp3cl_net_64__
#runtime "hsp3cl_net_64"
#bootopt hsp64 1
#cmpopt utf8 1
; hsp3net 専用識別子 (intptr / NSTRUCT / cfuncst / cfuncd / cfuncf /
;   #defcbcom 等の .NET 限定機能を #ifdef _HSP_NET でガード可能にする)
#define global _HSP_NET 1
#endif

; ==========================================================================
; HSP3 .NET (hsp3net) 64bit コンソール ランタイム定義
;   - コンソールモード (mes / stop が stdout に出力)
;   - hsp3net 64bit ─ IronHSP の推奨ランタイム (テスト/CI 用)
;   - hsp3net 専用機能 (intptr / NSTRUCT / cfuncst / .NET 連携) 全て有効
;
;   #bootopt hsp64 1 で hspcmp が preprocessor マクロ _HSP64 を自動登録する
;   (32bit hspcmp / 64bit hspcmp64 どちらでも target=64bit と判断される)
;
;   使い方:
;     #include "hsp3cl_net_64.as"
;         mes "test"
;         end 0
