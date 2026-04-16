;
; HSP3 .NET (hsp3net) 64bit コンソール 定義・マクロ
;   - コンソールモード (mes / stop が stdout に出力)
;   - hsp3net 64bit ─ IronHSP の推奨ランタイム (テスト/CI 用)
;   - hsp3net 専用機能 (intptr / NSTRUCT / cfuncst / .NET 連携) 全て有効
;
;   使い方:
;     #include "hsp3cl_net_64.as"
;     #include "iron_csv.hsp"
;         mes "test"
;         end 0
;
;     hspcmp_net_64 sample.hsp -o sample.ax
;     hsp3cl_net_64 sample.ax    → stdout に "test" 出力
;
#ifndef __hsp3cl_net_64__
#define __hsp3cl_net_64__
#runtime "hsp3cl_net_64"
#bootopt hsp64 1
#cmpopt utf8 1
; 64bit 用プリプロセッサ識別子 (プラグイン .as 側の #ifdef _HSP64 を有効化)
#define global _HSP64 1
#endif
