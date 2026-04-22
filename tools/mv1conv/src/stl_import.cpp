#include "stl_import.hpp"
#include <cstdio>
#include <cstdint>
#include <cstring>
#include <cstdlib>
#include <filesystem>
#include <string>
#include <unordered_map>
#include <vector>

namespace mv1conv {

namespace {

struct Vec3Key {
    std::uint32_t xi, yi, zi;
    bool operator==(const Vec3Key &o) const { return xi == o.xi && yi == o.yi && zi == o.zi; }
};
struct Vec3KeyHash {
    std::size_t operator()(const Vec3Key &k) const noexcept {
        std::uint64_t h = k.xi;
        h = h * 0x9E3779B97F4A7C15ull + k.yi;
        h = h * 0x9E3779B97F4A7C15ull + k.zi;
        return static_cast<std::size_t>(h);
    }
};

Vec3Key to_key(float x, float y, float z) {
    Vec3Key k;
    std::memcpy(&k.xi, &x, 4);
    std::memcpy(&k.yi, &y, 4);
    std::memcpy(&k.zi, &z, 4);
    return k;
}

LoadResult load_stl_binary(const std::vector<std::uint8_t> &bytes) {
    LoadResult r;
    if (bytes.size() < 84) { r.error = "STL binary: too short"; return r; }
    std::uint32_t n;
    std::memcpy(&n, bytes.data() + 80, 4);
    if (84 + std::uint64_t(n) * 50 > bytes.size()) {
        r.error = "STL binary: triangle count inconsistent";
        return r;
    }

    MeshIR mesh;
    mesh.name = "stl";

    std::unordered_map<Vec3Key, std::uint32_t, Vec3KeyHash> unique;
    const std::uint8_t *p = bytes.data() + 84;
    for (std::uint32_t t = 0; t < n; ++t) {
        float nv[3], v[9];
        std::memcpy(nv, p + 0,  12);
        std::memcpy(v,  p + 12, 36);
        p += 50;
        for (int k = 0; k < 3; ++k) {
            auto key = to_key(v[k*3+0], v[k*3+1], v[k*3+2]);
            auto it = unique.find(key);
            std::uint32_t idx;
            if (it == unique.end()) {
                idx = static_cast<std::uint32_t>(mesh.positions.size() / 3);
                mesh.positions.push_back(v[k*3+0]);
                mesh.positions.push_back(v[k*3+1]);
                mesh.positions.push_back(v[k*3+2]);
                mesh.normals.push_back(nv[0]);
                mesh.normals.push_back(nv[1]);
                mesh.normals.push_back(nv[2]);
                unique[key] = idx;
            } else {
                idx = it->second;
            }
            mesh.indices.push_back(idx);
        }
    }

    r.ir.meshes.push_back(std::move(mesh));
    MaterialIR m; m.name = "default";
    r.ir.materials.push_back(m);
    return r;
}

LoadResult load_stl_ascii(const std::string &path) {
    LoadResult r;
    std::FILE *fp = std::fopen(path.c_str(), "r");
    if (!fp) { r.error = "cannot open: " + path; return r; }

    MeshIR mesh;
    mesh.name = "stl";
    std::unordered_map<Vec3Key, std::uint32_t, Vec3KeyHash> unique;

    char line[1024];
    float curNormal[3] = {0, 0, 0};
    std::vector<std::uint32_t> faceIdx;

    auto intern = [&](float x, float y, float z) -> std::uint32_t {
        auto k = to_key(x, y, z);
        auto it = unique.find(k);
        if (it != unique.end()) return it->second;
        std::uint32_t idx = static_cast<std::uint32_t>(mesh.positions.size() / 3);
        mesh.positions.push_back(x);
        mesh.positions.push_back(y);
        mesh.positions.push_back(z);
        mesh.normals.push_back(curNormal[0]);
        mesh.normals.push_back(curNormal[1]);
        mesh.normals.push_back(curNormal[2]);
        unique[k] = idx;
        return idx;
    };

    while (std::fgets(line, sizeof(line), fp)) {
        char *p = line;
        while (*p == ' ' || *p == '\t') ++p;
        if (std::strncmp(p, "facet normal", 12) == 0) {
            std::sscanf(p + 12, "%f %f %f", &curNormal[0], &curNormal[1], &curNormal[2]);
            faceIdx.clear();
        } else if (std::strncmp(p, "vertex", 6) == 0) {
            float x, y, z;
            if (std::sscanf(p + 6, "%f %f %f", &x, &y, &z) == 3) {
                faceIdx.push_back(intern(x, y, z));
            }
        } else if (std::strncmp(p, "endfacet", 8) == 0) {
            for (std::size_t i = 1; i + 1 < faceIdx.size(); ++i) {
                mesh.indices.push_back(faceIdx[0]);
                mesh.indices.push_back(faceIdx[i]);
                mesh.indices.push_back(faceIdx[i+1]);
            }
            faceIdx.clear();
        }
    }
    std::fclose(fp);

    if (mesh.positions.empty() || mesh.indices.empty()) {
        r.error = "STL ascii: no triangles";
        return r;
    }

    r.ir.meshes.push_back(std::move(mesh));
    MaterialIR m; m.name = "default";
    r.ir.materials.push_back(m);
    return r;
}

}

LoadResult load_stl(const std::string &path) {
    LoadResult r;
    std::FILE *fp = std::fopen(path.c_str(), "rb");
    if (!fp) { r.error = "cannot open: " + path; return r; }
    std::error_code ec;
    auto sz = std::filesystem::file_size(path, ec);
    if (ec) { std::fclose(fp); r.error = "file_size: " + ec.message(); return r; }
    std::vector<std::uint8_t> bytes(sz);
    if (std::fread(bytes.data(), 1, bytes.size(), fp) != bytes.size()) {
        r.error = "short read";
        std::fclose(fp); return r;
    }
    std::fclose(fp);

    // 自動判別: 先頭 "solid" で始まり、テキストっぽければ ASCII。
    // 偽陽性回避: binary STL も "solid" から始まることがあるので、
    // 80+4 byte ヘッダの後の triangle count ×50 + 84 がファイルサイズと一致するか見る。
    if (bytes.size() >= 84) {
        std::uint32_t n;
        std::memcpy(&n, bytes.data() + 80, 4);
        if (84u + static_cast<std::uint64_t>(n) * 50u == bytes.size()) {
            return load_stl_binary(bytes);
        }
    }
    // 先頭が "solid" なら ASCII として再読み
    if (bytes.size() >= 5 && std::memcmp(bytes.data(), "solid", 5) == 0) {
        return load_stl_ascii(path);
    }
    // fallback: binary
    return load_stl_binary(bytes);
}

}
