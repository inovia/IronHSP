#include "x_import.hpp"
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <filesystem>
#include <string>
#include <vector>

namespace mv1conv {

namespace {

// 簡易トークナイザ: 数値 / 識別子 / { } ; , を返す
struct Tokenizer {
    const char *p;
    const char *pEnd;

    void skip_ws() {
        while (p < pEnd) {
            while (p < pEnd && (*p == ' ' || *p == '\t' || *p == '\r' || *p == '\n')) ++p;
            if (p + 1 < pEnd && p[0] == '/' && p[1] == '/') {
                while (p < pEnd && *p != '\n') ++p;
                continue;
            }
            if (p + 1 < pEnd && p[0] == '#') {
                while (p < pEnd && *p != '\n') ++p;
                continue;
            }
            break;
        }
    }

    bool eof() { skip_ws(); return p >= pEnd; }

    std::string next_ident() {
        skip_ws();
        const char *s = p;
        while (p < pEnd && (std::isalnum((unsigned char)*p) || *p == '_')) ++p;
        return std::string(s, p - s);
    }
    bool peek_char(char c) {
        skip_ws();
        return p < pEnd && *p == c;
    }
    bool consume_char(char c) {
        if (peek_char(c)) { ++p; return true; }
        return false;
    }

    // "name" identifier の場合もスキップ (Frame Foo { ... } の Foo 部分など)
    void skip_braced_body() {
        int depth = 1;
        while (p < pEnd && depth > 0) {
            if (p + 1 < pEnd && p[0] == '/' && p[1] == '/') {
                while (p < pEnd && *p != '\n') ++p;
                continue;
            }
            if (*p == '{') ++depth;
            else if (*p == '}') --depth;
            ++p;
        }
    }

