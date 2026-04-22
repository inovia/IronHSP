#include "mini_json.hpp"
#include <cstdlib>
#include <cstring>

namespace mv1conv::json {

namespace {

struct Parser {
    const char *p;
    const char *pEnd;
    std::string err;

    void skip_ws() {
        while (p < pEnd) {
            char c = *p;
            if (c == ' ' || c == '\t' || c == '\r' || c == '\n') { ++p; continue; }
            break;
        }
    }

    bool eof() const { return p >= pEnd; }

    bool consume(char c) {
        skip_ws();
        if (!eof() && *p == c) { ++p; return true; }
        return false;
    }
    bool consume_lit(const char *lit) {
        skip_ws();
        std::size_t n = std::strlen(lit);
        if (p + n > pEnd) return false;
        if (std::memcmp(p, lit, n) != 0) return false;
        p += n;
        return true;
    }

    bool parse_string(std::string &out) {
        if (!consume('"')) { err = "expected '\"'"; return false; }
        out.clear();
        while (!eof() && *p != '"') {
            char c = *p++;
            if (c == '\\' && !eof()) {
                char e = *p++;
                switch (e) {
                case '"': out.push_back('"'); break;
                case '\\': out.push_back('\\'); break;
                case '/': out.push_back('/'); break;
                case 'b': out.push_back('\b'); break;
                case 'f': out.push_back('\f'); break;
                case 'n': out.push_back('\n'); break;
                case 'r': out.push_back('\r'); break;
                case 't': out.push_back('\t'); break;
                case 'u': {
                    if (p + 4 > pEnd) { err = "bad \\u"; return false; }
                    char hex[5] = {p[0], p[1], p[2], p[3], 0};
                    p += 4;
                    unsigned cp = static_cast<unsigned>(std::strtoul(hex, nullptr, 16));
                    // UTF-8 エンコード (BMP のみ、サロゲートペアは単一コードポイントに近似)
                    if (cp < 0x80) out.push_back(static_cast<char>(cp));
                    else if (cp < 0x800) {
                        out.push_back(static_cast<char>(0xC0 | (cp >> 6)));
                        out.push_back(static_cast<char>(0x80 | (cp & 0x3F)));
                    } else {
                        out.push_back(static_cast<char>(0xE0 | (cp >> 12)));
                        out.push_back(static_cast<char>(0x80 | ((cp >> 6) & 0x3F)));
                        out.push_back(static_cast<char>(0x80 | (cp & 0x3F)));
                    }
                    break;
                }
                default: out.push_back(e); break;
                }
            } else {
                out.push_back(c);
            }
        }
        if (eof()) { err = "unterminated string"; return false; }
        ++p;  // skip closing "
        return true;
    }

    Value parse_value() {
        skip_ws();
        if (eof()) { err = "unexpected EOF"; return {}; }
        char c = *p;
        if (c == '{') return parse_object();
        if (c == '[') return parse_array();
        if (c == '"') {
            std::string s;
            if (!parse_string(s)) return {};
            return Value(std::move(s));
        }
        if (c == 't') { if (consume_lit("true")) return Value(true); err = "bad literal"; return {}; }
        if (c == 'f') { if (consume_lit("false")) return Value(false); err = "bad literal"; return {}; }
        if (c == 'n') { if (consume_lit("null")) return Value(); err = "bad literal"; return {}; }
        // number
        char *endp = nullptr;
        double v = std::strtod(p, &endp);
        if (endp == p) { err = "expected value"; return {}; }
        p = endp;
        return Value(v);
    }

    Value parse_array() {
        if (!consume('[')) { err = "expected '['"; return {}; }
        Array arr;
        skip_ws();
        if (consume(']')) return Value(std::move(arr));
        while (true) {
            Value v = parse_value();
            if (!err.empty()) return {};
            arr.push_back(std::move(v));
            skip_ws();
            if (consume(',')) continue;
            if (consume(']')) break;
            err = "expected ',' or ']'";
            return {};
        }
        return Value(std::move(arr));
    }

    Value parse_object() {
        if (!consume('{')) { err = "expected '{'"; return {}; }
        Object obj;
        skip_ws();
        if (consume('}')) return Value(std::move(obj));
        while (true) {
            std::string key;
            if (!parse_string(key)) return {};
            if (!consume(':')) { err = "expected ':'"; return {}; }
            Value v = parse_value();
            if (!err.empty()) return {};
            obj[std::move(key)] = std::move(v);
            skip_ws();
            if (consume(',')) continue;
            if (consume('}')) break;
            err = "expected ',' or '}'";
            return {};
        }
        return Value(std::move(obj));
    }
};

}

Value parse(const char *src, std::size_t len, std::string &err) {
    Parser ps{src, src + len, {}};
    Value v = ps.parse_value();
    if (!ps.err.empty()) { err = ps.err; return {}; }
    return v;
}

}
