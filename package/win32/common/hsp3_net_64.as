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
; `#bootopt hsp64 1` で hspcmp が preprocessor マクロ _HSP64 を自動登録する
; (32bit hspcmp / 64bit hspcmp64 どちらでも target=64bit と判断される)
; hsp3net 専用識別子 (intptr / NSTRUCT / cfuncst / cfuncd / cfuncf /
;   #defcbcom 等の .NET 限定機能を `#ifdef _HSP_NET` でガード可能にする)
#define global _HSP_NET 1
#endif