    // 数値の前後にある `;` `,` (X フォーマット区切り) を全て食う
    void eat_leading_seps() {
        while (true) {
            skip_ws();
            if (p < pEnd && (*p == ';' || *p == ',')) ++p;
            else break;
        }
    }
    double next_number() {
        eat_leading_seps();
        char *endp = nullptr;
        double v = std::strtod(p, &endp);
        p = endp;
        return v;
    }
    long next_int() {
        eat_leading_seps();
        char *endp = nullptr;
        long v = std::strtol(p, &endp, 10);
        p = endp;
        return v;
    }
    // 内側の「;;」処理。数値列の末尾「; ,」「; ;」を吸う
    void eat_separators() {
        skip_ws();
        while (p < pEnd && (*p == ';' || *p == ',')) { ++p; skip_ws(); }
    }
};

struct MeshData {
    std::vector<float> positions;  // 3n
    std::vector<float> normals;    // 3n (normal-indices で pos に並び替え済)
    std::vector<float> uvs;        // 2n
    std::vector<std::uint32_t> indices;  // triangles
    std::vector<int> faceMat;      // 各 tri のマテリアル index (なければ 0)
    bool has_uv = false;
    bool has_normal = false;
};

}

LoadResult load_x(const std::string &path) {
    LoadResult r;
    std::FILE *fp = std::fopen(path.c_str(), "rb");
    if (!fp) { r.error = "cannot open: " + path; return r; }
    std::error_code ec;
    auto sz = std::filesystem::file_size(path, ec);
    if (ec) { r.error = "file_size: " + ec.message(); std::fclose(fp); return r; }
    std::vector<char> all(sz);
    if (std::fread(all.data(), 1, all.size(), fp) != all.size()) {
        r.error = "short read"; std::fclose(fp); return r;
    }
    std::fclose(fp);

    // X ヘッダ "xof 0303txt 0032" など
    if (all.size() < 16 || std::memcmp(all.data(), "xof ", 4) != 0) {
        r.error = "not a DirectX .x file (missing 'xof ' magic)";
        return r;
    }
    if (std::memcmp(all.data() + 8, "txt", 3) != 0) {
        std::string mode(all.data() + 8, 3);  // "bin" / "tzi" (MSZIP) / "bzi" (MSZIP binary)
        r.error = "built-in .x loader only supports ASCII ('txt'); this file is '"
                  + mode + "'. Rebuild with MV1CONV_USE_ASSIMP=ON (default) and "
                    "run without MV1CONV_X_USE_BUILTIN=1 to use assimp's .x parser "
                    "(handles binary/MSZIP/compressed).";
        return r;
    }

    Tokenizer t;
    t.p    = all.data() + 16;
    t.pEnd = all.data() + all.size();

    MeshData md;
    std::vector<MaterialIR> mats;

    // トップレベルをスキャンし、Mesh / Frame を見つけて再帰
    auto parse_mesh_body = [&]() {
        // vertex count
        long vn = t.next_int();
        md.positions.reserve(vn * 3);
        for (long i = 0; i < vn; ++i) {
            float x = (float)t.next_number();
            float y = (float)t.next_number();
            float z = (float)t.next_number();
            md.positions.push_back(x);
            md.positions.push_back(y);
            md.positions.push_back(z);
        }
        t.eat_separators();

        // face count
        long fn = t.next_int();
        for (long i = 0; i < fn; ++i) {
            long cnt = t.next_int();
            std::vector<long> idx(cnt);
            for (long k = 0; k < cnt; ++k) idx[k] = t.next_int();
            // fan triangulation
            for (long k = 1; k + 1 < cnt; ++k) {
                md.indices.push_back(static_cast<std::uint32_t>(idx[0]));
                md.indices.push_back(static_cast<std::uint32_t>(idx[k]));
                md.indices.push_back(static_cast<std::uint32_t>(idx[k+1]));
            }
        }
        t.eat_separators();

        // 子ブロック (MeshNormals / MeshTextureCoords / MeshMaterialList)
        while (!t.eof() && !t.peek_char('}')) {
            std::string name = t.next_ident();
            if (name.empty()) {
                if (!t.eof()) ++t.p;  // skip unknown char
                continue;
            }
            // 修飾子の「"" の中」があるかも
            std::string afterName = t.next_ident();
            (void)afterName;
            if (!t.consume_char('{')) continue;

            if (name == "MeshNormals") {
                long nn = t.next_int();
                std::vector<float> N(nn * 3);
                for (long i = 0; i < nn; ++i) {
                    N[i*3+0] = (float)t.next_number();
                    N[i*3+1] = (float)t.next_number();
                    N[i*3+2] = (float)t.next_number();
                }
                t.eat_separators();
                long fnn = t.next_int();
                // 各 face の normal index (face count分)
                // 簡略化: pos index で normal を引き直す。完璧ではないが OK
                std::vector<std::uint32_t> nIdxPerVert(md.positions.size() / 3, 0);
                long srcTri = 0;
                for (long i = 0; i < fnn; ++i) {
                    long cnt = t.next_int();
                    std::vector<long> idx(cnt);
                    for (long k = 0; k < cnt; ++k) idx[k] = t.next_int();
                    // 対応する face vertex の pos index を逆引きしたいが、
                    // md.indices はすでに三角化済。簡易: normal 配列と pos 配列の
                    // 数が等しい場合は 1:1 対応と仮定する (DxLib .x の多数派)
                    (void)srcTri; (void)nIdxPerVert;
                }
                t.eat_separators();
                if (!t.consume_char('}')) t.skip_braced_body();
                if (N.size() == md.positions.size()) {
                    md.normals = std::move(N);
                    md.has_normal = true;
                }
            } else if (name == "MeshTextureCoords") {
                long nn = t.next_int();
                if (static_cast<std::size_t>(nn * 3) == md.positions.size()) {
                    md.uvs.resize(nn * 2);
                    for (long i = 0; i < nn; ++i) {
                        md.uvs[i*2+0] = (float)t.next_number();
                        md.uvs[i*2+1] = (float)t.next_number();
                    }
                    md.has_uv = true;
                } else {
                    for (long i = 0; i < nn; ++i) { t.next_number(); t.next_number(); }
                }
                t.eat_separators();
                if (!t.consume_char('}')) t.skip_braced_body();
            } else if (name == "MeshMaterialList") {
                long matCount = t.next_int();
                long faceMatCount = t.next_int();
                md.faceMat.resize(faceMatCount, 0);
                for (long i = 0; i < faceMatCount; ++i) md.faceMat[i] = static_cast<int>(t.next_int());
                // 中の Material { ... } ブロックを読む
                for (long i = 0; i < matCount; ++i) {
                    if (t.eof()) break;
                    std::string n = t.next_ident();
                    if (n == "Material") {
                        std::string matName = t.next_ident();
                        if (!t.consume_char('{')) break;
                        MaterialIR m;
                        m.name = matName.empty() ? ("mat" + std::to_string(mats.size())) : matName;
                        // diffuse RGBA
                        m.diffuse[0] = (float)t.next_number();
                        m.diffuse[1] = (float)t.next_number();
                        m.diffuse[2] = (float)t.next_number();
                        m.diffuse[3] = (float)t.next_number();
                        m.power = (float)t.next_number();
                        m.specular[0] = (float)t.next_number();
                        m.specular[1] = (float)t.next_number();
                        m.specular[2] = (float)t.next_number();
                        m.emissive[0] = (float)t.next_number();
                        m.emissive[1] = (float)t.next_number();
                        m.emissive[2] = (float)t.next_number();
                        t.eat_separators();
                        // 内側にも TextureFilename などがあり得る。残りを skip
                        t.skip_braced_body();
                        mats.push_back(m);
                    } else {
                        // 不明な識別子: 括弧ブロックをスキップ
                        if (t.consume_char('{')) t.skip_braced_body();
                    }
                }
                // MeshMaterialList 閉じ }
                if (!t.consume_char('}')) t.skip_braced_body();
            } else {
                // 不明な子ブロック
                t.skip_braced_body();
            }
        }
        t.consume_char('}');
    };

    // トップレベルスキャン
    bool mesh_found = false;
    while (!t.eof()) {
        std::string name = t.next_ident();
        if (name.empty()) {
            if (!t.eof()) ++t.p;
            continue;
        }
        std::string optName = t.next_ident();  // 任意の識別子
        (void)optName;
        if (!t.consume_char('{')) {
            // 識別子のみ (template 宣言等、セミコロンで終わる場合あり)
            while (!t.eof() && *t.p != ';' && *t.p != '{') ++t.p;
            if (t.peek_char('{')) {
                t.consume_char('{');
                t.skip_braced_body();
            } else if (!t.eof()) {
                ++t.p;  // skip ;
            }
            continue;
        }
        if (name == "Mesh") {
            if (mesh_found) { t.skip_braced_body(); continue; }
            parse_mesh_body();
            mesh_found = true;
        } else if (name == "Frame") {
            // 再帰は省略、body 内を再度トップレベルと同じ方法で走査
            // 簡易化: 中身に Mesh が出たら引き当てる
            int depth = 1;
            while (depth > 0 && !t.eof()) {
                std::string inner = t.next_ident();
                if (inner.empty()) {
                    if (t.peek_char('}')) { t.consume_char('}'); --depth; }
                    else if (!t.eof()) ++t.p;
                    continue;
                }
                std::string optIn = t.next_ident();
                (void)optIn;
                if (t.consume_char('{')) {
                    if (inner == "Mesh" && !mesh_found) {
                        parse_mesh_body();
                        mesh_found = true;
                    } else if (inner == "Frame") {
                        ++depth;
                    } else {
                        t.skip_braced_body();
                    }
                } else {
                    while (!t.eof() && *t.p != ';' && *t.p != '{' && *t.p != '}') ++t.p;
                    if (t.peek_char('{')) { t.consume_char('{'); t.skip_braced_body(); }
                    else if (t.peek_char('}')) { t.consume_char('}'); --depth; }
                    else if (!t.eof()) ++t.p;
                }
            }
        } else {
            t.skip_braced_body();
        }
    }

    if (md.positions.empty() || md.indices.empty()) {
        r.error = "X: no Mesh block with vertices/faces found";
        return r;
    }

    MeshIR mesh;
    mesh.name = "x_mesh";
    mesh.positions = std::move(md.positions);
    mesh.normals   = std::move(md.normals);
    mesh.uvs       = std::move(md.uvs);
    mesh.indices   = std::move(md.indices);
    mesh.material  = 0;

    r.ir.meshes.push_back(std::move(mesh));
    if (mats.empty()) {
        MaterialIR m; m.name = "default";
        r.ir.materials.push_back(m);
    } else {
        r.ir.materials = std::move(mats);
    }
    return r;
}

}
