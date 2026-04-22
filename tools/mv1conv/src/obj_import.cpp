#include "obj_import.hpp"
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <sstream>
#include <string>
#include <unordered_map>
#include <vector>

namespace mv1conv {

namespace {

struct FaceKey {
    int v, vt, vn;
    bool operator==(const FaceKey &o) const { return v == o.v && vt == o.vt && vn == o.vn; }
};

struct FaceKeyHash {
    std::size_t operator()(const FaceKey &k) const noexcept {
        return std::hash<long long>{}(
            (static_cast<long long>(k.v)  & 0xFFFFF)
          | ((static_cast<long long>(k.vt) & 0xFFFFF) << 20)
          | ((static_cast<long long>(k.vn) & 0xFFFFF) << 40));
    }
};

int parse_idx(const std::string &tok, int base) {
    if (tok.empty()) return -1;
    int v = std::atoi(tok.c_str());
    if (v < 0) return base + v;      // negative index: relative to end
    if (v == 0) return -1;
    return v - 1;                     // 1-based → 0-based
}

void parse_face_token(const std::string &tok, int &v, int &vt, int &vn) {
    v = vt = vn = -1;
    std::size_t p1 = tok.find('/');
    if (p1 == std::string::npos) {
        v = std::atoi(tok.c_str()) - 1;
        return;
    }
    std::string sv = tok.substr(0, p1);
    v = parse_idx(sv, 0);
    std::size_t p2 = tok.find('/', p1 + 1);
    if (p2 == std::string::npos) {
        std::string svt = tok.substr(p1 + 1);
        vt = parse_idx(svt, 0);
    } else {
        std::string svt = tok.substr(p1 + 1, p2 - p1 - 1);
        std::string svn = tok.substr(p2 + 1);
        vt = parse_idx(svt, 0);
        vn = parse_idx(svn, 0);
    }
}

}

ObjLoadResult load_obj(const std::string &path) {
    ObjLoadResult r;
    std::FILE *fp = std::fopen(path.c_str(), "rb");
    if (!fp) { r.error = "cannot open: " + path; return r; }

    std::vector<float> positions;  // 3n
    std::vector<float> normals;    // 3n
    std::vector<float> uvs;        // 2n

    std::unordered_map<FaceKey, std::uint32_t, FaceKeyHash> unique;
    MeshIR mesh;
    mesh.name = "mesh";

    auto flush_mesh = [&](){
        if (!mesh.positions.empty() && !mesh.indices.empty()) {
            r.ir.meshes.push_back(std::move(mesh));
        }
        mesh = MeshIR{};
        unique.clear();
    };

    char line[4096];
    while (std::fgets(line, sizeof(line), fp)) {
        // rstrip
        std::size_t n = std::strlen(line);
        while (n && (line[n-1] == '\n' || line[n-1] == '\r' || line[n-1] == ' ')) line[--n] = 0;
        if (n == 0 || line[0] == '#') continue;

        if (line[0] == 'v' && line[1] == ' ') {
            float x, y, z;
            if (std::sscanf(line + 2, "%f %f %f", &x, &y, &z) == 3) {
                positions.push_back(x); positions.push_back(y); positions.push_back(z);
            }
        } else if (line[0] == 'v' && line[1] == 'n' && line[2] == ' ') {
            float x, y, z;
            if (std::sscanf(line + 3, "%f %f %f", &x, &y, &z) == 3) {
                normals.push_back(x); normals.push_back(y); normals.push_back(z);
            }
        } else if (line[0] == 'v' && line[1] == 't' && line[2] == ' ') {
            float u, v;
            if (std::sscanf(line + 3, "%f %f", &u, &v) >= 2) {
                uvs.push_back(u); uvs.push_back(v);
            }
        } else if (line[0] == 'g' && line[1] == ' ') {
            flush_mesh();
            mesh.name = line + 2;
        } else if (line[0] == 'f' && line[1] == ' ') {
            // トークン分割
            std::vector<std::string> toks;
            const char *p = line + 2;
            while (*p) {
                while (*p == ' ') ++p;
                if (!*p) break;
                const char *s = p;
                while (*p && *p != ' ') ++p;
                toks.emplace_back(s, p - s);
            }
            if (toks.size() < 3) continue;

            std::vector<std::uint32_t> polyIdx;
            polyIdx.reserve(toks.size());
            for (auto &t : toks) {
                int v, vt, vn;
                parse_face_token(t, v, vt, vn);
                if (v < 0) continue;
                FaceKey key{v, vt, vn};
                auto it = unique.find(key);
                std::uint32_t newIdx;
                if (it == unique.end()) {
                    newIdx = static_cast<std::uint32_t>(mesh.positions.size() / 3);
                    mesh.positions.push_back(positions[v*3+0]);
                    mesh.positions.push_back(positions[v*3+1]);
                    mesh.positions.push_back(positions[v*3+2]);
                    if (vt >= 0 && (vt*2+1) < static_cast<int>(uvs.size())) {
                        mesh.uvs.push_back(uvs[vt*2+0]);
                        mesh.uvs.push_back(1.0f - uvs[vt*2+1]);  // MV1 は上原点
                    } else if (!uvs.empty()) {
                        mesh.uvs.push_back(0); mesh.uvs.push_back(0);
                    }
                    if (vn >= 0 && (vn*3+2) < static_cast<int>(normals.size())) {
                        mesh.normals.push_back(normals[vn*3+0]);
                        mesh.normals.push_back(normals[vn*3+1]);
                        mesh.normals.push_back(normals[vn*3+2]);
                    } else if (!normals.empty()) {
                        mesh.normals.push_back(0); mesh.normals.push_back(1); mesh.normals.push_back(0);
                    }
                    unique[key] = newIdx;
                } else {
                    newIdx = it->second;
                }
                polyIdx.push_back(newIdx);
            }
            // fan triangulation
            for (std::size_t i = 1; i + 1 < polyIdx.size(); ++i) {
                mesh.indices.push_back(polyIdx[0]);
                mesh.indices.push_back(polyIdx[i]);
                mesh.indices.push_back(polyIdx[i+1]);
            }
        }
    }
    flush_mesh();
    std::fclose(fp);

    if (r.ir.meshes.empty()) {
        r.error = "no meshes parsed from " + path;
        return r;
    }

    // デフォルトマテリアル 1 個
    MaterialIR mat;
    mat.name = "default";
    r.ir.materials.push_back(mat);
    for (auto &m : r.ir.meshes) m.material = 0;
    return r;
}

}
