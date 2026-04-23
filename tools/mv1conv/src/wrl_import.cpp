#include "wrl_import.hpp"
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <filesystem>
#include <string>
#include <vector>

namespace mv1conv {

namespace {

// 文字列中の pos 以降から最初に pat が出現する位置を返す (見つからない = npos)
std::size_t find_after(const std::string &s, std::size_t pos, const std::string &pat) {
    return s.find(pat, pos);
}

// `[` のあとから `]` までの中身を数値配列として読む
std::vector<double> read_bracket_numbers(const std::string &s, std::size_t &pos) {
    std::vector<double> out;
    // open '[' まで進める
    while (pos < s.size() && s[pos] != '[') ++pos;
    if (pos >= s.size()) return out;
    ++pos;

    while (pos < s.size() && s[pos] != ']') {
        // ws / separator スキップ
        while (pos < s.size() && (s[pos] == ' ' || s[pos] == '\t' || s[pos] == '\n' ||
                                   s[pos] == '\r' || s[pos] == ',')) ++pos;
        if (pos >= s.size() || s[pos] == ']') break;
        char *endp = nullptr;
        double v = std::strtod(s.data() + pos, &endp);
        if (endp == s.data() + pos) {
            // 数値じゃなかったらスキップ (念のため識別子読み飛ばし)
            while (pos < s.size() && s[pos] != ' ' && s[pos] != '\t' && s[pos] != '\n' &&
                   s[pos] != ',' && s[pos] != ']') ++pos;
            continue;
        }
        out.push_back(v);
        pos = endp - s.data();
    }
    if (pos < s.size()) ++pos;  // skip ']'
    return out;
}

}

LoadResult load_wrl(const std::string &path) {
    LoadResult r;
    std::FILE *fp = std::fopen(path.c_str(), "rb");
    if (!fp) { r.error = "cannot open: " + path; return r; }
    std::error_code ec;
    auto sz = std::filesystem::file_size(path, ec);
    if (ec) { r.error = "file_size: " + ec.message(); std::fclose(fp); return r; }
    std::string s(sz, '\0');
    if (std::fread(s.data(), 1, sz, fp) != sz) { r.error = "short read"; std::fclose(fp); return r; }
    std::fclose(fp);

    // ヘッダチェック (VRML V2.0 / V2.0 utf8 のみ、V1.0 や X3D は非対応)
    if (s.size() < 10 || s.substr(0, 7) != "#VRML V") {
        r.error = "not a VRML file (missing '#VRML V' header); X3D (.x3d / .x3dv) も非対応";
        return r;
    }
    // V1.0 は Separator ベースで互換性ないので明示拒否
    if (s.size() >= 10 && (s[7] == '1') && (s[8] == '.')) {
        r.error = "VRML V1.0 is not supported (built-in loader は V2.0 のみ対応). "
                  "View3DScene 等で V2.0 / OBJ / STL に変換してから再試行してください.";
        return r;
    }
    if (s.size() >= 10 && !(s[7] == '2' && s[8] == '.')) {
        r.error = std::string("unsupported VRML version: ") + s.substr(7, 4)
                + " (V2.0 のみ対応)";
        return r;
    }

    // コメント除去 (# から行末まで、ただし先頭行の #VRML は既読、`# ... \n` 形式)
    // 簡単のため2行目以降の `#` をスペースで置換
    std::size_t first_nl = s.find('\n');
    if (first_nl == std::string::npos) first_nl = 0;
    for (std::size_t i = first_nl + 1; i < s.size(); ++i) {
        if (s[i] == '#') {
            while (i < s.size() && s[i] != '\n') { s[i] = ' '; ++i; }
        }
    }

    MeshIR mesh;
    mesh.name = "wrl";

    // 各 IndexedFaceSet を順に処理
    std::size_t pos = 0;
    int nSets = 0;
    while (true) {
        auto ifs = find_after(s, pos, "IndexedFaceSet");
        if (ifs == std::string::npos) break;
        pos = ifs + std::string("IndexedFaceSet").size();

        // この IFS 内から coord → Coordinate → point を見つける
        // IFS のスコープを仮に 2000 文字以内と仮定するのは危険なので、
        // 次の IndexedFaceSet まで、または EOF まで探す
        auto next_ifs = find_after(s, pos, "IndexedFaceSet");
        std::size_t scope_end = (next_ifs == std::string::npos) ? s.size() : next_ifs;

        // 頂点
        std::uint32_t vBase = static_cast<std::uint32_t>(mesh.positions.size() / 3);
        auto coord_pos = find_after(s, pos, "point");
        if (coord_pos != std::string::npos && coord_pos < scope_end) {
            std::size_t p2 = coord_pos + 5;
            auto pts = read_bracket_numbers(s, p2);
            for (double v : pts) mesh.positions.push_back(static_cast<float>(v));
        }

        // インデックス (VRML は -1 終端の poly、fan 三角化)
        auto ci_pos = find_after(s, pos, "coordIndex");
        if (ci_pos != std::string::npos && ci_pos < scope_end) {
            std::size_t p3 = ci_pos + std::string("coordIndex").size();
            auto idx = read_bracket_numbers(s, p3);
            std::vector<std::uint32_t> poly;
            for (double v : idx) {
                int iv = static_cast<int>(v);
                if (iv < 0) {
                    for (std::size_t k = 1; k + 1 < poly.size(); ++k) {
                        mesh.indices.push_back(vBase + poly[0]);
                        mesh.indices.push_back(vBase + poly[k]);
                        mesh.indices.push_back(vBase + poly[k+1]);
                    }
                    poly.clear();
                } else {
                    poly.push_back(static_cast<std::uint32_t>(iv));
                }
            }
            // 末尾 -1 がなくても処理
            for (std::size_t k = 1; k + 1 < poly.size(); ++k) {
                mesh.indices.push_back(vBase + poly[0]);
                mesh.indices.push_back(vBase + poly[k]);
                mesh.indices.push_back(vBase + poly[k+1]);
            }
        }
        pos = scope_end;
        ++nSets;
    }

    if (mesh.positions.empty() || mesh.indices.empty()) {
        r.error = "VRML: no IndexedFaceSet with point/coordIndex found";
        return r;
    }

    (void)nSets;
    r.ir.meshes.push_back(std::move(mesh));
    MaterialIR m; m.name = "default";
    r.ir.materials.push_back(m);
    return r;
}

}
