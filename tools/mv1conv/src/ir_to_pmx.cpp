// IR → PMX 2.0 バイト列エンコーダ
// 参考仕様: MMD wiki + PMX 2.0 Editor Spec Sheet + Blender MMD Tools

#include "ir_to_pmx.hpp"
#include <cstring>

namespace mv1conv {

namespace {

// ---- 低レベル writer ----

inline void put_u8(std::vector<std::uint8_t> &out, std::uint8_t v) {
    out.push_back(v);
}

inline void put_u16le(std::vector<std::uint8_t> &out, std::uint16_t v) {
    out.push_back(static_cast<std::uint8_t>(v & 0xFF));
    out.push_back(static_cast<std::uint8_t>((v >> 8) & 0xFF));
}

inline void put_i32le(std::vector<std::uint8_t> &out, std::int32_t v) {
    const std::uint32_t u = static_cast<std::uint32_t>(v);
    out.push_back(static_cast<std::uint8_t>(u & 0xFF));
    out.push_back(static_cast<std::uint8_t>((u >> 8) & 0xFF));
    out.push_back(static_cast<std::uint8_t>((u >> 16) & 0xFF));
    out.push_back(static_cast<std::uint8_t>((u >> 24) & 0xFF));
}

inline void put_u32le(std::vector<std::uint8_t> &out, std::uint32_t v) {
    put_i32le(out, static_cast<std::int32_t>(v));
}

inline void put_float(std::vector<std::uint8_t> &out, float f) {
    std::uint32_t bits;
    std::memcpy(&bits, &f, 4);
    put_u32le(out, bits);
}

inline void put_vec2(std::vector<std::uint8_t> &out, float a, float b) {
    put_float(out, a);
    put_float(out, b);
}

inline void put_vec3(std::vector<std::uint8_t> &out, float a, float b, float c) {
    put_float(out, a);
    put_float(out, b);
    put_float(out, c);
}

inline void put_vec4(std::vector<std::uint8_t> &out, float a, float b, float c, float d) {
    put_float(out, a);
    put_float(out, b);
    put_float(out, c);
    put_float(out, d);
}

// TextField (encoding=UTF-8): i32 byte_len + bytes
inline void put_text_utf8(std::vector<std::uint8_t> &out, const std::string &s) {
    put_i32le(out, static_cast<std::int32_t>(s.size()));
    out.insert(out.end(), s.begin(), s.end());
}

// ---- 実エンコード ----

constexpr int VERTEX_IDX_SIZE   = 4;  // i32
constexpr int TEXTURE_IDX_SIZE  = 4;
constexpr int MATERIAL_IDX_SIZE = 4;
constexpr int BONE_IDX_SIZE     = 4;
constexpr int MORPH_IDX_SIZE    = 4;
constexpr int RIGID_IDX_SIZE    = 4;

// Bone index (signed). PMX の bone_idx は -1 許容 (親なし等)。
inline void put_bone_idx(std::vector<std::uint8_t> &out, std::int32_t v) { put_i32le(out, v); }
inline void put_mat_idx(std::vector<std::uint8_t> &out, std::int32_t v)  { put_i32le(out, v); }
inline void put_tex_idx(std::vector<std::uint8_t> &out, std::int32_t v)  { put_i32le(out, v); }
inline void put_vert_idx(std::vector<std::uint8_t> &out, std::uint32_t v) { put_u32le(out, v); }

} // anonymous

std::vector<std::uint8_t> ir_to_pmx(const ModelIR &ir, std::string *err_msg) {
    std::vector<std::uint8_t> out;
    out.reserve(4096);

    // ---- Header ----
    out.push_back('P'); out.push_back('M'); out.push_back('X'); out.push_back(' ');
    put_float(out, 2.0f);
    put_u8(out, 8);                      // globals count
    put_u8(out, 1);                      // [0] encoding: UTF-8
    put_u8(out, 0);                      // [1] additional UV count
    put_u8(out, VERTEX_IDX_SIZE);
    put_u8(out, TEXTURE_IDX_SIZE);
    put_u8(out, MATERIAL_IDX_SIZE);
    put_u8(out, BONE_IDX_SIZE);
    put_u8(out, MORPH_IDX_SIZE);
    put_u8(out, RIGID_IDX_SIZE);

    // ---- Model Info ----
    put_text_utf8(out, "mv1conv_model");  // name_jp
    put_text_utf8(out, "mv1conv_model");  // name_en
    put_text_utf8(out, "");               // comment_jp
    put_text_utf8(out, "");               // comment_en

    // ---- Vertex list ----
    // IR は mesh 単位だが PMX は global vertex buffer。mesh_base_vertex[i] で変換。
    std::vector<std::int32_t> mesh_base_vertex(ir.meshes.size(), 0);
    std::int32_t total_vertex_count = 0;
    for (std::size_t i = 0; i < ir.meshes.size(); ++i) {
        mesh_base_vertex[i] = total_vertex_count;
        total_vertex_count += static_cast<std::int32_t>(ir.meshes[i].positions.size() / 3);
    }
    put_i32le(out, total_vertex_count);

    const bool has_bones = !ir.bones.empty();
    for (std::size_t mi = 0; mi < ir.meshes.size(); ++mi) {
        const auto &m = ir.meshes[mi];
        const std::size_t vcount = m.positions.size() / 3;
        const bool mesh_has_weight = has_bones && !m.bone_weights.empty();
        for (std::size_t v = 0; v < vcount; ++v) {
            // position
            put_vec3(out, m.positions[v*3+0], m.positions[v*3+1], m.positions[v*3+2]);
            // normal
            if (!m.normals.empty()) {
                put_vec3(out, m.normals[v*3+0], m.normals[v*3+1], m.normals[v*3+2]);
            } else {
                put_vec3(out, 0.0f, 1.0f, 0.0f);
            }
            // uv
            if (!m.uvs.empty()) {
                put_vec2(out, m.uvs[v*2+0], m.uvs[v*2+1]);
            } else {
                put_vec2(out, 0.0f, 0.0f);
            }
            // weight
            if (mesh_has_weight && v < m.bone_weights.size()) {
                const auto &bw = m.bone_weights[v];
                // 有効 bone 数カウント
                int nvalid = 0;
                for (int k = 0; k < 4; ++k) {
                    if (bw.bone[k] >= 0 && bw.weight[k] > 0.0f) ++nvalid;
                }
                if (nvalid == 0) {
                    // BDEF1 to bone 0
                    put_u8(out, 0);
                    put_bone_idx(out, 0);
                } else if (nvalid == 1) {
                    // BDEF1
                    put_u8(out, 0);
                    int first = 0;
                    for (int k = 0; k < 4; ++k) if (bw.bone[k] >= 0 && bw.weight[k] > 0.0f) { first = k; break; }
                    put_bone_idx(out, bw.bone[first]);
                } else {
                    // BDEF4 (weight 2 でも BDEF4 で統一、PMX loader は許容)
                    put_u8(out, 2);
                    for (int k = 0; k < 4; ++k) {
                        put_bone_idx(out, bw.bone[k] >= 0 ? bw.bone[k] : 0);
                    }
                    for (int k = 0; k < 4; ++k) {
                        put_float(out, bw.weight[k] > 0.0f ? bw.weight[k] : 0.0f);
                    }
                }
            } else {
                // 静的メッシュ: BDEF1 to bone 0 (root)
                put_u8(out, 0);
                put_bone_idx(out, 0);
            }
            // edge ratio
            put_float(out, 1.0f);
        }
    }

    // ---- Face list ----
    // 全 mesh の index を global vertex index に変換してから書く
    std::int32_t total_face_verts = 0;
    for (const auto &m : ir.meshes) total_face_verts += static_cast<std::int32_t>(m.indices.size());
    put_i32le(out, total_face_verts);
    for (std::size_t mi = 0; mi < ir.meshes.size(); ++mi) {
        const auto &m = ir.meshes[mi];
        const std::uint32_t base = static_cast<std::uint32_t>(mesh_base_vertex[mi]);
        for (std::uint32_t idx : m.indices) {
            put_vert_idx(out, base + idx);
        }
    }

    // ---- Texture list ----
    put_i32le(out, static_cast<std::int32_t>(ir.textures.size()));
    for (const auto &tex : ir.textures) {
        put_text_utf8(out, tex.color_path);
    }

    // ---- Material list ----
    // IR の MaterialIR は mesh に共有される。PMX は material ごとに face_vertex_count を
    // 持つので、mesh を material で group 化し、その face 数を材質の face_vertex_count に。
    // 初期版: 1 material = 1 entry、その face_vertex_count はこの material を参照する
    // 全 mesh の indices 合計。
    std::vector<std::int32_t> mat_face_verts(ir.materials.size(), 0);
    for (const auto &m : ir.meshes) {
        if (m.material >= 0 && m.material < static_cast<int>(ir.materials.size())) {
            mat_face_verts[m.material] += static_cast<std::int32_t>(m.indices.size());
        }
    }
    // material 無しの mesh がある場合のために、material が空なら 1 個 default を追加
    if (ir.materials.empty()) {
        // 1 default material を emit
        put_i32le(out, 1);
        put_text_utf8(out, "default");
        put_text_utf8(out, "default");
        put_vec4(out, 0.8f, 0.8f, 0.8f, 1.0f);       // diffuse
        put_vec3(out, 0.0f, 0.0f, 0.0f);             // specular
        put_float(out, 5.0f);                         // specular_power
        put_vec3(out, 0.2f, 0.2f, 0.2f);             // ambient
        put_u8(out, 0x01);                            // flag: double-sided
        put_vec4(out, 0.0f, 0.0f, 0.0f, 1.0f);       // edge color
        put_float(out, 1.0f);                         // edge size
        put_tex_idx(out, -1);                         // diffuse_tex
        put_tex_idx(out, -1);                         // sphere_tex
        put_u8(out, 0);                               // sphere mode: disable
        put_u8(out, 1);                               // toon ref: internal
        put_u8(out, 0);                               // internal toon 0
        put_text_utf8(out, "");                       // memo
        put_i32le(out, total_face_verts);             // face_vertex_count = 全 face
    } else {
        put_i32le(out, static_cast<std::int32_t>(ir.materials.size()));
        for (std::size_t i = 0; i < ir.materials.size(); ++i) {
            const auto &mat = ir.materials[i];
            put_text_utf8(out, mat.name.empty() ? "material" : mat.name);
            put_text_utf8(out, mat.name.empty() ? "material" : mat.name);
            put_vec4(out, mat.diffuse[0], mat.diffuse[1], mat.diffuse[2], mat.diffuse[3]);
            put_vec3(out, mat.specular[0], mat.specular[1], mat.specular[2]);
            put_float(out, mat.power);
            put_vec3(out, mat.ambient[0], mat.ambient[1], mat.ambient[2]);
            put_u8(out, 0x01);  // flag: double-sided
            put_vec4(out, 0.0f, 0.0f, 0.0f, 1.0f);   // edge color
            put_float(out, 1.0f);                     // edge size
            put_tex_idx(out, mat.diffuse_texture);    // diffuse tex (-1 許容)
            put_tex_idx(out, mat.sphere_texture);     // sphere tex
            put_u8(out, static_cast<std::uint8_t>(mat.sphere_mode));  // sphere mode
            // toon: ref=0 なら tex_idx (4B)、ref=1 なら u8 internal index
            put_u8(out, static_cast<std::uint8_t>(mat.pmx_toon_ref));
            if (mat.pmx_toon_ref == 0) {
                put_tex_idx(out, mat.pmx_toon_texture);
            } else {
                put_u8(out, static_cast<std::uint8_t>(mat.pmx_toon_internal));
            }
            put_text_utf8(out, "");                   // memo
            put_i32le(out, mat_face_verts[i]);        // face_vertex_count
        }
    }

    // ---- Bone list ----
    // IR.bones が空なら PMX は最低 1 bone 必要 (root) → 自動追加。
    // 非空なら IR の bone をそのまま出力。
    if (ir.bones.empty()) {
        put_i32le(out, 1);
        put_text_utf8(out, "root");
        put_text_utf8(out, "root");
        put_vec3(out, 0.0f, 0.0f, 0.0f);    // position
        put_bone_idx(out, -1);               // parent
        put_i32le(out, 0);                   // layer
        // flag: 0x0002 rotate + 0x0004 translate + 0x0008 visible + 0x0010 enabled
        put_u16le(out, 0x001E);
        // tail offset (connect bit=0): vec3 offset
        put_vec3(out, 0.0f, 0.0f, 0.0f);
    } else {
        put_i32le(out, static_cast<std::int32_t>(ir.bones.size()));
        for (const auto &b : ir.bones) {
            put_text_utf8(out, b.name.empty() ? "bone" : b.name);
            put_text_utf8(out, b.name.empty() ? "bone" : b.name);
            // IR.translate は parent-relative。PMX.position は world。
            // IR からの world 変換は後で。とりあえず translate を position に。
            // TODO: 正確には parent.position + translate の再帰累積。
            put_vec3(out, b.translate[0], b.translate[1], b.translate[2]);
            put_bone_idx(out, b.parent);
            put_i32le(out, 0);               // layer
            put_u16le(out, 0x001E);          // flag: rotate+translate+visible+enabled
            put_vec3(out, 0.0f, 0.0f, 0.0f); // tail offset
        }
    }

    // ---- Morph list ----
    // IR.shapes を vertex morph として出力。
    // 各 ShapeVertexIR.target_mesh_vertex は mesh local index、
    // PMX 側は global idx (mesh_base_vertex[mesh_idx] + local) が必要。
    put_i32le(out, static_cast<std::int32_t>(ir.shapes.size()));
    for (const auto &sh : ir.shapes) {
        put_text_utf8(out, sh.name.empty() ? "morph" : sh.name);
        put_text_utf8(out, sh.name.empty() ? "morph" : sh.name);
        put_u8(out, 4);   // panel: 4=other (PMD 表情分類は無いので汎用)
        put_u8(out, 1);   // type: 1=vertex morph
        // offset count 計算
        std::int32_t offset_count = 0;
        for (const auto &sm : sh.meshes) offset_count += static_cast<std::int32_t>(sm.vertices.size());
        put_i32le(out, offset_count);
        for (const auto &sm : sh.meshes) {
            if (sm.target_mesh >= mesh_base_vertex.size()) continue;
            const std::uint32_t base = static_cast<std::uint32_t>(mesh_base_vertex[sm.target_mesh]);
            for (const auto &sv : sm.vertices) {
                put_vert_idx(out, base + sv.target_mesh_vertex);
                put_vec3(out, sv.dp[0], sv.dp[1], sv.dp[2]);
            }
        }
    }

    // ---- Display frame list ----
    // 最小構成: root / 通常 frame 各 1 個
    put_i32le(out, 2);

    // Special frame 1: "Root" (flag=1)
    put_text_utf8(out, "Root");
    put_text_utf8(out, "Root");
    put_u8(out, 1);     // special
    put_i32le(out, 1);  // 1 element
    put_u8(out, 0);     // type: bone
    put_bone_idx(out, 0);

    // Normal frame 2: "表情" (flag=1 for expression/morph root, but PMX docs say
    // 表情 frame も special=1 と morph を含む。初期版は空の morph frame)
    put_text_utf8(out, "exp");
    put_text_utf8(out, "exp");
    put_u8(out, 1);     // special (PMX 2.0 仕様で 2nd frame も 1)
    put_i32le(out, 0);  // 0 elements

    // ---- RigidBody list ---- (初期版は空)
    put_i32le(out, 0);

    // ---- Joint list ---- (初期版は空)
    put_i32le(out, 0);

    // PMX 2.0 なので SoftBody section なし

    if (err_msg) err_msg->clear();
    return out;
}

} // namespace mv1conv
