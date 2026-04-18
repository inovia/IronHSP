;
; HSP3CL 64bit (vanilla) define and macros
;
#ifndef __hsp3cl_64__
#define __hsp3cl_64__
#runtime "hsp3cl_64"
#bootopt hsp64 1
; _HSP64 は hspcmp64 が自動定義するので `#define global _HSP64 1` は書かない
; (二重定義で「定義済み識別子」エラーになる)
#endif

#addition "dish_enhance.as"
