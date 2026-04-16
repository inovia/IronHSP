//
//  hsppcre2.dll — PCRE2 regex plugin for HSP
//
//  Perl 互換の正規表現 (PCRE2 10.44) を提供。
//  Unicode (UTF-8) 対応。
//
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <cstdint>
#include <cstring>
#include <string>
#include <vector>

#define PCRE2_CODE_UNIT_WIDTH 8
#define PCRE2_STATIC
#include "pcre2.h"

#define EXPORT extern "C" __declspec(dllexport)

// Internal state for find_all
static std::vector<std::string> g_matches;

// Internal: safe string copy
static void safe_copy(char *dst, int dst_size, const char *src, int src_len)
{
    if (dst == NULL || dst_size <= 0) return;
    if (src_len < 0) src_len = (int)strlen(src);
    if (src_len >= dst_size) src_len = dst_size - 1;
    memcpy(dst, src, src_len);
    dst[src_len] = '\0';
}

//------------------------------------------------------------
// pcre2_match_ex(pattern, text)
//   Returns 1 if the ENTIRE text matches, 0 otherwise, -1 on error.
//------------------------------------------------------------
EXPORT int __cdecl pcre2_match_ex(const char *pattern, const char *text)
{
    int errcode;
    PCRE2_SIZE erroffset;
    // Anchor match: wrap pattern with ^(?:...)$ for full match
    std::string anchored = "^(?:" + std::string(pattern) + ")$";
    pcre2_code *re = pcre2_compile(
        (PCRE2_SPTR)anchored.c_str(), PCRE2_ZERO_TERMINATED,
        PCRE2_UTF, &errcode, &erroffset, NULL);
    if (re == NULL) return -1;

    pcre2_match_data *md = pcre2_match_data_create_from_pattern(re, NULL);
    int rc = pcre2_match(re, (PCRE2_SPTR)text, PCRE2_ZERO_TERMINATED,
                         0, 0, md, NULL);
    pcre2_match_data_free(md);
    pcre2_code_free(re);
    return (rc >= 0) ? 1 : 0;
}

//------------------------------------------------------------
// pcre2_search_ex(pattern, text, out_match, out_size)
//   Searches for the first match.
//   Returns 1 if found, 0 if not, -1 on error.
//------------------------------------------------------------
EXPORT int __cdecl pcre2_search_ex(const char *pattern, const char *text,
                                    char *out_match, int out_size)
{
    int errcode;
    PCRE2_SIZE erroffset;
    pcre2_code *re = pcre2_compile(
        (PCRE2_SPTR)pattern, PCRE2_ZERO_TERMINATED,
        PCRE2_UTF, &errcode, &erroffset, NULL);
    if (re == NULL) return -1;

    pcre2_match_data *md = pcre2_match_data_create_from_pattern(re, NULL);
    int rc = pcre2_match(re, (PCRE2_SPTR)text, PCRE2_ZERO_TERMINATED,
                         0, 0, md, NULL);
    if (rc >= 0) {
        PCRE2_SIZE *ovector = pcre2_get_ovector_pointer(md);
        int len = (int)(ovector[1] - ovector[0]);
        safe_copy(out_match, out_size, text + ovector[0], len);
    } else {
        if (out_match && out_size > 0) out_match[0] = '\0';
    }
    pcre2_match_data_free(md);
    pcre2_code_free(re);
    return (rc >= 0) ? 1 : 0;
}

//------------------------------------------------------------
// pcre2_replace_ex(pattern, text, replacement, out, out_size)
//   Replaces ALL occurrences.
//   Returns replacement count, or -1 on error.
//------------------------------------------------------------
EXPORT int __cdecl pcre2_replace_ex(const char *pattern, const char *text,
                                     const char *replacement,
                                     char *out, int out_size)
{
    int errcode;
    PCRE2_SIZE erroffset;
    pcre2_code *re = pcre2_compile(
        (PCRE2_SPTR)pattern, PCRE2_ZERO_TERMINATED,
        PCRE2_UTF, &errcode, &erroffset, NULL);
    if (re == NULL) return -1;

    PCRE2_SIZE outlen = (PCRE2_SIZE)out_size;
    int rc = pcre2_substitute(
        re, (PCRE2_SPTR)text, PCRE2_ZERO_TERMINATED,
        0, PCRE2_SUBSTITUTE_GLOBAL | PCRE2_SUBSTITUTE_OVERFLOW_LENGTH,
        NULL, NULL,
        (PCRE2_SPTR)replacement, PCRE2_ZERO_TERMINATED,
        (PCRE2_UCHAR *)out, &outlen);

    pcre2_code_free(re);
    if (rc < 0) {
        if (out && out_size > 0) out[0] = '\0';
        return -1;
    }
    return rc;
}

