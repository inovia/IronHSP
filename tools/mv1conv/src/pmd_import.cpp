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
    // PMD 頂点末尾 6 bytes: bone0 (u16), bone1 (u16), weight0 (u8 0-100), edge_flag (u8)
    std::vector<std::uint16_t> vb0(vertN), vb1(vertN);
    std::vector<std::uint8_t> vw0(vertN);
    for (std::uint32_t i = 0; i < vertN; ++i) {
        if (c.p + 38 > c.pEnd) { r.error = "PMD: short vertex data"; return r; }
        std::memcpy(&positions[i*3], c.p + 0,  12);
        std::memcpy(&normals[i*3],   c.p + 12, 12);
        std::memcpy(&uvs[i*2],       c.p + 24, 8);
        std::memcpy(&vb0[i], c.p + 32, 2);
        std::memcpy(&vb1[i], c.p + 34, 2);
        vw0[i] = c.p[36];
        // c.p[37] = edge_flag (無視)
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
    // 各 material の toon_idx を後で使うため一時保存
    std::vector<std::uint8_t> matToonIdx(matN);
    // PMD texture path は "main.bmp*sphere.bmp" の形式 (2 枚並列)。
    // 重複を避けるため path→index map を持つ。
    std::vector<TextureIR> textures;
    auto add_texture = [&](const std::string &path) -> int {
        if (path.empty()) return -1;
        for (std::size_t i = 0; i < textures.size(); ++i) {
            if (textures[i].color_path == path) return static_cast<int>(i);
        }
        TextureIR t;
        t.name = path;
        t.color_path = path;
        textures.push_back(std::move(t));
        return static_cast<int>(textures.size() - 1);
    };
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
        (void)toon_idx; (void)edge_flag;

        // PMD texture 仕様: "diffuse_path[*sphere_path]"
        //   `*` の前 = diffuse (拡張子を問わず、.sph/.spa でも diffuse として使用可)
        //   `*` の後 = sphere map
        // sphere mode は sphere_path の拡張子で決定:
        //   .sph → mode=1 (乗算), .spa → mode=2 (加算)
        auto sphere_ext_mode = [](const std::string &path) -> int {
            if (path.size() < 4) return 1;
            std::string lo;
            for (auto c : path) lo.push_back(static_cast<char>(std::tolower(c)));
            if (lo.compare(lo.size() - 4, 4, ".spa") == 0) return 2;
            return 1;  // .sph など未知の拡張子は multiply 扱い
        };
        std::string diffuse_path, sphere_path;
        auto star = tex.find('*');
        if (star != std::string::npos) {
            diffuse_path = tex.substr(0, star);
            sphere_path = tex.substr(star + 1);
        } else {
            diffuse_path = tex;
        }
        m.diffuse_texture = add_texture(diffuse_path);
        m.sphere_texture  = add_texture(sphere_path);
        m.sphere_mode     = sphere_path.empty() ? 0 : sphere_ext_mode(sphere_path);

        matFaceIdxCount[i] = faceVertCount;
        matToonIdx[i] = toon_idx;
        mats.push_back(m);
    }
    // ボーン
    std::vector<BoneIR> bones;
    if (c.p + 2 <= c.pEnd) {
        std::uint16_t boneN;
        std::memcpy(&boneN, c.p, 2);
        c.p += 2;
        // PMD bone entry = 39 bytes
        //   name[20] (SJIS) / parent_u16 / tail_u16 / type_u8 / ik_parent_u16 / position (12)
        bones.reserve(boneN);
        // world-space 位置を parent-relative translate に変換するため、world を先に全部読む
        std::vector<std::array<float, 3>> world_pos(boneN);
        std::vector<std::int32_t> parent(boneN, -1);
        std::vector<std::string> names(boneN);
        for (std::uint16_t i = 0; i < boneN; ++i) {
            if (c.p + 39 > c.pEnd) { r.error = "PMD: short bone data"; return r; }
            names[i] = sjis_to_utf8(reinterpret_cast<const char *>(c.p + 0), 20);
            std::uint16_t par_u16;
            std::memcpy(&par_u16, c.p + 20, 2);
            parent[i] = (par_u16 == 0xFFFF) ? -1 : static_cast<std::int32_t>(par_u16);
            std::memcpy(world_pos[i].data(), c.p + 27, 12);
            c.p += 39;
        }
        for (std::uint16_t i = 0; i < boneN; ++i) {
            BoneIR b;
            b.name = names[i];
            b.parent = parent[i];
            // world → parent-relative translate
            if (b.parent >= 0 && b.parent < static_cast<int>(boneN)) {
                b.translate[0] = world_pos[i][0] - world_pos[b.parent][0];
                b.translate[1] = world_pos[i][1] - world_pos[b.parent][1];
                b.translate[2] = world_pos[i][2] - world_pos[b.parent][2];
            } else {
                b.translate[0] = world_pos[i][0];
                b.translate[1] = world_pos[i][1];
                b.translate[2] = world_pos[i][2];
            }
            bones.push_back(std::move(b));
        }
    }
    // 以降のセクションを順次 skip して toon texture リスト (10 × 100 bytes) まで進む
    std::size_t boneN_local = bones.size();
    std::array<std::string, 10> toon_paths;
    bool toon_ok = true;
    // IK
    if (toon_ok && c.p + 2 <= c.pEnd) {
        std::uint16_t ikN;
        std::memcpy(&ikN, c.p, 2); c.p += 2;
        for (std::uint16_t i = 0; i < ikN; ++i) {
            // 2+2+1+2+4 = 11 fixed, + 2 * chain_len
            if (c.p + 11 > c.pEnd) { toon_ok = false; break; }
            std::uint8_t chain_len = c.p[4];
            c.p += 11;
            if (c.p + 2 * chain_len > c.pEnd) { toon_ok = false; break; }
            c.p += 2 * chain_len;
        }
    }
    // morph (表情)。base + N-1 個の shape morph。base は PMD 頂点 idx への lookup table。
    std::uint16_t morphN_local = 0;
    struct PmdMorphEntry { std::uint32_t idx; float dp[3]; };
    struct PmdMorph { std::string name; std::uint8_t type; std::vector<PmdMorphEntry> verts; };
    std::vector<PmdMorph> pmd_morphs;
    if (toon_ok && c.p + 2 <= c.pEnd) {
        std::memcpy(&morphN_local, c.p, 2); c.p += 2;
        pmd_morphs.reserve(morphN_local);
        for (std::uint16_t i = 0; i < morphN_local; ++i) {
            if (c.p + 25 > c.pEnd) { toon_ok = false; break; }
            PmdMorph pm;
            pm.name = sjis_to_utf8(reinterpret_cast<const char *>(c.p), 20);
            std::uint32_t vcount;
            std::memcpy(&vcount, c.p + 20, 4);
            pm.type = c.p[24];
            c.p += 25;
            if (c.p + static_cast<std::ptrdiff_t>(16) * vcount > c.pEnd) { toon_ok = false; break; }
            pm.verts.resize(vcount);
            for (std::uint32_t v = 0; v < vcount; ++v) {
                std::memcpy(&pm.verts[v].idx, c.p + 0, 4);
                std::memcpy(pm.verts[v].dp,   c.p + 4, 12);
                c.p += 16;
            }
            pmd_morphs.push_back(std::move(pm));
        }
    }
    // disp_morph_count (u8) + u16[count]
    if (toon_ok && c.p + 1 <= c.pEnd) {
        std::uint8_t n = c.p[0]; c.p += 1;
        if (c.p + 2 * n > c.pEnd) toon_ok = false;
        else c.p += 2 * n;
    }
    // disp_bone_panel_count (u8) + char[50][count]
    std::uint8_t disp_bone_panel_count = 0;
    if (toon_ok && c.p + 1 <= c.pEnd) {
        disp_bone_panel_count = c.p[0]; c.p += 1;
        if (c.p + 50 * disp_bone_panel_count > c.pEnd) toon_ok = false;
        else c.p += 50 * disp_bone_panel_count;
    }
    // disp_bone_count (u32) + (u16 bone_idx + u8 panel) × count
    if (toon_ok && c.p + 4 <= c.pEnd) {
        std::uint32_t n;
        std::memcpy(&n, c.p, 4); c.p += 4;
        if (c.p + static_cast<std::ptrdiff_t>(3) * n > c.pEnd) toon_ok = false;
        else c.p += 3 * n;
    }
    // english_flag (u8)
    if (toon_ok && c.p + 1 <= c.pEnd) {
        std::uint8_t en = c.p[0]; c.p += 1;
        if (en) {
            // English section: 20 name + 256 comment + 20*boneN + 20*(morphN-1) +
            //                  50*disp_bone_panel_count
            std::size_t en_size = 20 + 256 + 20 * boneN_local;
            if (morphN_local > 0) en_size += 20 * (static_cast<std::size_t>(morphN_local) - 1);
            en_size += 50 * disp_bone_panel_count;
            if (c.p + en_size > c.pEnd) toon_ok = false;
            else c.p += en_size;
        }
    }
    // toon texture list (10 × char[100])
    if (toon_ok && c.p + 1000 <= c.pEnd) {
        for (int i = 0; i < 10; ++i) {
            toon_paths[i] = sjis_to_utf8(reinterpret_cast<const char *>(c.p), 100);
            c.p += 100;
        }
    } else {
        toon_ok = false;
    }

    // toon texture を各 material に適用 (DxLib 本家 PMD loader の挙動に合わせる)。
    // 公式 DxLib は PMD の toon を常に外部 texture として扱う (ref=0)。
    //   toon_idx = 0..9:  toon_paths[idx] を texture list に追加
    //   toon_idx = 0xFF:  "toon0.bmp" を texture list に追加 (DxLib 独自の placeholder 名)
    for (std::uint32_t i = 0; i < matN; ++i) {
        std::uint8_t ti = matToonIdx[i];
        std::string path;
        if (ti == 0xFF) {
            path = "toon0.bmp";
        } else if (ti < 10) {
            path = toon_paths[ti];
        }
        if (path.empty()) {
            mats[i].pmx_toon_ref = 1;
            mats[i].pmx_toon_internal = 0;
        } else {
            mats[i].pmx_toon_ref = 0;
            mats[i].pmx_toon_texture = add_texture(path);
        }
    }

    // マテリアルごとにメッシュを分割
    const bool has_bones = !bones.empty();
    std::size_t idxOff = 0;
    // PMD 頂点 idx → [(mesh_ir_idx, local_vi)...] の逆引きマップ (morph emit 用)
    std::vector<std::vector<std::pair<std::uint32_t, std::uint32_t>>> pmd_to_mesh_local(vertN);
    for (std::uint32_t i = 0; i < matN; ++i) {
        std::uint32_t fc = matFaceIdxCount[i];
        if (fc == 0) continue;
        MeshIR mesh;
        mesh.name = "mesh" + std::to_string(i);
        mesh.material = static_cast<int>(i);
        const std::uint32_t current_mesh_ir_idx = static_cast<std::uint32_t>(r.ir.meshes.size());
        // 使用頂点を収集して ローカル index 化
        std::vector<std::int32_t> remap(vertN, -1);
        for (std::uint32_t k = 0; k < fc; ++k) {
            std::uint32_t src_vi = indices[idxOff + k];
            if (src_vi >= vertN) continue;
            if (remap[src_vi] < 0) {
                remap[src_vi] = static_cast<std::int32_t>(mesh.positions.size() / 3);
                pmd_to_mesh_local[src_vi].emplace_back(
                    current_mesh_ir_idx,
                    static_cast<std::uint32_t>(remap[src_vi]));
                mesh.positions.push_back(positions[src_vi*3+0]);
                mesh.positions.push_back(positions[src_vi*3+1]);
                mesh.positions.push_back(positions[src_vi*3+2]);
                mesh.normals.push_back(normals[src_vi*3+0]);
                mesh.normals.push_back(normals[src_vi*3+1]);
                mesh.normals.push_back(normals[src_vi*3+2]);
                mesh.uvs.push_back(uvs[src_vi*2+0]);
                mesh.uvs.push_back(uvs[src_vi*2+1]);
                if (has_bones) {
                    VertexBone vb{};
                    vb.bone[0] = vb0[src_vi];
                    vb.bone[1] = vb1[src_vi];
                    float w0 = vw0[src_vi] / 100.0f;
                    vb.weight[0] = w0;
                    vb.weight[1] = 1.0f - w0;
                    // weight[2/3] = 0 は VertexBone デフォルト値なので未設定 OK
                    vb.bone[2] = -1;
                    vb.bone[3] = -1;
                    mesh.bone_weights.push_back(vb);
                }
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
    r.ir.textures = std::move(textures);
    r.ir.bones = std::move(bones);

    // PMD morphs → IR shapes. base (index 0, type 0) は lookup table、skip。
    if (pmd_morphs.size() > 1) {
        const auto &base = pmd_morphs[0];
        for (std::size_t mi = 1; mi < pmd_morphs.size(); ++mi) {
            const auto &pm = pmd_morphs[mi];
            ShapeIR s;
            s.name = pm.name;
            // mesh_ir_idx → ShapeMeshIR の dense map。
            std::vector<ShapeMeshIR> per_mesh(r.ir.meshes.size());
            for (std::size_t i = 0; i < per_mesh.size(); ++i) per_mesh[i].target_mesh = static_cast<std::uint32_t>(i);
            for (const auto &e : pm.verts) {
                // PMD morph の idx は base morph の index へのインデックス参照
                if (e.idx >= base.verts.size()) continue;
                std::uint32_t abs_pmd_vi = base.verts[e.idx].idx;
                if (abs_pmd_vi >= vertN) continue;
                for (const auto &[mesh_idx, local_vi] : pmd_to_mesh_local[abs_pmd_vi]) {
                    ShapeVertexIR sv{};
                    sv.target_mesh_vertex = local_vi;
                    sv.dp[0] = e.dp[0];
                    sv.dp[1] = e.dp[1];
                    sv.dp[2] = e.dp[2];
                    per_mesh[mesh_idx].vertices.push_back(sv);
                }
            }
            for (auto &sm : per_mesh) {
                if (!sm.vertices.empty()) s.meshes.push_back(std::move(sm));
            }
            if (!s.meshes.empty()) r.ir.shapes.push_back(std::move(s));
        }
    }
    return r;
}

}
