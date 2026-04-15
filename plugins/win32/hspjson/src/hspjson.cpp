//============================================================
//   hspjson.dll — JSON read/write plugin for IronHSP
//
//   Self-contained minimal JSON parser + writer + HSP plugin wrapper.
//   No third-party dependencies. MIT-style license (this file).
//
//   HSP API:
//     json_parse "{...}"             ; parse → handle, refstr=エラー文 (success="")
//     json_free hid
//     json_clear                     ; 全ハンドル開放
//     json_get_str   hid, "path"     ; → refstr (string value)
//     json_get_int   hid, "path"     ; → stat
//     json_get_dbl   hid, "path"     ; → refdval
//     json_get_bool  hid, "path"     ; → stat (1/0)
//     json_count     hid, "path"     ; → stat (array length / object key count)
//     json_type      hid, "path"     ; → stat (0=null 1=bool 2=num 3=str 4=arr 5=obj)
//     json_keys      hid, "path", out_array  ; list keys (object only)
//     json_create_object             ; → handle (空オブジェクト)
//     json_create_array              ; → handle
//     json_set_str   hid, "path", "val"
//     json_set_int   hid, "path", val
//     json_set_dbl   hid, "path", val
//     json_set_bool  hid, "path", val
//     json_set_null  hid, "path"
//     json_array_add hid, "path", value     ; (str/int/dbl 多態)
//     json_stringify hid                    ; → refstr
//     json_stringify_pretty hid             ; → refstr (整形あり)
//
//   path syntax (JSONPath-lite):
//     "name"               → ルートオブジェクトのキー
//     "user.name"          → ネストキー
//     "items[0]"           → 配列要素
//     "items[2].name"      → ネスト
//     ""                   → ルート自身
//============================================================

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <string>
#include <vector>
#include <map>
#include <memory>
#include <cstring>
#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <cstdint>

// 新形式 (typed #func) 移行済。HSPEXINFO / HspFunc_prm_* 非依存。
#define HSPJSON_EXPORT extern "C" __declspec(dllexport)

// 文字列を HSP 側バッファへ null 終端付きで安全コピー
static void copy_to_buf(const std::string& src, char* out, int out_size)
{
    if (!out || out_size <= 0) return;
    int n = (int)src.size();
    if (n >= out_size) n = out_size - 1;
    if (n > 0) memcpy(out, src.data(), (size_t)n);
    out[n] = 0;
}
static void copy_to_buf(const char* src, char* out, int out_size)
{
    if (!out || out_size <= 0) return;
    if (!src) src = "";
    int n = (int)strlen(src);
    if (n >= out_size) n = out_size - 1;
    if (n > 0) memcpy(out, src, (size_t)n);
    out[n] = 0;
}

// ============================================================
// JSON value tree
// ============================================================

enum JType {
    JT_NULL = 0,
    JT_BOOL = 1,
    JT_NUM  = 2,
    JT_STR  = 3,
    JT_ARR  = 4,
    JT_OBJ  = 5,
};

struct JNode {
    JType type = JT_NULL;
    double num = 0.0;
    std::string str;
    bool b = false;
    std::vector<std::unique_ptr<JNode>> children;
    std::vector<std::string> keys;       // for OBJ, parallel to children

    JNode() = default;
    JNode(JType t) : type(t) {}
};

// ============================================================
// JSON parser (recursive descent)
// ============================================================

class JParser {
public:
    JParser(const char* src) : src_(src), pos_(0) {}

    std::unique_ptr<JNode> parse_value(std::string& err) {
        skip_ws();
        if (pos_ >= len()) { err = "unexpected end"; return nullptr; }
        char c = src_[pos_];
        if (c == '{') return parse_object(err);
        if (c == '[') return parse_array(err);
        if (c == '"') return parse_string(err);
        if (c == 't' || c == 'f') return parse_bool(err);
        if (c == 'n') return parse_null(err);
        if (c == '-' || (c >= '0' && c <= '9')) return parse_number(err);
        err = std::string("unexpected character at ") + std::to_string(pos_);
        return nullptr;
    }

