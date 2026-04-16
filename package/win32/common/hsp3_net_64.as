;
; HSP3 .NET (hsp3net) 64bit GUI 定義・マクロ
;   - WinForms ベースの拡張 GUI (x64)
;   - intptr / NSTRUCT / cfuncst / cfuncd / cfuncf / .NET 連携など
;     hsp3net 専用機能を全て有効化
;   - hsp3net 64bit が IronHSP の推奨ランタイム
;
#ifndef __hsp3_net_64__
#define __hsp3_net_64__
#runtime "hsp3_net_64"
#bootopt hsp64 1
#cmpopt utf8 1
; 64bit 用プリプロセッサ識別子 (プラグイン .as 側の #ifdef _HSP64 を有効化)
#define global _HSP64 1
#endif
