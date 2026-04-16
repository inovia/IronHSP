;============================================================
;  hsppcre2.as — PCRE2 (Perl互換正規表現) プラグイン宣言
;
;  PCRE2 10.44 static link。UTF-8 対応。
;  Perl/Python/Ruby 互換の高機能正規表現エンジン。
;============================================================

#ifndef __hsppcre2_as__
#define __hsppcre2_as__

#ifdef hsp3cl_64
#uselib "hsppcre2_64.dll"
#else
#ifdef hsp64
#uselib "hsppcre2_64.dll"
#else
#uselib "hsppcre2.dll"
#endif
#endif

#func global pcre2_match_ex "pcre2_match_ex" str, str
#func global pcre2_search_ex "pcre2_search_ex" str, str, var, int
#func global pcre2_replace_ex "pcre2_replace_ex" str, str, str, var, int
#func global pcre2_find_all "pcre2_find_all" str, str
#func global pcre2_find_get "pcre2_find_get" int, var, int
#func global pcre2_search_groups "pcre2_search_groups" str, str, var, int, int

#endif