    bool finished() {
        skip_ws();
        return pos_ >= len();
    }

private:
    size_t len() const { return strlen(src_); }
    void skip_ws() {
        while (pos_ < len()) {
            char c = src_[pos_];
            if (c == ' ' || c == '\t' || c == '\r' || c == '\n') pos_++;
            else break;
        }
    }
    bool match(char c) {
        skip_ws();
        if (pos_ < len() && src_[pos_] == c) { pos_++; return true; }
        return false;
    }
    bool peek(char c) {
        skip_ws();
        return pos_ < len() && src_[pos_] == c;
    }
    bool match_word(const char* w) {
        size_t n = strlen(w);
        if (pos_ + n > len()) return false;
        if (memcmp(src_ + pos_, w, n) != 0) return false;
        pos_ += n;
        return true;
    }

    std::unique_ptr<JNode> parse_object(std::string& err) {
        if (!match('{')) { err = "expected {"; return nullptr; }
        auto node = std::unique_ptr<JNode>(new JNode(JT_OBJ));
        skip_ws();
        if (peek('}')) { pos_++; return node; }
        for (;;) {
            skip_ws();
            if (!peek('"')) { err = "expected string key"; return nullptr; }
            auto key_node = parse_string(err);
            if (!key_node) return nullptr;
            std::string key = key_node->str;
            if (!match(':')) { err = "expected ':'"; return nullptr; }
            auto val = parse_value(err);
            if (!val) return nullptr;
            node->keys.push_back(key);
            node->children.push_back(std::move(val));
            skip_ws();
            if (match(',')) continue;
            if (match('}')) break;
            err = "expected , or }";
            return nullptr;
        }
        return node;
    }

    std::unique_ptr<JNode> parse_array(std::string& err) {
        if (!match('[')) { err = "expected ["; return nullptr; }
        auto node = std::unique_ptr<JNode>(new JNode(JT_ARR));
        skip_ws();
        if (peek(']')) { pos_++; return node; }
        for (;;) {
            auto val = parse_value(err);
            if (!val) return nullptr;
            node->children.push_back(std::move(val));
            skip_ws();
            if (match(',')) continue;
            if (match(']')) break;
            err = "expected , or ]";
            return nullptr;
        }
        return node;
    }

    std::unique_ptr<JNode> parse_string(std::string& err) {
        if (src_[pos_] != '"') { err = "expected \""; return nullptr; }
        pos_++;
        std::string out;
        while (pos_ < len()) {
            char c = src_[pos_++];
            if (c == '"') {
                auto node = std::unique_ptr<JNode>(new JNode(JT_STR));
                node->str = out;
                return node;
            }
            if (c == '\\' && pos_ < len()) {
                char esc = src_[pos_++];
                switch (esc) {
                    case '"':  out.push_back('"'); break;
                    case '\\': out.push_back('\\'); break;
                    case '/':  out.push_back('/'); break;
                    case 'b':  out.push_back('\b'); break;
                    case 'f':  out.push_back('\f'); break;
                    case 'n':  out.push_back('\n'); break;
                    case 'r':  out.push_back('\r'); break;
                    case 't':  out.push_back('\t'); break;
                    case 'u': {
                        if (pos_ + 4 > len()) { err = "bad \\u"; return nullptr; }
                        unsigned int code = 0;
                        for (int i = 0; i < 4; ++i) {
                            char h = src_[pos_++];
                            code <<= 4;
                            if (h >= '0' && h <= '9') code |= h - '0';
                            else if (h >= 'a' && h <= 'f') code |= h - 'a' + 10;
                            else if (h >= 'A' && h <= 'F') code |= h - 'A' + 10;
                            else { err = "bad \\u digit"; return nullptr; }
                        }
                        // Encode as UTF-8 (will be displayed as raw bytes in SJIS HSP).
                        // For ASCII range it's fine; for non-ASCII the user can convert later.
                        if (code < 0x80) {
                            out.push_back(char(code));
                        } else if (code < 0x800) {
                            out.push_back(char(0xC0 | (code >> 6)));
                            out.push_back(char(0x80 | (code & 0x3F)));
                        } else {
                            out.push_back(char(0xE0 | (code >> 12)));
                            out.push_back(char(0x80 | ((code >> 6) & 0x3F)));
                            out.push_back(char(0x80 | (code & 0x3F)));
                        }
                        break;
                    }
                    default:
                        out.push_back(esc); break;
                }
            } else {
                out.push_back(c);
            }
        }
        err = "unterminated string";
        return nullptr;
    }

