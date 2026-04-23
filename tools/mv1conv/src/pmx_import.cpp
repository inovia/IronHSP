#include "pmx_import.hpp"
#include <cstdio>
#include <cstdint>
#include <cstring>
#include <filesystem>
#include <string>
#include <vector>
#include <windows.h>

namespace mv1conv {

namespace {

struct Cursor {
    const std::uint8_t *p;
    const std::uint8_t *pEnd;
    bool ok = true;
    bool avail(std::size_t n) const { return p + n <= pEnd; }
    template <class T> T read() {
        T v{};
        if (avail(sizeof(T))) { std::memcpy(&v, p, sizeof(T)); p += sizeof(T); }
        else ok = false;
        return v;
    }
    void skip(std::size_t n) { if (avail(n)) p += n; else ok = false; }

    // PMX 文字列: int32 byteCount + bytes (UTF-8 または UTF-16LE、header encoding で判定)
    std::string read_str(bool utf16le) {
        std::uint32_t n = read<std::uint32_t>();
        if (!avail(n)) { ok = false; return {}; }
        if (utf16le) {
            // UTF-16LE → UTF-8 変換 (Windows API 使用)
            int wlen = (int)(n / 2);
            std::wstring w(wlen, L'\0');
            std::memcpy(w.data(), p, n);
            p += n;
            int u8len = WideCharToMultiByte(CP_UTF8, 0, w.data(), wlen, nullptr, 0, nullptr, nullptr);
            std::string s(u8len, '\0');
            WideCharToMultiByte(CP_UTF8, 0, w.data(), wlen, s.data(), u8len, nullptr, nullptr);
            return s;
        } else {
            std::string s(reinterpret_cast<const char *>(p), n);
            p += n;
            return s;
        }
    }

