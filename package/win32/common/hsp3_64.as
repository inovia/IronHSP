;
; HSP64 define and macros
;
#ifndef __hsp64__
#define __hsp64__
#runtime "hsp3_64"
#bootopt hsp64 1
#cmpopt utf8 1
; _HSP64 は hspcmp64 が自動定義するので `#define global _HSP64 1` は書かない
; (二重定義で「定義済み識別子」エラーになる)
#endif