    std::unique_ptr<JNode> parse_number(std::string& err) {
        size_t start = pos_;
        if (src_[pos_] == '-') pos_++;
        while (pos_ < len() && src_[pos_] >= '0' && src_[pos_] <= '9') pos_++;
        if (pos_ < len() && src_[pos_] == '.') {
            pos_++;
            while (pos_ < len() && src_[pos_] >= '0' && src_[pos_] <= '9') pos_++;
        }
        if (pos_ < len() && (src_[pos_] == 'e' || src_[pos_] == 'E')) {
            pos_++;
            if (pos_ < len() && (src_[pos_] == '+' || src_[pos_] == '-')) pos_++;
            while (pos_ < len() && src_[pos_] >= '0' && src_[pos_] <= '9') pos_++;
        }
        if (pos_ == start) { err = "expected number"; return nullptr; }
        std::string s(src_ + start, pos_ - start);
        auto node = std::unique_ptr<JNode>(new JNode(JT_NUM));
        node->num = std::atof(s.c_str());
        return node;
    }

    std::unique_ptr<JNode> parse_bool(std::string& err) {
        if (match_word("true")) {
            auto node = std::unique_ptr<JNode>(new JNode(JT_BOOL));
            node->b = true;
            return node;
        }
        if (match_word("false")) {
            auto node = std::unique_ptr<JNode>(new JNode(JT_BOOL));
            node->b = false;
            return node;
        }
        err = "expected true/false";
        return nullptr;
    }

    std::unique_ptr<JNode> parse_null(std::string& err) {
        if (match_word("null")) {
            return std::unique_ptr<JNode>(new JNode(JT_NULL));
        }
        err = "expected null";
        return nullptr;
    }

    const char* src_;
    size_t pos_;
};

// ============================================================
// Path resolver (JSONPath-lite)
//   "name"            → root[name]
//   "obj.name"        → root[obj][name]
//   "items[0]"        → root[items][0]
//   "items[2].name"   → root[items][2][name]
// ============================================================

static JNode* resolve_path(JNode* root, const char* path)
{
    if (!root || !path || !*path) return root;
    JNode* cur = root;
    const char* p = path;
    while (*p) {
        if (*p == '.') { p++; continue; }
        if (*p == '[') {
            // array index
            p++;
            int idx = 0;
            while (*p >= '0' && *p <= '9') { idx = idx * 10 + (*p - '0'); p++; }
            if (*p != ']') return nullptr;
            p++;
            if (cur->type != JT_ARR) return nullptr;
            if (idx < 0 || idx >= (int)cur->children.size()) return nullptr;
            cur = cur->children[idx].get();
            continue;
        }
        // identifier
        std::string key;
        while (*p && *p != '.' && *p != '[') { key.push_back(*p++); }
        if (cur->type != JT_OBJ) return nullptr;
        bool found = false;
        for (size_t i = 0; i < cur->keys.size(); ++i) {
            if (cur->keys[i] == key) {
                cur = cur->children[i].get();
                found = true;
                break;
            }
        }
        if (!found) return nullptr;
    }
    return cur;
}

// ============================================================
// Stringifier
// ============================================================