    // 可変長 signed index (-1 = 無し)
    std::int32_t read_var_idx(int sz) {
        switch (sz) {
        case 1: { std::int8_t v = read<std::int8_t>();   return (v == (std::int8_t)-1) ? -1 : v; }
        case 2: { std::int16_t v = read<std::int16_t>(); return (v == (std::int16_t)-1) ? -1 : v; }
        case 4: { std::int32_t v = read<std::int32_t>(); return v; }
        }
        return -1;
    }
    std::uint32_t read_var_uidx(int sz) {
        switch (sz) {
        case 1: return read<std::uint8_t>();
        case 2: return read<std::uint16_t>();
        case 4: return read<std::uint32_t>();
        }
        return 0;
    }
};

}

LoadResult load_pmx(const std::string &path) {
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

    if (all.size() < 30 || std::memcmp(all.data(), "PMX ", 4) != 0) {
        r.error = "not a PMX file (missing 'PMX ' magic)";
        return r;
    }

    Cursor c{all.data() + 4, all.data() + all.size()};
    float version = c.read<float>();
    if (version < 2.0f || version > 2.1f) {
        r.error = "unsupported PMX version " + std::to_string(version);
        return r;
    }
    std::uint8_t globN = c.read<std::uint8_t>();
    if (globN < 8) { r.error = "PMX globals too short"; return r; }
    // globals: [encoding, additionalUV, vertexIndexSize, textureIndexSize,
    //          materialIndexSize, boneIndexSize, morphIndexSize, rigidbodyIndexSize]
    std::uint8_t encoding      = c.read<std::uint8_t>();  // 0=UTF16LE, 1=UTF8
    std::uint8_t additionalUV  = c.read<std::uint8_t>();
    std::uint8_t vtxIdxSize    = c.read<std::uint8_t>();
    std::uint8_t texIdxSize    = c.read<std::uint8_t>();
    std::uint8_t matIdxSize    = c.read<std::uint8_t>();
    std::uint8_t boneIdxSize   = c.read<std::uint8_t>();
    std::uint8_t morphIdxSize  = c.read<std::uint8_t>();
    std::uint8_t rbIdxSize     = c.read<std::uint8_t>();
    // remaining globals
    for (int g = 8; g < globN; ++g) c.skip(1);

    const bool utf16le = (encoding == 0);

    // モデル名 / コメント (jp + en それぞれ)
    std::string modelName = c.read_str(utf16le);
    std::string modelNameEn = c.read_str(utf16le);
    std::string comment = c.read_str(utf16le);
    std::string commentEn = c.read_str(utf16le);
    (void)modelName; (void)modelNameEn; (void)comment; (void)commentEn;

    // Vertices
    std::uint32_t vertN = c.read<std::uint32_t>();
    std::vector<float> positions(vertN * 3), normals(vertN * 3), uvs(vertN * 2);
    std::vector<VertexBone> weights(vertN);
    for (std::uint32_t v = 0; v < vertN; ++v) {
        positions[v*3+0] = c.read<float>();
        positions[v*3+1] = c.read<float>();
        positions[v*3+2] = c.read<float>();
        normals[v*3+0]   = c.read<float>();
        normals[v*3+1]   = c.read<float>();
        normals[v*3+2]   = c.read<float>();
        uvs[v*2+0]       = c.read<float>();
        uvs[v*2+1]       = c.read<float>();
        // 追加 UV
        for (std::uint8_t a = 0; a < additionalUV; ++a) {
            c.skip(16);  // float4
        }
        // Weight type
        std::uint8_t wType = c.read<std::uint8_t>();
        VertexBone &vb = weights[v];
        switch (wType) {
        case 0: {  // BDEF1: 単一ボーン
            vb.bone[0] = c.read_var_idx(boneIdxSize);
            vb.weight[0] = 1.0f;
            break;
        }
        case 1: {  // BDEF2
            vb.bone[0] = c.read_var_idx(boneIdxSize);
            vb.bone[1] = c.read_var_idx(boneIdxSize);
            float w = c.read<float>();
            vb.weight[0] = w;
            vb.weight[1] = 1.0f - w;
            break;
        }
        case 2: {  // BDEF4
            vb.bone[0] = c.read_var_idx(boneIdxSize);
            vb.bone[1] = c.read_var_idx(boneIdxSize);
            vb.bone[2] = c.read_var_idx(boneIdxSize);
            vb.bone[3] = c.read_var_idx(boneIdxSize);
            vb.weight[0] = c.read<float>();
            vb.weight[1] = c.read<float>();
            vb.weight[2] = c.read<float>();
            vb.weight[3] = c.read<float>();
            break;
        }
        case 3: {  // SDEF: BDEF2 と同じ重み + 追加 SDEF 行列 (今はウェイトだけ採用)
            vb.bone[0] = c.read_var_idx(boneIdxSize);
            vb.bone[1] = c.read_var_idx(boneIdxSize);
            float w = c.read<float>();
            vb.weight[0] = w;
            vb.weight[1] = 1.0f - w;
            c.skip(36);  // sdefC + sdefR0 + sdefR1 (3 * 3 float)
            break;
        }
        case 4: {  // QDEF (PMX 2.1)
            vb.bone[0] = c.read_var_idx(boneIdxSize);
            vb.bone[1] = c.read_var_idx(boneIdxSize);
            vb.bone[2] = c.read_var_idx(boneIdxSize);
            vb.bone[3] = c.read_var_idx(boneIdxSize);
            vb.weight[0] = c.read<float>();
            vb.weight[1] = c.read<float>();
            vb.weight[2] = c.read<float>();
            vb.weight[3] = c.read<float>();
            break;
        }
        default: c.ok = false; break;
        }
        c.skip(4);  // Edge scale (float)
    }
    if (!c.ok) { r.error = "PMX: vertex truncated"; return r; }

    // Indices
    std::uint32_t idxN = c.read<std::uint32_t>();
    std::vector<std::uint32_t> indices(idxN);
    for (std::uint32_t i = 0; i < idxN; ++i) {
        indices[i] = c.read_var_uidx(vtxIdxSize);
    }

    // Textures
    std::uint32_t texN = c.read<std::uint32_t>();
    std::vector<std::string> texPaths(texN);
    for (std::uint32_t t = 0; t < texN; ++t) {
        texPaths[t] = c.read_str(utf16le);
    }

    // Materials
    std::uint32_t matN = c.read<std::uint32_t>();
    std::vector<MaterialIR> mats;
    std::vector<std::uint32_t> matFaceN(matN);
    for (std::uint32_t m = 0; m < matN; ++m) {
        std::string name   = c.read_str(utf16le);
        std::string nameEn = c.read_str(utf16le); (void)nameEn;
        float diff[4];
        diff[0] = c.read<float>(); diff[1] = c.read<float>();
        diff[2] = c.read<float>(); diff[3] = c.read<float>();
        float spec[3];
        spec[0] = c.read<float>(); spec[1] = c.read<float>(); spec[2] = c.read<float>();
        float power = c.read<float>();
        float ambi[3];
        ambi[0] = c.read<float>(); ambi[1] = c.read<float>(); ambi[2] = c.read<float>();
        std::uint8_t drawFlag = c.read<std::uint8_t>(); (void)drawFlag;
        float edgeColor[4]; for (int k = 0; k < 4; ++k) edgeColor[k] = c.read<float>();
        float edgeSize = c.read<float>();
        std::int32_t texIdx  = c.read_var_idx(texIdxSize);
        std::int32_t sphIdx  = c.read_var_idx(texIdxSize);
        std::uint8_t sphereMode = c.read<std::uint8_t>();
        std::uint8_t toonFlag = c.read<std::uint8_t>();
        std::int32_t toonTexIdx = -1;
        if (toonFlag == 0) toonTexIdx = c.read_var_idx(texIdxSize);
        else               toonTexIdx = c.read<std::uint8_t>();  // built-in 0..9
        std::string memo = c.read_str(utf16le); (void)memo;
        std::uint32_t faceVertN = c.read<std::uint32_t>();

        MaterialIR mat;
        mat.name = name.empty() ? ("mat" + std::to_string(m)) : name;
        mat.diffuse = {diff[0], diff[1], diff[2], diff[3]};
        mat.specular = {spec[0], spec[1], spec[2], 1.0f};
        mat.ambient  = {ambi[0], ambi[1], ambi[2], 1.0f};
        mat.power = power;
        auto push_tex = [&](const std::string &pp) -> int {
            if (pp.empty()) return -1;
            TextureIR t;
            auto slash = pp.find_last_of("/\\");
            t.name = (slash == std::string::npos) ? pp : pp.substr(slash + 1);
            t.color_path = pp;
            int idx = static_cast<int>(r.ir.textures.size());
            r.ir.textures.push_back(t);
            return idx;
        };
        if (texIdx >= 0 && static_cast<std::size_t>(texIdx) < texPaths.size()) {
            mat.diffuse_texture = push_tex(texPaths[texIdx]);
        }

        // Toon 情報: PMX はすべてトゥーン陰影前提 + edge outline
        mat.is_toon = true;
        mat.toon_outline_width = edgeSize;
        mat.toon_outline_color = {edgeColor[0], edgeColor[1], edgeColor[2], edgeColor[3]};
        // 外部 toon テクスチャがあれば diffuse grad として登録
        if (toonFlag == 0 && toonTexIdx >= 0 && static_cast<std::size_t>(toonTexIdx) < texPaths.size()) {
            mat.toon_diffuse_grad_texture = push_tex(texPaths[toonTexIdx]);
            mat.toon_diffuse_grad_blend   = 1;  // DX_MATERIAL_BLENDTYPE_TRANSLUCENT
        }
        // Sphere map
        if (sphereMode > 0 && sphIdx >= 0 && static_cast<std::size_t>(sphIdx) < texPaths.size()) {
            mat.toon_sphere_map_texture = push_tex(texPaths[sphIdx]);
            mat.toon_enable_sphere_map = 1;
            // sphereMode: 1=mul, 2=add, 3=subtex (PMX)
            mat.toon_sphere_map_blend = (sphereMode == 2) ? 2 /* ADDITIVE */ : 1 /* TRANSLUCENT */;
        }

        mats.push_back(mat);
        matFaceN[m] = faceVertN;
    }

    // Bones (PMX は豊富: parent/display/IK/physics 情報)
    std::uint32_t boneN = c.read<std::uint32_t>();
    std::vector<BoneIR> bones(boneN);
    for (std::uint32_t b = 0; b < boneN; ++b) {
        std::string name   = c.read_str(utf16le);
        std::string nameEn = c.read_str(utf16le); (void)nameEn;
        float pos[3]; pos[0] = c.read<float>(); pos[1] = c.read<float>(); pos[2] = c.read<float>();
        std::int32_t parent = c.read_var_idx(boneIdxSize);
        std::int32_t deform = c.read<std::int32_t>(); (void)deform;
        std::uint16_t flag = c.read<std::uint16_t>();

        bones[b].name = name.empty() ? ("bone" + std::to_string(b)) : name;
        bones[b].parent = parent;
        // PMX のボーン位置はモデル空間絶対、親相対は親位置引き算で求める
        if (parent >= 0 && static_cast<std::size_t>(parent) < bones.size()) {
            // Note: parent は必ず自分より小さい index (PMX 仕様)
            // 親の絶対位置を逆引きする必要があるが、ここではまず絶対位置で格納、
            // 後続のループで親を引く。
        }
        bones[b].translate[0] = pos[0];
        bones[b].translate[1] = pos[1];
        bones[b].translate[2] = pos[2];
        bones[b].quaternion[0] = 0; bones[b].quaternion[1] = 0; bones[b].quaternion[2] = 0; bones[b].quaternion[3] = 1;
        // inv_bind は単位行列で移動分を入れる (モデル→ボーン空間 = 並進 -pos)
        bones[b].inv_bind[0][0] = 1; bones[b].inv_bind[0][1] = 0; bones[b].inv_bind[0][2] = 0;
        bones[b].inv_bind[1][0] = 0; bones[b].inv_bind[1][1] = 1; bones[b].inv_bind[1][2] = 0;
        bones[b].inv_bind[2][0] = 0; bones[b].inv_bind[2][1] = 0; bones[b].inv_bind[2][2] = 1;
        bones[b].inv_bind[3][0] = -pos[0]; bones[b].inv_bind[3][1] = -pos[1]; bones[b].inv_bind[3][2] = -pos[2];

        // flag に応じた可変フィールドをスキップ
        if (flag & 0x0001) c.skip(boneIdxSize);               // 接続先=ボーン
        else               c.skip(12);                         // 接続先=オフセット float3
        if (flag & 0x0100) c.skip(boneIdxSize + 4);            // 回転付与
        if (flag & 0x0200) c.skip(boneIdxSize + 4);            // 移動付与
        if (flag & 0x0400) c.skip(12);                         // 軸固定
        if (flag & 0x0800) c.skip(24);                         // ローカル軸
        if (flag & 0x2000) c.skip(4);                          // 外部親
        if (flag & 0x0020) {                                   // IK
            c.skip(boneIdxSize + 4 + 4);
            std::uint32_t linkN = c.read<std::uint32_t>();
            for (std::uint32_t k = 0; k < linkN; ++k) {
                c.skip(boneIdxSize);
                std::uint8_t hasLimit = c.read<std::uint8_t>();
                if (hasLimit) c.skip(24);
            }
        }
    }

    // ボーンの絶対位置を親相対に変換
    for (std::uint32_t b = 0; b < boneN; ++b) {
        if (bones[b].parent >= 0 && static_cast<std::size_t>(bones[b].parent) < bones.size()) {
            // 元の pos (絶対) を覚えていないので、いったん全 bone の pos を absPos[] に退避
        }
    }
    // 親相対化: 一旦絶対位置を保持しておく必要があるので再計算
    std::vector<std::array<float, 3>> absPos(boneN);
    for (std::uint32_t b = 0; b < boneN; ++b) {
        absPos[b] = { bones[b].translate[0], bones[b].translate[1], bones[b].translate[2] };
    }
    for (std::uint32_t b = 0; b < boneN; ++b) {
        if (bones[b].parent >= 0) {
            auto p = absPos[bones[b].parent];
            bones[b].translate[0] = absPos[b][0] - p[0];
            bones[b].translate[1] = absPos[b][1] - p[1];
            bones[b].translate[2] = absPos[b][2] - p[2];
        }
    }

    if (!c.ok) { r.error = "PMX: parse truncated mid-bone"; return r; }

    // マテリアル境界でメッシュ分割
    std::size_t idxOff = 0;
    for (std::uint32_t m = 0; m < matN; ++m) {
        std::uint32_t fc = matFaceN[m];
        if (fc == 0) continue;
        MeshIR mesh;
        mesh.name = "mesh" + std::to_string(m);
        mesh.material = static_cast<int>(m);
        std::vector<std::int32_t> remap(vertN, -1);
        for (std::uint32_t k = 0; k < fc; ++k) {
            std::uint32_t sv = indices[idxOff + k];
            if (sv >= vertN) continue;
            if (remap[sv] < 0) {
                remap[sv] = static_cast<std::int32_t>(mesh.positions.size() / 3);
                mesh.positions.push_back(positions[sv*3+0]);
                mesh.positions.push_back(positions[sv*3+1]);
                mesh.positions.push_back(positions[sv*3+2]);
                mesh.normals.push_back(normals[sv*3+0]);
                mesh.normals.push_back(normals[sv*3+1]);
                mesh.normals.push_back(normals[sv*3+2]);
                mesh.uvs.push_back(uvs[sv*2+0]);
                mesh.uvs.push_back(uvs[sv*2+1]);
                mesh.bone_weights.push_back(weights[sv]);
            }
            mesh.indices.push_back(static_cast<std::uint32_t>(remap[sv]));
        }
        idxOff += fc;
        r.ir.meshes.push_back(std::move(mesh));
    }

    if (r.ir.meshes.empty()) { r.error = "PMX: no usable meshes"; return r; }
    r.ir.materials = std::move(mats);
    r.ir.bones     = std::move(bones);

    // ========== Morphs (表情) 読み込み (skip、ただし physics section まで到達する必要あり) ==========
    if (c.ok) {
        std::uint32_t morphN = c.read<std::uint32_t>();
        for (std::uint32_t mo = 0; mo < morphN && c.ok; ++mo) {
            c.read_str(utf16le); c.read_str(utf16le);  // name, nameEn
            c.skip(1);  // panel
            std::uint8_t morphType = c.read<std::uint8_t>();
            std::uint32_t offN = c.read<std::uint32_t>();
            for (std::uint32_t k = 0; k < offN && c.ok; ++k) {
                switch (morphType) {
                case 0:  // group
                    c.skip(morphIdxSize + 4); break;
                case 1:  // vertex
                    c.skip(vtxIdxSize + 12); break;
                case 2:  // bone
                    c.skip(boneIdxSize + 12 + 16); break;
                case 3:  // uv / 4-7: additional UV
                case 4: case 5: case 6: case 7:
                    c.skip(vtxIdxSize + 16); break;
                case 8:  // material
                    c.skip(matIdxSize + 1 + 16 + 16 + 12 + 4 + 16 + 4 + 16 + 16 + 16); break;
                case 9:  // flip
                    c.skip(morphIdxSize + 4); break;
                case 10: // impulse
                    c.skip(rbIdxSize + 1 + 12 + 12); break;
                default:
                    c.ok = false; break;
                }
            }
        }
    }
    // Display frames (skip)
    if (c.ok) {
        std::uint32_t disp = c.read<std::uint32_t>();
        for (std::uint32_t d = 0; d < disp && c.ok; ++d) {
            c.read_str(utf16le); c.read_str(utf16le);
            c.skip(1);  // special flag
            std::uint32_t elemN = c.read<std::uint32_t>();
            for (std::uint32_t e = 0; e < elemN && c.ok; ++e) {
                std::uint8_t kind = c.read<std::uint8_t>();
                if (kind == 0) c.skip(boneIdxSize);
                else           c.skip(morphIdxSize);
            }
        }
    }

    // ========== Rigid Bodies ==========
    if (c.ok) {
        std::uint32_t rbN = c.read<std::uint32_t>();
        r.ir.physics_rigid_bodies.reserve(rbN);
        for (std::uint32_t i = 0; i < rbN && c.ok; ++i) {
            ModelIR::PhysicsRigidBodyIR rb;
            rb.name = c.read_str(utf16le);
            c.read_str(utf16le);  // nameEn
            rb.target_bone = c.read_var_idx(boneIdxSize);
            rb.group_index = c.read<std::uint8_t>();
            rb.group_target = c.read<std::uint16_t>();
            rb.shape_type = c.read<std::uint8_t>();
            rb.shape_w = c.read<float>();
            rb.shape_h = c.read<float>();
            rb.shape_d = c.read<float>();
            rb.position[0] = c.read<float>(); rb.position[1] = c.read<float>(); rb.position[2] = c.read<float>();
            rb.rotation[0] = c.read<float>(); rb.rotation[1] = c.read<float>(); rb.rotation[2] = c.read<float>();
            rb.weight   = c.read<float>();
            rb.pos_dim  = c.read<float>();
            rb.rot_dim  = c.read<float>();
            rb.recoil   = c.read<float>();
            rb.friction = c.read<float>();
            rb.body_type = c.read<std::uint8_t>();
            r.ir.physics_rigid_bodies.push_back(std::move(rb));
        }
    }

    // ========== Joints ==========
    if (c.ok) {
        std::uint32_t jN = c.read<std::uint32_t>();
        r.ir.physics_joints.reserve(jN);
        for (std::uint32_t i = 0; i < jN && c.ok; ++i) {
            ModelIR::PhysicsJointIR jt;
            jt.name = c.read_str(utf16le);
            c.read_str(utf16le);  // nameEn
            std::uint8_t kind = c.read<std::uint8_t>();
            (void)kind;  // 0=Spring6DOF only
            jt.rigid_a = c.read_var_idx(rbIdxSize);
            jt.rigid_b = c.read_var_idx(rbIdxSize);
            jt.position[0]=c.read<float>(); jt.position[1]=c.read<float>(); jt.position[2]=c.read<float>();
            jt.rotation[0]=c.read<float>(); jt.rotation[1]=c.read<float>(); jt.rotation[2]=c.read<float>();
            jt.constrain_pos_1[0]=c.read<float>(); jt.constrain_pos_1[1]=c.read<float>(); jt.constrain_pos_1[2]=c.read<float>();
            jt.constrain_pos_2[0]=c.read<float>(); jt.constrain_pos_2[1]=c.read<float>(); jt.constrain_pos_2[2]=c.read<float>();
            jt.constrain_rot_1[0]=c.read<float>(); jt.constrain_rot_1[1]=c.read<float>(); jt.constrain_rot_1[2]=c.read<float>();
            jt.constrain_rot_2[0]=c.read<float>(); jt.constrain_rot_2[1]=c.read<float>(); jt.constrain_rot_2[2]=c.read<float>();
            jt.spring_pos[0]=c.read<float>(); jt.spring_pos[1]=c.read<float>(); jt.spring_pos[2]=c.read<float>();
            jt.spring_rot[0]=c.read<float>(); jt.spring_rot[1]=c.read<float>(); jt.spring_rot[2]=c.read<float>();
            r.ir.physics_joints.push_back(std::move(jt));
        }
    }
    // 失敗しても warning 的扱いで継続 (メッシュは既に確保済みのため)

    return r;
}

}
