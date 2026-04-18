;
; HSP64 define and macros
;
#ifndef __hsp64__
#define __hsp64__
#runtime "hsp3_64"
#bootopt hsp64 1
#cmpopt utf8 1
; `#bootopt hsp64 1` で hspcmp が preprocessor マクロ _HSP64 を自動登録する
; (32bit hspcmp / 64bit hspcmp64 どちらでも target=64bit と判断される)
#endif


