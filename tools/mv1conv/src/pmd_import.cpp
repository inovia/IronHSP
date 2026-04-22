#include "pmd_import.hpp"
#include <cstdio>
#include <cstdint>
#include <cstring>
#include <filesystem>
#include <string>
#include <vector>
#include <windows.h>  // for MultiByteToWideChar / WideCharToMultiByte (Shift-JIS 変換)

namespace mv1conv {

namespace {

std::string sjis_to_utf8(const char *s, std::size_t n) {
    // ヌル終端で切る
    std::size_t len = 0;
    while (len < n && s[len] != '\0') ++len;
    if (len == 0) return {};
    int wlen = MultiByteToWideChar(932, 0, s, static_cast<int>(len), nullptr, 0);
    if (wlen <= 0) return std::string(s, len);  // fallback: そのまま
    std::wstring w(wlen, L'\0');
    MultiByteToWideChar(932, 0, s, static_cast<int>(len), w.data(), wlen);
    int u8len = WideCharToMultiByte(CP_UTF8, 0, w.data(), wlen, nullptr, 0, nullptr, nullptr);
    std::string u8(u8len, '\0');
    WideCharToMultiByte(CP_UTF8, 0, w.data(), wlen, u8.data(), u8len, nullptr, nullptr);
    return u8;
}

// PMD reader
struct Cursor {
    const std::uint8_t *p;
    const std::uint8_t *pEnd;
    bool read(void *dst, std::size_t n) {
        if (p + n > pEnd) return false;
        std::memcpy(dst, p, n);
        p += n;
        return true;
    }
    bool skip(std::size_t n) {
        if (p + n > pEnd) return false;
        p += n;
        return true;
    }
};

}

LoadResult load_pmd(const std::string &path) {
    LoadResult r;
    std::FILE *fp = std::fopen(path.c_str(), "rb");
    if (!fp) { r.error = "cannot open: " + path; return r; }
    std::error_code ec;
    auto sz = std::filesystem::file_size(path, ec);
    if (ec) { r.error = "file_size: " + ec.message(); std::fclose(fp); return r; }
    std::vector<std::uint8_t> all(sz);
    if (std::fread(all.data(), 1, sz, fp) != sz) {
        r.error = "short read"; std::fclose(fp); return r;
    }
    std::fclose(fp);

    if (all.size() < 7 || std::memcmp(all.data(), "Pmd", 3) != 0) {
        r.error = "not a PMD file (missing 'Pmd' magic)";
        return r;
    }

    Cursor c{all.data(), all.data() + all.size()};
    c.skip(3);          // "Pmd"
    float version;
    if (!c.read(&version, 4)) { r.error = "PMD: short header"; return r; }
    if (!c.skip(20))          { r.error = "PMD: short name"; return r; }     // Model name
    if (!c.skip(256))         { r.error = "PMD: short comment"; return r; }  // Comment

    // 頂点
    std::uint32_t vertN;
    if (!c.read(&vertN, 4)) { r.error = "PMD: short vertex count"; return r; }
    std::vector<float> positions(vertN * 3);
    std::vector<float> normals(vertN * 3);
    std::vector<float> uvs(vertN * 2);
    for (std::uint32_t i = 0; i < vertN; ++i) {
        if (c.p + 38 > c.pEnd) { r.error = "PMD: short vertex data"; return r; }
        std::memcpy(&positions[i*3], c.p + 0,  12);
        std::memcpy(&normals[i*3],   c.p + 12, 12);
        std::memcpy(&uvs[i*2],       c.p + 24, 8);
        c.p += 38;
    }

    // 面
    std::uint32_t indexN;
    if (!c.read(&indexN, 4)) { r.error = "PMD: short index count"; return r; }
    std::vector<std::uint32_t> indices(indexN);
    for (std::uint32_t i = 0; i < indexN; ++i) {
        std::uint16_t v;
        if (!c.read(&v, 2)) { r.error = "PMD: short index"; return r; }
        indices[i] = v;
    }

    // マテリアル
    std::uint32_t matN;
    if (!c.read(&matN, 4)) { r.error = "PMD: short material count"; return r; }
    std::vector<MaterialIR> mats;
    std::vector<std::uint32_t> matFaceIdxCount(matN);
    for (std::uint32_t i = 0; i < matN; ++i) {
        if (c.p + 70 > c.pEnd) { r.error = "PMD: short material data"; return r; }
        MaterialIR m;
        float diff[3], alpha, power, spec[3], ambi[3];
        std::memcpy(diff, c.p + 0,  12);
        std::memcpy(&alpha, c.p + 12, 4);
        std::memcpy(&power, c.p + 16, 4);
        std::memcpy(spec, c.p + 20, 12);
        std::memcpy(ambi, c.p + 32, 12);
        std::uint8_t toon_idx = c.p[44];
        std::uint8_t edge_flag = c.p[45];
        std::uint32_t faceVertCount;
        std::memcpy(&faceVertCount, c.p + 46, 4);
        std::string tex = sjis_to_utf8(reinterpret_cast<const char *>(c.p + 50), 20);
        c.p += 70;

        m.name = "mat" + std::to_string(i);
        m.diffuse[0] = diff[0]; m.diffuse[1] = diff[1]; m.diffuse[2] = diff[2]; m.diffuse[3] = alpha;
        m.specular[0] = spec[0]; m.specular[1] = spec[1]; m.specular[2] = spec[2];
        m.ambient[0] = ambi[0];  m.ambient[1] = ambi[1];  m.ambient[2] = ambi[2];
        m.power = power;
        (void)toon_idx; (void)edge_flag; (void)tex;
        matFaceIdxCount[i] = faceVertCount;
        mats.push_back(m);
    }
    // 以降のセクション (ボーン / IK / 表情 / 物理) は読み飛ばし — 静的メッシュ用なので OK

    // マテリアルごとにメッシュを分割
    std::size_t idxOff = 0;
    for (std::uint32_t i = 0; i < matN; ++i) {
        std::uint32_t fc = matFaceIdxCount[i];
        if (fc == 0) continue;
        MeshIR mesh;
        mesh.name = "mesh" + std::to_string(i);
        mesh.material = static_cast<int>(i);
        // 使用頂点を収集して ローカル index 化
        std::vector<std::int32_t> remap(vertN, -1);
        for (std::uint32_t k = 0; k < fc; ++k) {
            std::uint32_t src_vi = indices[idxOff + k];
            if (src_vi >= vertN) continue;
            if (remap[src_vi] < 0) {
                remap[src_vi] = static_cast<std::int32_t>(mesh.positions.size() / 3);
                mesh.positions.push_back(positions[src_vi*3+0]);
                mesh.positions.push_back(positions[src_vi*3+1]);
                mesh.positions.push_back(positions[src_vi*3+2]);
                mesh.normals.push_back(normals[src_vi*3+0]);
                mesh.normals.push_back(normals[src_vi*3+1]);
                mesh.normals.push_back(normals[src_vi*3+2]);
                mesh.uvs.push_back(uvs[src_vi*2+0]);
                mesh.uvs.push_back(uvs[src_vi*2+1]);
            }
            mesh.indices.push_back(static_cast<std::uint32_t>(remap[src_vi]));
        }
        idxOff += fc;
        r.ir.meshes.push_back(std::move(mesh));
    }

    if (r.ir.meshes.empty()) {
        r.error = "PMD: no usable meshes";
        return r;
    }
    r.ir.materials = std::move(mats);
    return r;
}

}
