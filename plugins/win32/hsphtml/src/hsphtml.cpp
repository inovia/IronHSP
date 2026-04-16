//
//  hsphtml.dll - Simple HTML/XML tag parser plugin for HSP
//
//  Provides basic HTML parsing: extract text, find tags, get attributes.
//  No external dependencies.
//
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <cstdint>
#include <cstring>
#include <string>
#include <vector>
#include <algorithm>

#define EXPORT extern "C" __declspec(dllexport)

struct HtmlTag {
    std::string name;
    std::string inner_text;
    std::string outer_html;
    std::vector<std::pair<std::string, std::string>> attrs;
};

static std::vector<HtmlTag> g_tags;
static std::string g_text;

static std::string tolower_str(const std::string &s)
{
    std::string r = s;
    std::transform(r.begin(), r.end(), r.begin(), ::tolower);
    return r;
}

static void safe_copy(char *dst, int size, const std::string &src)
{
    if (!dst || size <= 0) return;
    int len = (int)src.size();
    if (len >= size) len = size - 1;
    memcpy(dst, src.c_str(), len);
    dst[len] = '\0';
}

// Simple HTML tag parser
static void parse_html(const char *html)
{
    g_tags.clear();
    g_text.clear();

    const char *p = html;
    while (*p) {
        if (*p == '<') {
            const char *tag_start = p;
            p++;
            // Skip comments
            if (p[0] == '!' && p[1] == '-' && p[2] == '-') {
                const char *end = strstr(p, "-->");
                if (end) { p = end + 3; continue; }
            }
            // Skip closing tags for enumeration but include in text extraction
            bool is_closing = (*p == '/');
            if (is_closing) p++;

            // Read tag name
            std::string tagname;
            while (*p && *p != '>' && *p != ' ' && *p != '/' && *p != '\t' && *p != '\n' && *p != '\r')
                tagname += *p++;

            // Read attributes
            std::vector<std::pair<std::string, std::string>> attrs;
            while (*p && *p != '>' && *p != '/') {
                while (*p == ' ' || *p == '\t' || *p == '\n' || *p == '\r') p++;
                if (*p == '>' || *p == '/') break;
                std::string aname, aval;
                while (*p && *p != '=' && *p != '>' && *p != ' ' && *p != '/')
                    aname += *p++;
                if (*p == '=') {
                    p++;
                    char q = 0;
                    if (*p == '"' || *p == '\'') { q = *p; p++; }
                    while (*p && (q ? *p != q : (*p != ' ' && *p != '>')))
                        aval += *p++;
                    if (q && *p == q) p++;
                }
                if (!aname.empty()) attrs.push_back({tolower_str(aname), aval});
            }
            // Skip self-closing / and >
            if (*p == '/') p++;
            if (*p == '>') p++;

            if (!is_closing && !tagname.empty()) {
                HtmlTag tag;
                tag.name = tolower_str(tagname);
                tag.attrs = attrs;

                // Find inner text (until matching closing tag)
                std::string close_tag = "</" + tag.name;
                const char *close = p;
                // Case-insensitive search for closing tag
                while (*close) {
                    if (*close == '<' && *(close+1) == '/') {
                        std::string cname;
                        const char *cn = close + 2;
                        while (*cn && *cn != '>' && *cn != ' ') cname += *cn++;
                        if (tolower_str(cname) == tag.name) {
                            tag.inner_text = std::string(p, close - p);
                            tag.outer_html = std::string(tag_start, (cn + (*cn == '>' ? 1 : 0)) - tag_start);
                            break;
                        }
                    }
                    close++;
                }
                if (tag.inner_text.empty() && tag.outer_html.empty()) {
                    tag.outer_html = std::string(tag_start, p - tag_start);
                }
                g_tags.push_back(tag);
            }
        } else {
            g_text += *p;
            p++;
        }
    }
}

//------------------------------------------------------------
// html_parse(html_str)  Parse HTML. Returns tag count.
//------------------------------------------------------------
EXPORT int __cdecl html_parse(const char *html)
{
    parse_html(html);
    return (int)g_tags.size();
}

//------------------------------------------------------------
// html_get_text(out, size)  Get all text content (tags stripped).
//------------------------------------------------------------
EXPORT int __cdecl html_get_text(char *out, int out_size)
{
    safe_copy(out, out_size, g_text);
    return (int)g_text.size();
}

//------------------------------------------------------------
// html_find_tag(tag_name)  Find all tags with given name. Returns count.
//------------------------------------------------------------
static std::vector<int> g_found;

EXPORT int __cdecl html_find_tag(const char *tag_name)
{
    g_found.clear();
    std::string name = tolower_str(tag_name);
    for (int i = 0; i < (int)g_tags.size(); i++) {
        if (g_tags[i].name == name) g_found.push_back(i);
    }
    return (int)g_found.size();
}

//------------------------------------------------------------
// html_tag_text(found_index, out, size)  Get inner text of found tag.
//------------------------------------------------------------
EXPORT int __cdecl html_tag_text(int found_idx, char *out, int out_size)
{
    if (found_idx < 0 || found_idx >= (int)g_found.size()) {
        if (out && out_size > 0) out[0] = '\0';
        return 0;
    }
    safe_copy(out, out_size, g_tags[g_found[found_idx]].inner_text);
    return 1;
}

//------------------------------------------------------------
// html_tag_attr(found_index, attr_name, out, size)  Get attribute value.
//------------------------------------------------------------
EXPORT int __cdecl html_tag_attr(int found_idx, const char *attr_name, char *out, int out_size)
{
    if (found_idx < 0 || found_idx >= (int)g_found.size()) {
        if (out && out_size > 0) out[0] = '\0';
        return 0;
    }
    std::string aname = tolower_str(attr_name);
    for (auto &a : g_tags[g_found[found_idx]].attrs) {
        if (a.first == aname) {
            safe_copy(out, out_size, a.second);
            return 1;
        }
    }
    if (out && out_size > 0) out[0] = '\0';
    return 0;
}

//------------------------------------------------------------
// html_tag_html(found_index, out, size)  Get outer HTML of tag.
//------------------------------------------------------------
EXPORT int __cdecl html_tag_html(int found_idx, char *out, int out_size)
{
    if (found_idx < 0 || found_idx >= (int)g_found.size()) {
        if (out && out_size > 0) out[0] = '\0';
        return 0;
    }
    safe_copy(out, out_size, g_tags[g_found[found_idx]].outer_html);
    return 1;
}

BOOL WINAPI DllMain(HINSTANCE hinst, DWORD reason, LPVOID reserved)
{
    if (reason == DLL_PROCESS_DETACH) { g_tags.clear(); g_found.clear(); }
    return TRUE;
}
