#include "obj_import.hpp"
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <filesystem>
#include <sstream>
#include <string>
#include <unordered_map>
#include <vector>

namespace mv1conv {

namespace {

// .mtl ファイルをパースして MaterialIR / TextureIR を追加、
// マテリアル名 → IR index のマップを返す
void load_mtl(const std::string &mtl_path, ModelIR &ir,
              std::unordered_map<std::string, int> &name_to_material)
{
    std::FILE *fp = std::fopen(mtl_path.c_str(), "r");
    if (!fp) return;  // optional

    auto add_texture = [&](const std::string &path) -> int {
        for (std::size_t i = 0; i < ir.textures.size(); ++i) {
            if (ir.textures[i].color_path == path) return static_cast<int>(i);
        }
        TextureIR t;
        t.name = std::filesystem::path(path).stem().string();
        t.color_path = path;
        ir.textures.push_back(t);
        return static_cast<int>(ir.textures.size() - 1);
    };

    MaterialIR cur;
    bool has_cur = false;
    std::string cur_name;

    auto flush_material = [&]() {
        if (has_cur) {
            name_to_material[cur_name] = static_cast<int>(ir.materials.size());
            ir.materials.push_back(cur);
        }
        cur = MaterialIR{};
        has_cur = false;
    };

    char line[1024];
    while (std::fgets(line, sizeof(line), fp)) {
        std::size_t n = std::strlen(line);
        while (n && (line[n-1] == '\n' || line[n-1] == '\r' || line[n-1] == ' ')) line[--n] = 0;
        char *p = line;
        while (*p == ' ' || *p == '\t') ++p;
        if (*p == 0 || *p == '#') continue;

        if (std::strncmp(p, "newmtl", 6) == 0) {
            flush_material();
            cur_name = p + 7;
            while (!cur_name.empty() && (cur_name.front() == ' ' || cur_name.front() == '\t')) cur_name.erase(0, 1);
            cur.name = cur_name;
            has_cur = true;
        } else if (std::strncmp(p, "Kd", 2) == 0 && (p[2] == ' ' || p[2] == '\t')) {
            std::sscanf(p + 3, "%f %f %f", &cur.diffuse[0], &cur.diffuse[1], &cur.diffuse[2]);
            cur.diffuse[3] = 1.0f;
        } else if (std::strncmp(p, "Ka", 2) == 0 && (p[2] == ' ' || p[2] == '\t')) {
            std::sscanf(p + 3, "%f %f %f", &cur.ambient[0], &cur.ambient[1], &cur.ambient[2]);
            cur.ambient[3] = 1.0f;
        } else if (std::strncmp(p, "Ks", 2) == 0 && (p[2] == ' ' || p[2] == '\t')) {
            std::sscanf(p + 3, "%f %f %f", &cur.specular[0], &cur.specular[1], &cur.specular[2]);
            cur.specular[3] = 1.0f;
        } else if (std::strncmp(p, "Ke", 2) == 0 && (p[2] == ' ' || p[2] == '\t')) {
            std::sscanf(p + 3, "%f %f %f", &cur.emissive[0], &cur.emissive[1], &cur.emissive[2]);
        } else if (std::strncmp(p, "Ns", 2) == 0 && (p[2] == ' ' || p[2] == '\t')) {
            std::sscanf(p + 3, "%f", &cur.power);
        } else if (std::strncmp(p, "d ", 2) == 0 || std::strncmp(p, "Tr ", 3) == 0) {
            // 不透明度 (d) または透明度 (Tr) の扱いは簡略化
            float v = 1.0f;
            std::sscanf(p + (p[0] == 'T' ? 3 : 2), "%f", &v);
            cur.alpha = (p[0] == 'T') ? v : (1.0f - v);
        } else if (std::strncmp(p, "map_Kd", 6) == 0 && (p[6] == ' ' || p[6] == '\t')) {
            std::string path = p + 7;
            while (!path.empty() && (path.front() == ' ' || path.front() == '\t')) path.erase(0, 1);
            if (!path.empty()) cur.diffuse_texture = add_texture(path);
        }
    }
    flush_material();
    std::fclose(fp);
}

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

    std::unordered_map<std::string, int> mtlMap;  // material name -> IR index
    int curMaterialIndex = -1;  // flush 時にメッシュに焼く

    std::unordered_map<FaceKey, std::uint32_t, FaceKeyHash> unique;
    MeshIR mesh;
    mesh.name = "mesh";

    auto flush_mesh = [&](){
        if (!mesh.positions.empty() && !mesh.indices.empty()) {
            if (curMaterialIndex >= 0) mesh.material = curMaterialIndex;
            r.ir.meshes.push_back(std::move(mesh));
        }
        mesh = MeshIR{};
        unique.clear();
    };

    std::filesystem::path obj_dir = std::filesystem::path(path).parent_path();

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
        } else if (std::strncmp(line, "mtllib", 6) == 0 && (line[6] == ' ' || line[6] == '\t')) {
            std::string mtl = line + 7;
            while (!mtl.empty() && (mtl.front() == ' ' || mtl.front() == '\t')) mtl.erase(0, 1);
            auto mtl_path = obj_dir / mtl;
            load_mtl(mtl_path.string(), r.ir, mtlMap);
        } else if (std::strncmp(line, "usemtl", 6) == 0 && (line[6] == ' ' || line[6] == '\t')) {
            std::string mn = line + 7;
            while (!mn.empty() && (mn.front() == ' ' || mn.front() == '\t')) mn.erase(0, 1);
            auto it = mtlMap.find(mn);
            if (it != mtlMap.end()) {
                // 別マテリアルに切り替わる場合はメッシュを分割
                if (curMaterialIndex >= 0 && it->second != curMaterialIndex) {
                    flush_mesh();
                }
                curMaterialIndex = it->second;
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

    // MTL 由来のマテリアルが 1 個もなければデフォルト 1 個追加
    if (r.ir.materials.empty()) {
        MaterialIR mat;
        mat.name = "default";
        r.ir.materials.push_back(mat);
        for (auto &m : r.ir.meshes) m.material = 0;
    }
    return r;
}

}