//------------------------------------------------------------
// pcre2_find_all(pattern, text)
//   Finds all matches. Returns count, -1 on error.
//------------------------------------------------------------
EXPORT int __cdecl pcre2_find_all(const char *pattern, const char *text)
{
    g_matches.clear();
    int errcode;
    PCRE2_SIZE erroffset;
    pcre2_code *re = pcre2_compile(
        (PCRE2_SPTR)pattern, PCRE2_ZERO_TERMINATED,
        PCRE2_UTF, &errcode, &erroffset, NULL);
    if (re == NULL) return -1;

    pcre2_match_data *md = pcre2_match_data_create_from_pattern(re, NULL);
    PCRE2_SIZE start = 0;
    PCRE2_SIZE textlen = strlen(text);

    while (start <= textlen) {
        int rc = pcre2_match(re, (PCRE2_SPTR)text, textlen,
                             start, 0, md, NULL);
        if (rc < 0) break;
        PCRE2_SIZE *ovector = pcre2_get_ovector_pointer(md);
        int len = (int)(ovector[1] - ovector[0]);
        g_matches.push_back(std::string(text + ovector[0], len));
        start = ovector[1];
        if (ovector[0] == ovector[1]) start++;  // avoid infinite loop on empty match
    }

    pcre2_match_data_free(md);
    pcre2_code_free(re);
    return (int)g_matches.size();
}

//------------------------------------------------------------
// pcre2_find_get(index, out, out_size)
//------------------------------------------------------------
EXPORT int __cdecl pcre2_find_get(int index, char *out, int out_size)
{
    if (index < 0 || index >= (int)g_matches.size()) {
        if (out && out_size > 0) out[0] = '\0';
        return 0;
    }
    safe_copy(out, out_size, g_matches[index].c_str(), (int)g_matches[index].size());
    return 1;
}

//------------------------------------------------------------
// pcre2_search_groups(pattern, text, out_groups, out_size, max_groups)
//------------------------------------------------------------
EXPORT int __cdecl pcre2_search_groups(const char *pattern, const char *text,
                                        char *out_groups, int out_size, int max_groups)
{
    int errcode;
    PCRE2_SIZE erroffset;
    pcre2_code *re = pcre2_compile(
        (PCRE2_SPTR)pattern, PCRE2_ZERO_TERMINATED,
        PCRE2_UTF, &errcode, &erroffset, NULL);
    if (re == NULL) return -1;

    pcre2_match_data *md = pcre2_match_data_create_from_pattern(re, NULL);
    int rc = pcre2_match(re, (PCRE2_SPTR)text, PCRE2_ZERO_TERMINATED,
                         0, 0, md, NULL);
    if (rc < 0) {
        pcre2_match_data_free(md);
        pcre2_code_free(re);
        if (out_groups && out_size > 0) out_groups[0] = '\0';
        return 0;
    }

    PCRE2_SIZE *ovector = pcre2_get_ovector_pointer(md);
    int n = rc;
    if (n > max_groups) n = max_groups;
    int pos = 0;
    for (int i = 0; i < n; i++) {
        int glen = (int)(ovector[2*i+1] - ovector[2*i]);
        if (pos + glen + 1 > out_size) break;
        memcpy(out_groups + pos, text + ovector[2*i], glen);
        out_groups[pos + glen] = '\0';
        pos += glen + 1;
    }

    pcre2_match_data_free(md);
    pcre2_code_free(re);
    return n;
}

BOOL WINAPI DllMain(HINSTANCE hinst, DWORD reason, LPVOID reserved)
{
    if (reason == DLL_PROCESS_DETACH) {
        g_matches.clear();
    }
    return TRUE;
}
