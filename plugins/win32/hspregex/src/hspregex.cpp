//
//  hspregex.dll — C++11 std::regex plugin for HSP
//
//  Provides ECMAScript-compatible regular expressions.
//  No external dependencies — uses only the C++ standard library.
//
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <cstdint>
#include <cstring>
#include <string>
#include <regex>
#include <vector>

#define EXPORT extern "C" __declspec(dllexport)

// Internal state for find_all
static std::vector<std::string> g_matches;

// Internal: safe string copy
static void safe_copy(char *dst, int dst_size, const std::string &src)
{
    if (dst == NULL || dst_size <= 0) return;
    int len = (int)src.size();
    if (len >= dst_size) len = dst_size - 1;
    memcpy(dst, src.c_str(), len);
    dst[len] = '\0';
}

//------------------------------------------------------------
// regex_match_ex(pattern, text)
//   Returns 1 if the ENTIRE text matches the pattern, 0 otherwise.
//   On error (bad pattern), returns -1.
//------------------------------------------------------------
EXPORT int __cdecl regex_match_ex(const char *pattern, const char *text)
{
    try {
        std::regex re(pattern, std::regex::ECMAScript);
        return std::regex_match(std::string(text), re) ? 1 : 0;
    } catch (...) {
        return -1;
    }
}

//------------------------------------------------------------
// regex_search_ex(pattern, text, out_match, out_size)
//   Searches for the first match.
//   Returns 1 if found (writes matched substring to out_match),
//   0 if not found, -1 on error.
//------------------------------------------------------------
EXPORT int __cdecl regex_search_ex(const char *pattern, const char *text,
                                      char *out_match, int out_size)
{
    try {
        std::regex re(pattern, std::regex::ECMAScript);
        std::smatch m;
        std::string s(text);
        if (std::regex_search(s, m, re)) {
            safe_copy(out_match, out_size, m[0].str());
            return 1;
        }
        if (out_match && out_size > 0) out_match[0] = '\0';
        return 0;
    } catch (...) {
        return -1;
    }
}

//------------------------------------------------------------
// regex_replace_ex(pattern, text, replacement, out, out_size)
//   Replaces ALL occurrences.
//   Returns the number of replacements made, or -1 on error.
//------------------------------------------------------------
EXPORT int __cdecl regex_replace_ex(const char *pattern, const char *text,
                                       const char *replacement,
                                       char *out, int out_size)
{
    try {
        std::regex re(pattern, std::regex::ECMAScript);
        std::string s(text);

        // Count matches first
        int count = 0;
        {
            auto begin = std::sregex_iterator(s.begin(), s.end(), re);
            auto end = std::sregex_iterator();
            for (auto it = begin; it != end; ++it) count++;
        }

        std::string result = std::regex_replace(s, re, std::string(replacement));
        safe_copy(out, out_size, result);
        return count;
    } catch (...) {
        return -1;
    }
}

//------------------------------------------------------------
// regex_find_all(pattern, text)
//   Finds all non-overlapping matches and stores them internally.
//   Returns the count of matches, or -1 on error.
//   Use regex_find_get() to retrieve each match.
//------------------------------------------------------------
EXPORT int __cdecl regex_find_all(const char *pattern, const char *text)
{
    g_matches.clear();
    try {
        std::regex re(pattern, std::regex::ECMAScript);
        std::string s(text);
        auto begin = std::sregex_iterator(s.begin(), s.end(), re);
        auto end = std::sregex_iterator();
        for (auto it = begin; it != end; ++it) {
            g_matches.push_back((*it)[0].str());
        }
        return (int)g_matches.size();
    } catch (...) {
        return -1;
    }
}

//------------------------------------------------------------
// regex_find_get(index, out, out_size)
//   Retrieves the match at the given index (from regex_find_all).
//   Returns 1 on success, 0 if index out of range.
//------------------------------------------------------------
EXPORT int __cdecl regex_find_get(int index, char *out, int out_size)
{
    if (index < 0 || index >= (int)g_matches.size()) {
        if (out && out_size > 0) out[0] = '\0';
        return 0;
    }
    safe_copy(out, out_size, g_matches[index]);
    return 1;
}

//------------------------------------------------------------
// regex_group_count()
//   After regex_search_ex, returns the number of capture groups
//   in the last search. (Not yet implemented — placeholder)
//------------------------------------------------------------

//------------------------------------------------------------
// regex_search_groups(pattern, text, out_groups, out_size, max_groups)
//   Searches for the first match and extracts capture groups.
//   Groups are written as null-separated strings into out_groups.
//   Returns number of groups (including group 0 = full match),
//   0 if no match, -1 on error.
//------------------------------------------------------------
EXPORT int __cdecl regex_search_groups(const char *pattern, const char *text,
                                          char *out_groups, int out_size, int max_groups)
{
    try {
        std::regex re(pattern, std::regex::ECMAScript);
        std::smatch m;
        std::string s(text);
        if (!std::regex_search(s, m, re)) {
            if (out_groups && out_size > 0) out_groups[0] = '\0';
            return 0;
        }
        int n = (int)m.size();
        if (n > max_groups) n = max_groups;
        int pos = 0;
        for (int i = 0; i < n; i++) {
            std::string g = m[i].str();
            int glen = (int)g.size();
            if (pos + glen + 1 > out_size) break;
            memcpy(out_groups + pos, g.c_str(), glen);
            out_groups[pos + glen] = '\0';
            pos += glen + 1;
        }
        return n;
    } catch (...) {
        return -1;
    }
}

BOOL WINAPI DllMain(HINSTANCE hinst, DWORD reason, LPVOID reserved)
{
    if (reason == DLL_PROCESS_DETACH) {
        g_matches.clear();
    }
    return TRUE;
}
