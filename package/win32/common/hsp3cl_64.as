;
; HSP3CL 64bit (vanilla) define and macros
;
#ifndef __hsp3cl_64__
#define __hsp3cl_64__
#runtime "hsp3cl_64"
#bootopt hsp64 1
; `#bootopt hsp64 1` で hspcmp が preprocessor マクロ _HSP64 を自動登録する
; (32bit hspcmp / 64bit hspcmp64 どちらでも target=64bit と判断される)
#endif

#addition "dish_enhance.as"