static void stringify_node(const JNode* n, std::string& out, bool pretty, int indent)
{
    auto pad = [&](int level) {
        if (pretty) for (int i = 0; i < level; ++i) out += "  ";
    };
    auto nl = [&]() { if (pretty) out += "\n"; };
    if (!n) { out += "null"; return; }
    switch (n->type) {
        case JT_NULL: out += "null"; return;
        case JT_BOOL: out += n->b ? "true" : "false"; return;
        case JT_NUM: {
            char buf[64];
            // Integer-friendly format
            if (n->num == (double)(long long)n->num) {
                snprintf(buf, sizeof(buf), "%lld", (long long)n->num);
            } else {
                snprintf(buf, sizeof(buf), "%g", n->num);
            }
            out += buf;
            return;
        }
        case JT_STR: {
            out += '"';
            for (char c : n->str) {
                switch (c) {
                    case '"':  out += "\\\""; break;
                    case '\\': out += "\\\\"; break;
                    case '\b': out += "\\b"; break;
                    case '\f': out += "\\f"; break;
                    case '\n': out += "\\n"; break;
                    case '\r': out += "\\r"; break;
                    case '\t': out += "\\t"; break;
                    default:
                        if ((unsigned char)c < 0x20) {
                            char ub[8];
                            snprintf(ub, sizeof(ub), "\\u%04x", (unsigned char)c);
                            out += ub;
                        } else {
                            out += c;
                        }
                }
            }
            out += '"';
            return;
        }
        case JT_ARR: {
            out += '[';
            if (!n->children.empty()) nl();
            for (size_t i = 0; i < n->children.size(); ++i) {
                pad(indent + 1);
                stringify_node(n->children[i].get(), out, pretty, indent + 1);
                if (i + 1 < n->children.size()) out += ',';
                nl();
            }
            if (!n->children.empty()) pad(indent);
            out += ']';
            return;
        }
        case JT_OBJ: {
            out += '{';
            if (!n->children.empty()) nl();
            for (size_t i = 0; i < n->children.size(); ++i) {
                pad(indent + 1);
                out += '"';
                out += n->keys[i];
                out += pretty ? "\": " : "\":";
                stringify_node(n->children[i].get(), out, pretty, indent + 1);
                if (i + 1 < n->children.size()) out += ',';
                nl();
            }
            if (!n->children.empty()) pad(indent);
            out += '}';
            return;
        }
    }
}

// ============================================================
// Handle table
// ============================================================

namespace {

std::map<int, std::unique_ptr<JNode>> g_handles;
int g_next_id = 1;

int register_handle(std::unique_ptr<JNode> node) {
    int id = g_next_id++;
    g_handles[id] = std::move(node);
    return id;
}

JNode* get_handle(int id) {
    auto it = g_handles.find(id);
    if (it == g_handles.end()) return nullptr;
    return it->second.get();
}

void free_handle(int id) {
    g_handles.erase(id);
}

void clear_handles() {
    g_handles.clear();
    g_next_id = 1;
}

// HSP refstr 書き込みヘルパ。stmp バッファに書いて pval に Set する。
// hspcv4 の cv4_build_version を参考にしているが、ここでは simpler に
// HspFunc_string_set を使う想定 (HSP runtime にあるはず)。
//
// 実装が複雑なので、stat (戻り値) と HSP 側 PVal 経由で文字列を返す。
// 「json_get_str ハンドル, パス, var」の形にして第3引数に var を渡してもらう。

} // namespace

// ============================================================
// HSP exports (typed #func 形式)
//
//   旧: json_xxx(HSPEXINFO*, int, int, int) + HspFunc_prm_*
//   新: hspjson_xxx(typed C 引数) / int __stdcall
//
//   .as 側で HSP コマンド名 (json_xxx) と DLL 実体名 (hspjson_xxx) を分離。
// ============================================================

// json_parse "text", var_handle
HSPJSON_EXPORT int __stdcall hspjson_parse(const char* text, int* out_hid)
{
    if (out_hid) *out_hid = -1;
    if (!text) return -1;
    try {
        std::string err;
        JParser parser(text);
        auto root = parser.parse_value(err);
        if (!root) return -2;
        int id = register_handle(std::move(root));
        if (out_hid) *out_hid = id;
        return 0;
    } catch (...) {
        return -1;
    }
}

// json_free hid
HSPJSON_EXPORT int __stdcall hspjson_free(int hid)
{
    free_handle(hid);
    return 0;
}

// json_clear
HSPJSON_EXPORT int __stdcall hspjson_clear()
{
    clear_handles();
    return 0;
}

