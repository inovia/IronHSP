#include "mv1_to_ir.hpp"
#include "mv1_reader.hpp"
#include "mv1_f1.hpp"
#include "mv1_enums.hpp"
#include <algorithm>
#include <cstring>
#include <string>
#include <unordered_map>

namespace mv1conv {

namespace {

// Frame.PositionAndNormalData → (positions, normals) 展開 (obj_export からの流用)。
struct FrameVerts {
    std::vector<float> pos;     // 3 × PositionNum
    std::vector<float> nrm;     // 3 × NormalNum、normal 無しなら空
    std::vector<VertexBone> weights;  // PositionNum 個 (skin 時のみ)
};

FrameVerts decode_frame_verts(const Mv1File &f, const f1::MV1_FRAME_F1 &fr) {
    FrameVerts out;
    if (fr.PositionAndNormalData == 0 || fr.PositionNum <= 0) return out;
    const std::uint8_t *p = f.buffer().data() + fr.PositionAndNormalData;
    const std::uint8_t *end = f.buffer().data() + f.buffer().size();

    const bool pos16   = (fr.VertFlag & e::FRAME_VERT_FLAG_POSITION_B16) != 0;
    const bool wNone   = (fr.VertFlag & e::FRAME_VERT_FLAG_MATRIX_WEIGHT_NONE) != 0;
    const std::uint16_t nType = fr.VertFlag & e::FRAME_VERT_FLAG_NORMAL_TYPE_MASK;

    float subMin[3] = {0,0,0}, subWidth[3] = {0,0,0};
    if (pos16) {
        if (p + 24 > end) return out;
        std::memcpy(&subMin[0],   p + 0,  4); std::memcpy(&subWidth[0], p + 4,  4);
        std::memcpy(&subMin[1],   p + 8,  4); std::memcpy(&subWidth[1], p + 12, 4);
        std::memcpy(&subMin[2],   p + 16, 4); std::memcpy(&subWidth[2], p + 20, 4);
        p += 24;
    }

    out.pos.resize(static_cast<std::size_t>(fr.PositionNum) * 3);
    for (int i = 0; i < fr.PositionNum; ++i) {
        if (pos16) {
            if (p + 6 > end) { out.pos.clear(); return out; }
            std::uint16_t wx, wy, wz;
            std::memcpy(&wx, p + 0, 2); std::memcpy(&wy, p + 2, 2); std::memcpy(&wz, p + 4, 2);
            out.pos[i*3+0] = subMin[0] + (wx / 60000.0f) * subWidth[0];
            out.pos[i*3+1] = subMin[1] + (wy / 60000.0f) * subWidth[1];
            out.pos[i*3+2] = subMin[2] + (wz / 60000.0f) * subWidth[2];
            p += 6;
        } else {
            if (p + 12 > end) { out.pos.clear(); return out; }
            std::memcpy(&out.pos[i*3+0], p + 0, 4);
            std::memcpy(&out.pos[i*3+1], p + 4, 4);
            std::memcpy(&out.pos[i*3+2], p + 8, 4);
            p += 12;
        }
    }

    // Skin weights
    if (!wNone) {
        const bool idxU16 = (fr.VertFlag & e::FRAME_VERT_FLAG_MATRIX_INDEX_MASK) != 0;
        const bool wtU16  = (fr.VertFlag & e::FRAME_VERT_FLAG_MATRIX_WEIGHT_MASK) != 0;
        const std::size_t idxSz = idxU16 ? 2u : 1u;
        const std::size_t wtSz  = wtU16  ? 2u : 1u;
        out.weights.resize(fr.PositionNum);
        for (int i = 0; i < fr.PositionNum; ++i) {
            VertexBone vb;
            int slot = 0;
            for (int b = 0; b < fr.MaxBoneBlendNum && slot < 4; ++b) {
                if (p + idxSz > end) return out;
                std::int32_t idx;
                if (idxU16) {
                    std::uint16_t v; std::memcpy(&v, p, 2); p += 2;
                    idx = (v == 0xFFFFu) ? -1 : v;
                } else {
                    idx = (*p == 0xFFu) ? -1 : *p;
                    p++;
                }
                if (idx < 0) break;
                if (p + wtSz > end) return out;
                float w;
                if (wtU16) {
                    std::uint16_t v; std::memcpy(&v, p, 2); p += 2;
                    w = v / 65535.0f;
                } else {
                    w = *p / 255.0f; p++;
                }
                vb.bone[slot] = idx;
                vb.weight[slot] = w;
                ++slot;
            }
            out.weights[i] = vb;
        }
    }

    // Normals
    if (nType != e::FRAME_NORMAL_TYPE_NONE && fr.NormalNum > 0) {
        const bool hasTB = (fr.VertFlag & e::FRAME_VERT_FLAG_NT_BINORMAL) != 0;
        const int setsPerVertex = hasTB ? 3 : 1;
        out.nrm.resize(static_cast<std::size_t>(fr.NormalNum) * 3);
        for (int i = 0; i < fr.NormalNum; ++i) {
            for (int s = 0; s < setsPerVertex; ++s) {
                float n[3];
                switch (nType) {
                case e::FRAME_NORMAL_TYPE_S8:
                    if (p + 3 > end) return out;
                    n[0] = static_cast<std::int8_t>(p[0]) / 127.0f;
                    n[1] = static_cast<std::int8_t>(p[1]) / 127.0f;
                    n[2] = static_cast<std::int8_t>(p[2]) / 127.0f;
                    p += 3;
                    break;
                case e::FRAME_NORMAL_TYPE_S16:
                    if (p + 6 > end) return out;
                    {
                        std::int16_t v[3]; std::memcpy(v, p, 6);
                        n[0] = v[0] / 32767.0f;
                        n[1] = v[1] / 32767.0f;
                        n[2] = v[2] / 32767.0f;
                    }
                    p += 6;
                    break;
                case e::FRAME_NORMAL_TYPE_F32:
                    if (p + 12 > end) return out;
                    std::memcpy(n, p, 12); p += 12;
                    break;
                default: return out;
                }
                if (s == 0) {
                    out.nrm[i*3+0] = n[0];
                    out.nrm[i*3+1] = n[1];
                    out.nrm[i*3+2] = n[2];
                }
            }
        }
    }

    return out;
}

// Mesh.VertexData → (posIdx, nrmIdx, uv)
struct MeshVData {
    std::vector<std::uint32_t> posIdx;
    std::vector<std::uint32_t> nrmIdx;
    std::vector<float>         uv;
};

std::uint32_t read_idx(const std::uint8_t *&p, std::uint32_t type, const std::uint8_t *end) {
    switch (type) {
    case e::MESH_VERT_INDEX_TYPE_U8:
        if (p + 1 > end) return 0; return *p++;
    case e::MESH_VERT_INDEX_TYPE_U16:
        if (p + 2 > end) return 0;
        { std::uint16_t w; std::memcpy(&w, p, 2); p += 2; return w; }
    case e::MESH_VERT_INDEX_TYPE_U32:
        if (p + 4 > end) return 0;
        { std::uint32_t v; std::memcpy(&v, p, 4); p += 4; return v; }
    }
    return 0;
}

MeshVData decode_mesh_vdata(const Mv1File &f, const f1::MV1_MESH_F1 &m) {
    MeshVData out;
    if (m.VertexData == 0 || m.VertexNum <= 0) return out;
    const std::uint8_t *p = f.buffer().data() + m.VertexData;
    const std::uint8_t *end = f.buffer().data() + f.buffer().size();

    const std::uint32_t posT = m.VertFlag & e::MESH_VERT_FLAG_POS_IND_TYPE_MASK;
    const std::uint32_t nrmT = (m.VertFlag & e::MESH_VERT_FLAG_NRM_IND_TYPE_MASK) >> 2;
    const bool commonColor = (m.VertFlag & e::MESH_VERT_FLAG_COMMON_COLOR) != 0;
    const bool uvU16       = (m.VertFlag & e::MESH_VERT_FLAG_UV_U16) != 0;
    const bool nonToon     = (m.VertFlag & e::MESH_VERT_FLAG_NON_TOON_OUTLINE) != 0;

    if (commonColor) { if (p + 8 > end) return out; p += 8; }

    out.posIdx.reserve(m.VertexNum);
    for (int i = 0; i < m.VertexNum; ++i) out.posIdx.push_back(read_idx(p, posT, end));

    if (nrmT != e::MESH_VERT_INDEX_TYPE_NONE) {
        out.nrmIdx.reserve(m.VertexNum);
        for (int i = 0; i < m.VertexNum; ++i) out.nrmIdx.push_back(read_idx(p, nrmT, end));
    }

    if (!commonColor) {
        if (p + 8 * static_cast<std::size_t>(m.VertexNum) > end) return out;
        p += 8 * static_cast<std::size_t>(m.VertexNum);
    }

    const int uvSetCount = m.UVSetUnitNum;
    const int uvCompCount = m.UVUnitNum;
    out.uv.resize(static_cast<std::size_t>(m.VertexNum) * 2);
    for (int i = 0; i < m.VertexNum; ++i) {
        float firstUV[2] = {0,0};
        for (int s = 0; s < uvSetCount; ++s) {
            for (int c = 0; c < uvCompCount; ++c) {
                if (uvU16) {
                    if (p + 2 > end) return out;
                    std::uint16_t v; std::memcpy(&v, p, 2); p += 2;
                    if (s == 0 && c < 2) firstUV[c] = v / 65535.0f;
                } else {
                    if (p + 4 > end) return out;
                    float v; std::memcpy(&v, p, 4); p += 4;
                    if (s == 0 && c < 2) firstUV[c] = v;
                }
            }
        }
        out.uv[i*2+0] = firstUV[0];
        out.uv[i*2+1] = firstUV[1];
    }

    if (nonToon) {
        std::size_t bytes = (static_cast<std::size_t>(m.VertexNum) + 7) / 8;
        if (p + bytes > end) return out;
    }
    return out;
}

// TriangleList の index blob から「(mesh 頂点) triangle index 列」を取り出す
std::vector<std::uint32_t> decode_tl_triangles(
    const Mv1File &f, const f1::MV1_TRIANGLE_LIST_F1 &tl)
{
    std::vector<std::uint32_t> result;
    if (tl.MeshVertexIndexAndIndexData == 0 || tl.IndexNum == 0 || tl.VertexNum == 0) return result;
    const std::uint8_t *p = f.buffer().data() + tl.MeshVertexIndexAndIndexData;
    const std::uint8_t *end = f.buffer().data() + f.buffer().size();

    if (tl.VertexType == e::VERTEX_TYPE_SKIN_4BONE || tl.VertexType == e::VERTEX_TYPE_SKIN_8BONE) {
        if (p + 2 > end) return result;
        std::uint16_t useBoneNum; std::memcpy(&useBoneNum, p, 2); p += 2;
        if (p + 2 * useBoneNum > end) return result;
        p += 2 * useBoneNum;
    } else if (tl.VertexType == e::VERTEX_TYPE_SKIN_FREEBONE) {
        if (p + 2 > end) return result;
        p += 2;
    }

    std::uint16_t mIdxT = tl.Flag & e::TRILIST_FLAG_MVERT_INDEX_MASK;
    std::uint16_t iIdxT = (tl.Flag & e::TRILIST_FLAG_INDEX_MASK) >> 2;
    std::size_t mSz = 0, iSz = 0;
    switch (mIdxT) { case e::TRILIST_INDEX_TYPE_U8: mSz=1; break; case e::TRILIST_INDEX_TYPE_U16: mSz=2; break; case e::TRILIST_INDEX_TYPE_U32: mSz=4; break; }
    switch (iIdxT) { case e::TRILIST_INDEX_TYPE_U8: iSz=1; break; case e::TRILIST_INDEX_TYPE_U16: iSz=2; break; case e::TRILIST_INDEX_TYPE_U32: iSz=4; break; }

    auto readN = [&](std::size_t sz) -> std::uint32_t {
        if (p + sz > end) return 0;
        std::uint32_t v = 0;
        if (sz == 1) v = *p;
        else if (sz == 2) { std::uint16_t w; std::memcpy(&w, p, 2); v = w; }
        else { std::memcpy(&v, p, 4); }
        p += sz;
        return v;
    };

    // mesh vertex indices (VertexNum 個) — mesh.VertexData 内の index
    std::vector<std::uint32_t> tlToMesh(tl.VertexNum);
    for (int i = 0; i < tl.VertexNum; ++i) tlToMesh[i] = readN(mSz);

    // triangle indices (IndexNum 個) — tl.VertexNum 内の index
    result.resize(tl.IndexNum);
    for (int i = 0; i < tl.IndexNum; ++i) {
        std::uint32_t tlV = readN(iSz);
        result[i] = (tlV < tlToMesh.size()) ? tlToMesh[tlV] : 0;
    }
    return result;
}

// Animation 抽出: AnimSet / Anim / AnimKeySet を IR に移す
void extract_animations(const Mv1File &f, ModelIR &ir) {
    auto hdr = f.header();
    if (!hdr || hdr->AnimKeySetNum <= 0 || hdr->AnimNum <= 0 || hdr->AnimSetNum <= 0) return;
    ir.anim_original_keydata_size = hdr->OriginalAnimKeyDataSize;

    // AnimKeySet 配列 — raw passthrough (flag/blob をそのままコピー)。
    // 各 keyset の KeyData blob の長さは、次の keyset の KeyData offset との差で推定する。
    // 最後の keyset は (AnimKeyData 末尾 = AnimKeyData + AnimKeyDataSize) との差。
    std::vector<std::uint32_t> kdOffs(hdr->AnimKeySetNum);
    for (int i = 0; i < hdr->AnimKeySetNum; ++i) {
        const auto *ks = f.at<f1::MV1_ANIM_KEYSET_F1>(hdr->AnimKeySet + i * hdr->AnimKeySetUnitSize);
        kdOffs[i] = ks ? ks->KeyData : 0;
    }
    // sort(idx by offset) で隣接 keyset の blob size を算出
    std::vector<int> orderByOff(hdr->AnimKeySetNum);
    for (int i = 0; i < hdr->AnimKeySetNum; ++i) orderByOff[i] = i;
    std::sort(orderByOff.begin(), orderByOff.end(),
              [&](int a, int b) { return kdOffs[a] < kdOffs[b]; });
    std::vector<std::uint32_t> blobSize(hdr->AnimKeySetNum);
    for (std::size_t k = 0; k < orderByOff.size(); ++k) {
        int i = orderByOff[k];
        std::uint32_t next;
        if (k + 1 < orderByOff.size()) next = kdOffs[orderByOff[k + 1]];
        else next = hdr->AnimKeyData + hdr->AnimKeyDataSize;
        blobSize[i] = (next >= kdOffs[i]) ? (next - kdOffs[i]) : 0;
    }

    ir.anim_keysets.reserve(hdr->AnimKeySetNum);
    for (int i = 0; i < hdr->AnimKeySetNum; ++i) {
        const auto *ks = f.at<f1::MV1_ANIM_KEYSET_F1>(hdr->AnimKeySet + i * hdr->AnimKeySetUnitSize);
        if (!ks) return;
        AnimKeySetIR ki;
        ki.data_type = ks->DataType;
        ki.key_type  = ks->Type;
        ki.raw_flag  = ks->Flag;
        // blob をそのままコピー
        std::uint32_t bsz = blobSize[i];
        if (ks->KeyData + bsz <= f.buffer().size()) {
            ki.raw_blob.assign(f.buffer().data() + ks->KeyData,
                               f.buffer().data() + ks->KeyData + bsz);
        }
        ir.anim_keysets.push_back(std::move(ki));
    }

    // runtime sizes は AnimKeyData 領域合計から推定: 単純には hdr->OriginalAnimKeyDataSize
    // を全 keyset で等分...はできないので、keyset 毎の runtime size を正確に算出する。
    // 簡略: total_runtime = hdr->OriginalAnimKeyDataSize を全体で 1 つ保持し、writer に渡す。
    // (writer 側が raw_blob 合計サイズをそのまま AnimKeyDataSize に、runtime は OriginalAnimKeyDataSize
    //  をそのままコピー。)
    // 個別 runtime は 0 のままで OK (writer の raw mode が total を使う)。

    // Anim 配列 (KeySet array 先頭 offset 逆引きで keyset_indices を求める)
    ir.anims.reserve(hdr->AnimNum);
    for (int i = 0; i < hdr->AnimNum; ++i) {
        const auto *a = f.at<f1::MV1_ANIM_F1>(hdr->Anim + i * hdr->AnimUnitSize);
        if (!a) return;
        AnimIR an;
        an.target_frame_index = a->TargetFrameIndex;
        an.max_time = a->MaxTime;
        if (a->KeySetNum > 0 && a->KeySet >= hdr->AnimKeySet) {
            std::uint32_t firstIdx = (a->KeySet - hdr->AnimKeySet) / hdr->AnimKeySetUnitSize;
            for (int k = 0; k < a->KeySetNum; ++k) {
                an.keyset_indices.push_back(firstIdx + k);
            }
        }
        ir.anims.push_back(std::move(an));
    }

    // AnimSet 配列
    ir.anim_sets.reserve(hdr->AnimSetNum);
    for (int i = 0; i < hdr->AnimSetNum; ++i) {
        const auto *s = f.at<f1::MV1_ANIMSET_F1>(hdr->AnimSet + i * sizeof(f1::MV1_ANIMSET_F1));
        if (!s) return;
        AnimSetIR asIR;
        auto nm = f.name(s->Name);
        asIR.name = std::string(nm);
        asIR.max_time = s->MaxTime;
        asIR.flag = s->Flag;
        if (s->AnimNum > 0 && s->Anim >= hdr->Anim) {
            std::uint32_t firstIdx = (s->Anim - hdr->Anim) / hdr->AnimUnitSize;
            for (int a = 0; a < s->AnimNum; ++a) asIR.anim_indices.push_back(firstIdx + a);
        }
        ir.anim_sets.push_back(std::move(asIR));
    }
}

}  // namespace

LoadResult load_mv1_to_ir(const std::string &path) {
    LoadResult r;
    Mv1File f = Mv1File::load(path);
    if (!f.ok()) { r.error = "mv1: " + f.error(); return r; }
    auto hdr = f.header();
    if (!hdr) { r.error = "mv1: invalid header"; return r; }

    r.ir.right_hand = hdr->RightHandType != 0;

    // Materials
    r.ir.materials.reserve(hdr->MaterialNum);
    for (int i = 0; i < hdr->MaterialNum; ++i) {
        const auto *m = f.at<f1::MV1_MATERIAL_F1>(hdr->Material + i * sizeof(f1::MV1_MATERIAL_F1));
        if (!m) continue;
        MaterialIR mat;
        auto nm = f.name(m->Name);
        mat.name = std::string(nm);
        mat.diffuse  = { m->Diffuse.r,  m->Diffuse.g,  m->Diffuse.b,  m->Diffuse.a };
        mat.ambient  = { m->Ambient.r,  m->Ambient.g,  m->Ambient.b,  m->Ambient.a };
        mat.specular = { m->Specular.r, m->Specular.g, m->Specular.b, m->Specular.a };
        mat.emissive = { m->Emissive.r, m->Emissive.g, m->Emissive.b, m->Emissive.a };
        mat.power = m->Power;
        mat.alpha = m->Alpha;
        if (m->DiffuseLayerNum > 0) mat.diffuse_texture = m->DiffuseLayer[0].Texture;
        r.ir.materials.push_back(std::move(mat));
    }

    // Textures
    r.ir.textures.reserve(hdr->TextureNum);
    for (int i = 0; i < hdr->TextureNum; ++i) {
        const auto *t = f.at<f1::MV1_TEXTURE_F1>(hdr->Texture + i * sizeof(f1::MV1_TEXTURE_F1));
        if (!t) continue;
        TextureIR tx;
        tx.name = std::string(f.name(t->Name));
        tx.color_path = std::string(f.name(t->ColorFilePath));
        r.ir.textures.push_back(std::move(tx));
    }

    // Frames 走査 — skin フレームかどうかで bones / mesh frame を分類
    const bool hasSkin = hdr->SkinBoneNum > 0;

    // Frame 配列へのアクセス
    auto getFrame = [&](int idx) -> const f1::MV1_FRAME_F1 * {
        return f.at<f1::MV1_FRAME_F1>(hdr->Frame + idx * sizeof(f1::MV1_FRAME_F1));
    };

    // 各 frame の PandN を展開
    std::vector<FrameVerts> frameVerts(hdr->FrameNum);
    for (int i = 0; i < hdr->FrameNum; ++i) {
        auto fr = getFrame(i);
        if (!fr) continue;
        frameVerts[i] = decode_frame_verts(f, *fr);
    }

    // bones: skin 時のみ。root + mesh frames を飛ばして残りの frame を bone として収集
    // writer 側規約: skin 時 Frame[0]=root, Frame[1..M]=mesh frames, Frame[M+1..]=bones
    if (hasSkin) {
        r.ir.bones.reserve(hdr->SkinBoneNum);
        for (int i = 0; i < hdr->SkinBoneNum; ++i) {
            const auto *sb = f.at<f1::MV1_SKIN_BONE_F1>(hdr->SkinBone + i * sizeof(f1::MV1_SKIN_BONE_F1));
            if (!sb) continue;
            auto boneFrame = getFrame(sb->BoneFrame);
            if (!boneFrame) continue;
            BoneIR bir;
            bir.name = std::string(f.name(boneFrame->Name));
            bir.translate[0] = boneFrame->Translate.x;
            bir.translate[1] = boneFrame->Translate.y;
            bir.translate[2] = boneFrame->Translate.z;
            bir.scale[0] = boneFrame->Scale.x;
            bir.scale[1] = boneFrame->Scale.y;
            bir.scale[2] = boneFrame->Scale.z;
            bir.quaternion[0] = boneFrame->Quaternion.x;
            bir.quaternion[1] = boneFrame->Quaternion.y;
            bir.quaternion[2] = boneFrame->Quaternion.z;
            bir.quaternion[3] = boneFrame->Quaternion.w;
            // inv_bind matrix (4x3 row-major); SkinBone の ModelLocalMatrix は MATRIX_4X4CT_F
            std::memcpy(bir.inv_bind, &sb->ModelLocalMatrix, sizeof(bir.inv_bind));
            // parent: sb->BoneFrame の Frame->Parent から bone index を逆引き
            bir.parent = -1;
            // 他 SkinBone が BoneFrame の parent を指していれば、その bone を parent に
            if (boneFrame->Parent != 0) {
                for (int j = 0; j < hdr->SkinBoneNum; ++j) {
                    const auto *sb2 = f.at<f1::MV1_SKIN_BONE_F1>(hdr->SkinBone + j * sizeof(f1::MV1_SKIN_BONE_F1));
                    if (!sb2) continue;
                    std::uint32_t otherFrameOff = hdr->Frame + sb2->BoneFrame * sizeof(f1::MV1_FRAME_F1);
                    if (otherFrameOff == boneFrame->Parent) { bir.parent = j; break; }
                }
            }
            r.ir.bones.push_back(std::move(bir));
        }
    }

    // Meshes — 各 Mesh を 1 IR mesh にする。TriangleList の三角形を per-corner で展開
    r.ir.meshes.reserve(hdr->MeshNum);
    for (int mi = 0; mi < hdr->MeshNum; ++mi) {
        const auto *mm = f.at<f1::MV1_MESH_F1>(hdr->Mesh + mi * sizeof(f1::MV1_MESH_F1));
        if (!mm) continue;
        auto mvd = decode_mesh_vdata(f, *mm);

        // コンテナ frame (ここから PandN 取得)
        int containerFrameIdx = -1;
        for (int i = 0; i < hdr->FrameNum; ++i) {
            std::uint32_t frameOff = hdr->Frame + i * sizeof(f1::MV1_FRAME_F1);
            if (frameOff == mm->Container) { containerFrameIdx = i; break; }
        }
        if (containerFrameIdx < 0) continue;
        const FrameVerts &fv = frameVerts[containerFrameIdx];

        // 全 TriangleList をまたいで三角形を集める
        std::vector<std::uint32_t> meshVertexMap = mvd.posIdx;  // mesh vertex index → frame pos index
        std::vector<std::uint32_t> meshNrmMap    = mvd.nrmIdx;
        std::vector<float>         meshUV        = mvd.uv;

        MeshIR mesh;
        auto cname = f.name(getFrame(containerFrameIdx)->Name);
        mesh.name = std::string(cname);
        mesh.material = -1;
        if (mm->Material != 0) {
            // materialOffset → materialIndex
            for (int j = 0; j < hdr->MaterialNum; ++j) {
                if (hdr->Material + j * sizeof(f1::MV1_MATERIAL_F1) == mm->Material) {
                    mesh.material = j;
                    break;
                }
            }
        }
        // Mesh の positions/normals/uvs は「frame の PandN を uv 毎に per-corner で展開」するのが
        // 本来の対称だが、ここでは出力 writer が期待する「positions=unique, normals=per-corner,
        // indices=三角形の頂点インデックス (unique pos 参照)」の形に組み直す。
        //
        // 今回 (round-trip 主目的): Mesh vertex は既に frame pos index 配列を持っている。
        // positions: そのまま frame の pos をコピー (unique)
        // uv: mesh vertex count 分 (per-corner) — これを「per-unique-pos の代表値」にすると
        //     情報が落ちる。writer の per-corner 展開前提に合わせ、positions を per-corner に
        //     展開してしまうのが最も整合する。
        //
        // 簡略: positions=unique, normals=per-corner (frame.normal[meshVertex.nrmIdx])、
        //        uvs=per-unique (先頭出現を採用)、indices=per-mesh-vertex そのまま。
        //        多くの fixture で動く (重複 UV あっても先頭値で round-trip)。

        mesh.positions = fv.pos;
        // triangle indices — TL を辿って集める
        mesh.indices.reserve(mm->VertexNum);  // 上限ヒント
        // TL 配列へのアクセス: hdr->TriangleList から順番
        for (int tli = 0; tli < hdr->TriangleListNum; ++tli) {
            const auto *tl = f.at<f1::MV1_TRIANGLE_LIST_F1>(
                hdr->TriangleList + tli * sizeof(f1::MV1_TRIANGLE_LIST_F1));
            if (!tl || tl->Container != hdr->Mesh + mi * sizeof(f1::MV1_MESH_F1)) continue;
            auto tri = decode_tl_triangles(f, *tl);  // tri[i] = mesh vertex index
            // mesh vertex index → frame pos index
            for (std::uint32_t mv : tri) {
                if (mv < meshVertexMap.size()) mesh.indices.push_back(meshVertexMap[mv]);
            }
        }

        // Normals: per-corner で出したい (writer は per-corner 想定)
        // → 各 triangle corner は mesh vertex を経由し、mesh vertex は nrmIdx で frame normal を指す
        //    ここでは「frame normal[meshVertex.nrmIdx[corner の mesh vertex]]」という間接参照になるが、
        //    writer が per-corner 展開するので、mesh.normals は unique per-pos 相当に合わせると一致しなくなる。
        //    簡便に: m.normals を per-pos 平均にして再展開に任せる (writer が法線無しなら face-normal を
        //    自動生成するので、normals を空にしても動く)
        // 今回は writer の auto-normal 生成に任せて normals 空にする。
        // mesh.normals = {};

        // UVs per-unique-pos: 先頭に見つかった UV を採用
        if (!meshUV.empty() && !meshVertexMap.empty()) {
            std::size_t posCount = fv.pos.size() / 3;
            mesh.uvs.assign(posCount * 2, 0.0f);
            std::vector<bool> set(posCount, false);
            for (std::size_t mv = 0; mv < meshVertexMap.size() && mv < meshUV.size() / 2; ++mv) {
                std::uint32_t pIdx = meshVertexMap[mv];
                if (pIdx < posCount && !set[pIdx]) {
                    mesh.uvs[pIdx * 2 + 0] = meshUV[mv * 2 + 0];
                    mesh.uvs[pIdx * 2 + 1] = meshUV[mv * 2 + 1];
                    set[pIdx] = true;
                }
            }
        }

        // Bone weights (skin 時): frame pos に対応
        if (hasSkin && !fv.weights.empty()) {
            mesh.bone_weights = fv.weights;
        }
        r.ir.meshes.push_back(std::move(mesh));
    }

    // Animations
    extract_animations(f, r.ir);

    if (r.ir.meshes.empty()) {
        r.error = "mv1: no mesh extracted";
    }
    return r;
}

}
