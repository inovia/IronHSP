;============================================================
;  hspregex.as — C++11 std::regex プラグイン宣言
;
;  ECMAScript 互換の正規表現を提供。
;  外部依存なし (C++ 標準ライブラリのみ)。
;============================================================

#ifndef __hspregex_as__
#define __hspregex_as__

#ifdef hsp3cl_64
#uselib "hspregex_64.dll"
#else
#ifdef hsp64
#uselib "hspregex_64.dll"
#else
#uselib "hspregex.dll"
#endif
#endif

; regex_match_ex(pattern, text) → stat: 1=match, 0=no match, -1=error
#func global regex_match_ex "regex_match_ex" str, str

; regex_search_ex(pattern, text, var_out, out_size) → stat: 1=found, 0=not found
#func global regex_search_ex "regex_search_ex" str, str, var, int

; regex_replace_ex(pattern, text, replacement, var_out, out_size) → stat: replacement count
#func global regex_replace_ex "regex_replace_ex" str, str, str, var, int

; regex_find_all(pattern, text) → stat: match count (-1=error)
#func global regex_find_all "regex_find_all" str, str

; regex_find_get(index, var_out, out_size) → stat: 1=ok, 0=out of range
#func global regex_find_get "regex_find_get" int, var, int

; regex_search_groups(pattern, text, var_out, out_size, max_groups) → stat: group count
#func global regex_search_groups "regex_search_groups" str, str, var, int, int

#endif