// json_get_str hid, "path", var_buf, buf_size
HSPJSON_EXPORT int __stdcall hspjson_get_str(int hid, const char* path,
                                             char* out_buf, int out_size)
{
    if (out_buf && out_size > 0) out_buf[0] = 0;
    JNode* root = get_handle(hid);
    if (!root) return -1;
    JNode* node = resolve_path(root, path);
    if (!node) return -2;
    if (node->type == JT_STR) {
        copy_to_buf(node->str, out_buf, out_size);
    } else if (node->type == JT_NUM) {
        char buf[64];
        if (node->num == (double)(long long)node->num) {
            snprintf(buf, sizeof(buf), "%lld", (long long)node->num);
        } else {
            snprintf(buf, sizeof(buf), "%g", node->num);
        }
        copy_to_buf(buf, out_buf, out_size);
    } else if (node->type == JT_BOOL) {
        copy_to_buf(node->b ? "true" : "false", out_buf, out_size);
    } else if (node->type == JT_NULL) {
        copy_to_buf("null", out_buf, out_size);
    }
    return 0;
}

// json_get_int hid, "path", var_int
HSPJSON_EXPORT int __stdcall hspjson_get_int(int hid, const char* path, int* out)
{
    if (out) *out = 0;
    JNode* root = get_handle(hid);
    if (!root) return -1;
    JNode* node = resolve_path(root, path);
    if (!node) return -2;
    int v = 0;
    if (node->type == JT_NUM) v = (int)node->num;
    else if (node->type == JT_BOOL) v = node->b ? 1 : 0;
    else if (node->type == JT_STR) v = std::atoi(node->str.c_str());
    if (out) *out = v;
    return 0;
}

// json_get_dbl hid, "path", var_double
HSPJSON_EXPORT int __stdcall hspjson_get_dbl(int hid, const char* path, double* out)
{
    if (out) *out = 0.0;
    JNode* root = get_handle(hid);
    if (!root) return -1;
    JNode* node = resolve_path(root, path);
    if (!node) return -2;
    double v = 0.0;
    if (node->type == JT_NUM) v = node->num;
    else if (node->type == JT_BOOL) v = node->b ? 1.0 : 0.0;
    else if (node->type == JT_STR) v = std::atof(node->str.c_str());
    if (out) *out = v;
    return 0;
}

// json_count hid, "path", var_int
HSPJSON_EXPORT int __stdcall hspjson_count(int hid, const char* path, int* out)
{
    if (out) *out = 0;
    JNode* root = get_handle(hid);
    if (!root) return -1;
    JNode* node = resolve_path(root, path);
    if (!node) return -2;
    int n = 0;
    if (node->type == JT_ARR || node->type == JT_OBJ) n = (int)node->children.size();
    if (out) *out = n;
    return 0;
}

// json_type hid, "path", var_int
HSPJSON_EXPORT int __stdcall hspjson_type(int hid, const char* path, int* out)
{
    if (out) *out = -1;
    JNode* root = get_handle(hid);
    if (!root) return -1;
    JNode* node = resolve_path(root, path);
    if (!node) return -2;
    if (out) *out = (int)node->type;
    return 0;
}

// json_stringify hid, var_buf, buf_size
HSPJSON_EXPORT int __stdcall hspjson_stringify(int hid, char* out_buf, int out_size)
{
    if (out_buf && out_size > 0) out_buf[0] = 0;
    JNode* root = get_handle(hid);
    if (!root) return -1;
    std::string out;
    stringify_node(root, out, false, 0);
    copy_to_buf(out, out_buf, out_size);
    return 0;
}

// json_stringify_pretty hid, var_buf, buf_size
HSPJSON_EXPORT int __stdcall hspjson_stringify_pretty(int hid, char* out_buf, int out_size)
{
    if (out_buf && out_size > 0) out_buf[0] = 0;
    JNode* root = get_handle(hid);
    if (!root) return -1;
    std::string out;
    stringify_node(root, out, true, 0);
    copy_to_buf(out, out_buf, out_size);
    return 0;
}
