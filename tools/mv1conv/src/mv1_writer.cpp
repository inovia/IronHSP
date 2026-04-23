#include "mv1_writer.hpp"
#include "mv1_f1.hpp"
#include "mv1_enums.hpp"
#include "dxa.hpp"
#include <algorithm>
#include <cmath>
#include <cstring>
#include <cstdio>
#include <map>
#include <tuple>

namespace mv1conv {

namespace {

// 伸長後バッファ = CheckID 4byte + (Version 以降の全データ)
// 出力は CheckID 込みで構築し、最後に CheckID を除いた部分を DXA 圧縮する。

class Builder {
public:
    std::vector<std::uint8_t> buf;

    void reserve(std::size_t n) { buf.reserve(n); }
    std::uint32_t pos() const { return static_cast<std::uint32_t>(buf.size()); }

    // 4 byte アラインメントまで 0x00 を pad
    void align4() {
        while (buf.size() & 3u) buf.push_back(0);
    }

    std::uint32_t append_zero(std::size_t n) {
        std::uint32_t p = pos();
        buf.insert(buf.end(), n, 0);
        return p;
    }

    template <class T>
    std::uint32_t append_struct(const T &t) {
        std::uint32_t p = pos();
        const std::uint8_t *src = reinterpret_cast<const std::uint8_t *>(&t);
        buf.insert(buf.end(), src, src + sizeof(T));
        return p;
    }

    std::uint32_t append_bytes(const void *data, std::size_t n) {
        std::uint32_t p = pos();
        const std::uint8_t *src = static_cast<const std::uint8_t *>(data);
        buf.insert(buf.end(), src, src + n);
        return p;
    }

    // 既に確保したバッファ位置 offset に T を上書き
    template <class T>
    void overwrite_struct(std::uint32_t offset, const T &t) {
        std::memcpy(buf.data() + offset, &t, sizeof(T));
    }

    void overwrite_u32(std::uint32_t offset, std::uint32_t v) {
        std::memcpy(buf.data() + offset, &v, 4);
    }
};

// 文字列プール (UTF-8)。空文字列 "" は pool offset 0 を返さず、空名は常に pool offset 0 (= null)。
class StringPool {
public:
    // 空文字列は offset 0 (= null)
    std::uint32_t add(const std::string &s) {
        if (s.empty()) return 0;
        // 重複チェック (線形でも 5 ファイルでは十分)
        for (auto &e : entries) {
            if (e.first == s) return e.second;
        }
        std::uint32_t off = static_cast<std::uint32_t>(data.size());
        if (off == 0) {
            // offset 0 は null 扱いなので sentinel 1 byte 入れる
            data.push_back(0);  // dummy NUL
            off = 1;
        }
        data.insert(data.end(), s.begin(), s.end());
        data.push_back(0);
        entries.emplace_back(s, off);
        return off;
    }

    const std::vector<std::uint8_t> &bytes() const { return data; }

private:
    std::vector<std::uint8_t> data;
    std::vector<std::pair<std::string, std::uint32_t>> entries;
};

}

WriteResult write_mv1(const ModelIR &ir) {
    WriteResult r;
    if (ir.meshes.empty()) { r.error = "no meshes"; return r; }
    if (ir.materials.empty()) { r.error = "no materials"; return r; }

    const bool isSkin = !ir.bones.empty();
    // Frame 構成 (DxLib 本家 save 準拠 multi.x の ref 観測):
    //   static: Frame[0..M-1] = 各メッシュ (1 frame = 1 mesh)、全て top-level (parent=NULL)、
    //           Prev/Next で siblings 連結 (root 合成なし)
    //   skin:   Frame[0] = 空 root (bones 階層の親)
    //           Frame[1..M] = 各メッシュ (root の子)
    //           Frame[M+1..M+B] = 各 bone
    const int meshCount = static_cast<int>(ir.meshes.size());
    const int boneCount = static_cast<int>(ir.bones.size());
    const int frameNum = isSkin ? (1 + meshCount + boneCount) : meshCount;
    const int firstMeshFrameIdx = isSkin ? 1 : 0;     // static: mesh = Frame[0..M-1]
    const int bonesBaseIdx     = isSkin ? (1 + meshCount) : 0;  // skin: Frame[M+1..]

    StringPool strings;
    Builder b;

    // ====== 1. FileHeader 領域確保 ======
    f1::MV1MODEL_FILEHEADER_F1 hdr{};
    std::memcpy(hdr.CheckID, "MV11", 4);
    hdr.Version = 0;
    hdr.RightHandType = ir.right_hand ? 1 : 0;
    hdr.AutoCreateNormal = 0;
    hdr.IsStringUTF8 = 1;
    hdr.MaterialNumberOrderDraw = 0;

    std::uint32_t offHeader = b.append_zero(sizeof(hdr));
    (void)offHeader;

    // ====== 1b. ChangeMatrixTable / ChangeDrawMaterialTable ======
    // DxLib は frame/mesh/material の状態変化を bit-flag table (1 bit / element)
    // で追跡する。FHeader->ChangeMatrixTableSize=0 + offset=0 だと runtime の
    // bit 操作で境界外 write が発生し debug allocator の MagicID corruption を
    // 起こす (n≥5 で再現、調査結果)。
    // 安全マージンとして 256 byte (=2048 bit) 以上を確保。
    const std::int32_t changeTableSize = 256;
    b.align4();
    std::uint32_t offChangeDrawMatTable = b.append_zero(changeTableSize);
    b.align4();
    std::uint32_t offChangeMatTable = b.append_zero(changeTableSize);

    // ====== 2. Frame 配列確保 ======
    // シンプルのため Frame[0] = container, Frame[1..] = bones (skin 時)
    b.align4();
    std::uint32_t offFrameArray = b.pos();
    std::vector<std::uint32_t> frameOffsets(frameNum);
    for (int i = 0; i < frameNum; ++i)
        frameOffsets[i] = b.append_zero(sizeof(f1::MV1_FRAME_F1));
    std::uint32_t offFrame = frameOffsets[0];
    (void)offFrameArray;

    // ====== 3. Material 配列 ======
    b.align4();
    std::uint32_t offMaterial = b.pos();
    std::vector<std::uint32_t> materialOffsets;
    materialOffsets.reserve(ir.materials.size());
    for (std::size_t i = 0; i < ir.materials.size(); ++i)
        materialOffsets.push_back(b.append_zero(sizeof(f1::MV1_MATERIAL_F1)));

    // ====== 4. Texture 配列 ======
    b.align4();
    std::uint32_t offTexture = b.pos();
    std::vector<std::uint32_t> textureOffsets;
    textureOffsets.reserve(ir.textures.size());
    for (std::size_t i = 0; i < ir.textures.size(); ++i)
        textureOffsets.push_back(b.append_zero(sizeof(f1::MV1_TEXTURE_F1)));

    // ====== 5. Mesh 配列 ======
    b.align4();
    std::uint32_t offMesh = b.pos();
    std::vector<std::uint32_t> meshOffsets;
    meshOffsets.reserve(ir.meshes.size());
    for (std::size_t i = 0; i < ir.meshes.size(); ++i)
        meshOffsets.push_back(b.append_zero(sizeof(f1::MV1_MESH_F1)));

    // ====== 6. TriangleList 配列 ======
    b.align4();
    std::uint32_t offTriangleList = b.pos();
    std::vector<std::uint32_t> tlOffsets;
    tlOffsets.reserve(ir.meshes.size());  // 1 mesh = 1 TL
    for (std::size_t i = 0; i < ir.meshes.size(); ++i)
        tlOffsets.push_back(b.append_zero(sizeof(f1::MV1_TRIANGLE_LIST_F1)));

    // ====== 6b. SkinBone 配列 (skin 時のみ) ======
    std::uint32_t offSkinBone = 0;
    std::vector<std::uint32_t> skinBoneOffsets;
    if (isSkin) {
        b.align4();
        offSkinBone = b.pos();
        skinBoneOffsets.reserve(ir.bones.size());
        for (std::size_t i = 0; i < ir.bones.size(); ++i)
            skinBoneOffsets.push_back(b.append_zero(sizeof(f1::MV1_SKIN_BONE_F1)));
    }

    // ====== 7. PositionAndNormalData (per-mesh frame ごと) ======
    // 1 frame = 1 mesh 構造なので、各 frame が自分の mesh の positions/normals
    // だけを保持する。Mesh.VertexData 内の pos idx は 0..mesh.VertexNum-1 の
    // 恒等写像でよい (meshPosBase/meshNrmBase は 0 固定)。
    // normal を常に持つことを保証する (無ければ face normal 自動生成)
    // DxLib は法線が無い .mv1 を受け付けるが multi-mesh で crash する経験則
    bool hasNormals = true;
    {
        ModelIR &mut = const_cast<ModelIR &>(ir);
        for (auto &m : mut.meshes) {
            if (m.normals.empty() && !m.positions.empty() && !m.indices.empty()) {
                // 各 unique position に face normal 平均を割り当て
                std::size_t posCount = m.positions.size() / 3;
                std::vector<float> sumN(posCount * 3, 0.0f);
                for (std::size_t i = 0; i + 2 < m.indices.size(); i += 3) {
                    std::uint32_t a = m.indices[i], b = m.indices[i+1], c = m.indices[i+2];
                    if (a >= posCount || b >= posCount || c >= posCount) continue;
                    float ax=m.positions[a*3], ay=m.positions[a*3+1], az=m.positions[a*3+2];
                    float bx=m.positions[b*3], by=m.positions[b*3+1], bz=m.positions[b*3+2];
                    float cx=m.positions[c*3], cy=m.positions[c*3+1], cz=m.positions[c*3+2];
                    float ux=bx-ax, uy=by-ay, uz=bz-az;
                    float vx=cx-ax, vy=cy-ay, vz=cz-az;
                    float nx = uy*vz - uz*vy;
                    float ny = uz*vx - ux*vz;
                    float nz = ux*vy - uy*vx;
                    sumN[a*3+0]+=nx; sumN[a*3+1]+=ny; sumN[a*3+2]+=nz;
                    sumN[b*3+0]+=nx; sumN[b*3+1]+=ny; sumN[b*3+2]+=nz;
                    sumN[c*3+0]+=nx; sumN[c*3+1]+=ny; sumN[c*3+2]+=nz;
                }
                for (std::size_t i = 0; i < posCount; ++i) {
                    float x=sumN[i*3], y=sumN[i*3+1], z=sumN[i*3+2];
                    float len = std::sqrt(x*x + y*y + z*z);
                    if (len > 1e-6f) { x/=len; y/=len; z/=len; }
                    else { x=0; y=1; z=0; }
                    sumN[i*3]=x; sumN[i*3+1]=y; sumN[i*3+2]=z;
                }
                m.normals = std::move(sumN);
            }
        }
    }

    // 各 mesh frame の PandN 開始オフセット (後で overwrite)
    std::vector<std::uint32_t> meshFramePandNOff(ir.meshes.size(), 0);
    std::vector<std::uint32_t> meshFramePosNum(ir.meshes.size(), 0);
    std::vector<std::uint32_t> meshFrameNormalNum(ir.meshes.size(), 0);
    b.align4();
    std::uint32_t offPAndN = b.pos();
    std::uint32_t positionNum = 0;
    std::uint32_t normalNum   = 0;

    for (std::size_t mi = 0; mi < ir.meshes.size(); ++mi) {
        const auto &m = ir.meshes[mi];
        b.align4();
        meshFramePandNOff[mi] = b.pos();
        std::uint32_t pn = static_cast<std::uint32_t>(m.positions.size() / 3);
        // DxLib 慣習: NormalNum = per-corner count (mesh.indices.size())、
        // 各 corner が独自 normal を持つ (ハードエッジ対応)
        std::uint32_t nn = static_cast<std::uint32_t>(m.normals.empty() ? 0 : m.indices.size());
        meshFramePosNum[mi]    = pn;
        meshFrameNormalNum[mi] = nn;
        positionNum += pn;
        normalNum   += nn;

        // Position: float3 (unique、m.positions そのまま)
        for (float f : m.positions) b.append_bytes(&f, 4);

        // Weight block (skin 時、per-unique-position 単位)
        if (isSkin) {
            const auto &weights = m.bone_weights;
            for (std::uint32_t v = 0; v < pn; ++v) {
                VertexBone vb;
                if (v < weights.size()) vb = weights[v];
                else { vb.bone[0] = 0; vb.weight[0] = 1.0f; }
                for (int s = 0; s < 4; ++s) {
                    std::uint8_t idx = (vb.bone[s] >= 0 && vb.bone[s] < 255)
                                       ? static_cast<std::uint8_t>(vb.bone[s])
                                       : 0xFFu;
                    b.append_bytes(&idx, 1);
                    if (vb.bone[s] < 0) break;
                    std::uint8_t w = static_cast<std::uint8_t>(
                        std::clamp(static_cast<int>(vb.weight[s] * 255.0f + 0.5f), 0, 255));
                    b.append_bytes(&w, 1);
                }
            }
        }

        // Normal: S16 quantize、per-corner (m.indices.size() 個)
        if (!m.normals.empty()) {
            auto to_s16 = [](float v) -> std::int16_t {
                float c = std::clamp(v, -1.0f, 1.0f);
                return static_cast<std::int16_t>(c * 32767.0f);
            };
            for (std::size_t i = 0; i < m.indices.size(); ++i) {
                std::uint32_t vi = m.indices[i];
                float nx = 0, ny = 1, nz = 0;
                if (vi * 3 + 2 < m.normals.size()) {
                    nx = m.normals[vi * 3 + 0];
                    ny = m.normals[vi * 3 + 1];
                    nz = m.normals[vi * 3 + 2];
                }
                std::int16_t sx = to_s16(nx), sy = to_s16(ny), sz = to_s16(nz);
                b.append_bytes(&sx, 2);
                b.append_bytes(&sy, 2);
                b.append_bytes(&sz, 2);
            }
        }
    }

    // ====== 8. Mesh.VertexData (mesh ごと、per-corner レイアウト) ======
    // DxLib runtime は NormalPosition / SkinPos{4B,8B} 領域を 16 byte align で
    // 読む。Mesh.VertexData 自体は file offset ベースで直接 memcpy されるため
    // 4 byte align で十分 (DxLib save も L19344 の (Size+3)/4*4 で 4 byte align)。
    std::vector<std::uint32_t> meshVertexDataOffsets(ir.meshes.size());
    for (std::size_t mi = 0; mi < ir.meshes.size(); ++mi) {
        const auto &m = ir.meshes[mi];
        b.align4();
        meshVertexDataOffsets[mi] = b.pos();
        const std::size_t vn = m.indices.size();  // per-corner count

        std::uint32_t white = 0xFFFFFFFFu;
        b.append_bytes(&white, 4);
        b.append_bytes(&white, 4);

        const bool useU32vd = vn > 65535;
        const std::size_t idxSize = useU32vd ? 4 : 2;
        for (std::size_t i = 0; i < vn; ++i) {
            std::uint32_t posIdx = m.indices[i];
            b.append_bytes(&posIdx, idxSize);
        }
        if (hasNormals && !m.normals.empty()) {
            for (std::size_t i = 0; i < vn; ++i) {
                std::uint32_t nrmIdx = static_cast<std::uint32_t>(i);
                b.append_bytes(&nrmIdx, idxSize);
            }
        }
        for (std::size_t i = 0; i < vn; ++i) {
            float u = 0.0f, vv = 0.0f;
            if (!m.uvs.empty()) {
                std::uint32_t vi = m.indices[i];
                if (vi * 2 + 1 < m.uvs.size()) {
                    u  = m.uvs[vi*2+0];
                    vv = m.uvs[vi*2+1];
                }
            }
            b.append_bytes(&u, 4);
            b.append_bytes(&vv, 4);
        }
        std::size_t bitBytes = (vn + 7) / 8;
        for (std::size_t i = 0; i < bitBytes; ++i) {
            std::uint8_t all1 = 0xFF;
            b.append_bytes(&all1, 1);
        }
        while (b.pos() & 3u) {
            std::uint8_t z = 0;
            b.append_bytes(&z, 1);
        }
    }

    // ====== 9. TriangleList.MeshVertexIndexAndIndexData ======
    std::vector<std::uint32_t> tlDataOffsets(ir.meshes.size());
    for (std::size_t mi = 0; mi < ir.meshes.size(); ++mi) {
        const auto &m = ir.meshes[mi];
        b.align4();
        tlDataOffsets[mi] = b.pos();
        if (isSkin) {
            std::uint16_t useBoneN = static_cast<std::uint16_t>(ir.bones.size());
            b.append_bytes(&useBoneN, 2);
            for (std::uint16_t bi = 0; bi < useBoneN; ++bi) {
                b.append_bytes(&bi, 2);
            }
        }
        const std::size_t vn = m.indices.size();
        for (std::size_t i = 0; i < vn; ++i) {
            std::uint32_t idx = static_cast<std::uint32_t>(i);
            b.append_bytes(&idx, 4);
        }
        for (std::size_t i = 0; i < vn; ++i) {
            std::uint32_t idx = static_cast<std::uint32_t>(i);
            b.append_bytes(&idx, 4);
        }
    }

    // ====== 9b. SkinBone の UseFrame 配列 (skin 時) ======
    std::vector<std::uint32_t> skinBoneUseFrameOffsets;
    if (isSkin) {
        skinBoneUseFrameOffsets.reserve(ir.bones.size());
        for (std::size_t bi = 0; bi < ir.bones.size(); ++bi) {
            b.align4();
            std::uint32_t off = b.pos();
            skinBoneUseFrameOffsets.push_back(off);
            // 1 entry: {Index=最初の mesh frame, MatrixIndex=bi}
            f1::MV1_SKIN_BONE_USE_FRAME_F1 uf{};
            uf.Index       = static_cast<std::int32_t>(firstMeshFrameIdx);
            uf.MatrixIndex = static_cast<std::int32_t>(bi);
            b.append_struct(uf);
        }
    }

    // ====== 9c. Frame[0].UseSkinBone ポインタ配列 (skin 時) ======
    std::uint32_t offFrame0UseSkinBone = 0;
    if (isSkin) {
        b.align4();
        offFrame0UseSkinBone = b.pos();
        for (std::size_t bi = 0; bi < ir.bones.size(); ++bi) {
            std::uint32_t p = skinBoneOffsets[bi];
            b.append_bytes(&p, 4);
        }
    }

    // ====== 9d. FrameUseSkinBone (Header 用) = 上と同じ配列を再利用 ======
    // MV1 の header.FrameUseSkinBone は「全 Frame が使用するボーンポインタの通し配列」。
    // 現在は Frame[0] のみ使用なので中身は同一。
    std::uint32_t offFrameUseSkinBone = offFrame0UseSkinBone;

    // ====== 9e. SkinBoneUseFrame (Header 用) = 各 bone の UseFrame をまとめた flat ポインタ配列 ======
    std::uint32_t offSkinBoneUseFramePtr = 0;
    if (isSkin) {
        b.align4();
        offSkinBoneUseFramePtr = b.pos();
        for (std::size_t bi = 0; bi < ir.bones.size(); ++bi) {
            std::uint32_t p = skinBoneUseFrameOffsets[bi];
            b.append_bytes(&p, 4);
        }
    }

    // ====== 10. StringBuffer ======
    // マテリアル/テクスチャ/フレーム名をプール
    std::uint32_t nameFrame0 = strings.add("root");
    std::vector<std::uint32_t> boneFrameName;
    if (isSkin) {
        boneFrameName.reserve(ir.bones.size());
        for (const auto &b : ir.bones) {
            boneFrameName.push_back(strings.add(b.name.empty() ? "bone" : b.name));
        }
    }
    std::vector<std::uint32_t> matName(ir.materials.size());
    for (std::size_t i = 0; i < ir.materials.size(); ++i)
        matName[i] = strings.add(ir.materials[i].name);
    std::vector<std::uint32_t> texName(ir.textures.size()),
                               texColorPath(ir.textures.size());
    for (std::size_t i = 0; i < ir.textures.size(); ++i) {
        texName[i]      = strings.add(ir.textures[i].name);
        texColorPath[i] = strings.add(ir.textures[i].color_path);
    }
    std::vector<std::uint32_t> animSetNameOff(ir.anim_sets.size());
    for (std::size_t i = 0; i < ir.anim_sets.size(); ++i)
        animSetNameOff[i] = strings.add(ir.anim_sets[i].name);

    // ====== Animation blobs (存在時のみ) ======
    // layout: AnimKeyData blob (全 keyset の time+value を連結)
    //         → MV1_ANIM_KEYSET_F1 配列
    //         → MV1_ANIM_F1 配列
    //         → MV1_ANIMSET_F1 配列
    // 各 F1 の相対ポインタは全てファイル先頭からの byte offset。
    const bool hasAnim = !ir.anim_sets.empty() && !ir.anims.empty() && !ir.anim_keysets.empty();
    std::uint32_t offAnimKeyData    = 0;
    std::uint32_t animKeyDataSize   = 0;
    std::uint32_t offAnimKeySet     = 0;
    std::uint32_t offAnim           = 0;
    std::uint32_t offAnimSet        = 0;
    std::vector<std::uint32_t> keysetKeyDataOff(ir.anim_keysets.size());
    std::vector<std::uint32_t> animKeySetFirstOff(ir.anims.size());  // 各 Anim の KeySet 先頭 offset
    std::vector<std::uint32_t> animOffsets(ir.anims.size());
    std::vector<std::uint32_t> animSetOffsets(ir.anim_sets.size());

    std::uint32_t runtimeAnimKeyDataSize = 0;  // DxLib runtime 側の必要 byte 数
    if (hasAnim) {
        b.align4();
        offAnimKeyData = b.pos();
        for (std::size_t ki = 0; ki < ir.anim_keysets.size(); ++ki) {
            const auto &ks = ir.anim_keysets[ki];
            keysetKeyDataOff[ki] = b.pos();
            if (!ks.raw_blob.empty()) {
                // raw passthrough: 元ファイルの KeyData blob をそのまま埋め込む
                b.append_bytes(ks.raw_blob.data(), ks.raw_blob.size());
                b.align4();
                continue;
            }
            // KeyData layout (最もシンプル): [DWORD Num] [float×N time] [keyVals...]
            std::uint32_t n = static_cast<std::uint32_t>(ks.key_times.size());
            b.append_bytes(&n, 4);
            for (float t : ks.key_times) b.append_bytes(&t, 4);
            for (float v : ks.key_values) b.append_bytes(&v, 4);
            b.align4();

            int val_size = 4;
            if (ks.key_type == AnimKeySetIR::KT_VECTOR)        val_size = 12;
            else if (ks.key_type == AnimKeySetIR::KT_QUATERNION_X) val_size = 16;
            runtimeAnimKeyDataSize += n * (4 + val_size);
        }
        animKeyDataSize = b.pos() - offAnimKeyData;

        // MV1_ANIM_KEYSET_F1 配列
        b.align4();
        offAnimKeySet = b.pos();
        std::vector<std::uint32_t> keysetOffs(ir.anim_keysets.size());
        for (std::size_t ki = 0; ki < ir.anim_keysets.size(); ++ki) {
            const auto &ks = ir.anim_keysets[ki];
            f1::MV1_ANIM_KEYSET_F1 ksF1{};
            ksF1.Type = ks.key_type;
            ksF1.DataType = ks.data_type;
            // raw passthrough 時は保存された flag を復元、そうでなければ 0 (simple layout)
            ksF1.Flag = ks.raw_blob.empty() ? 0 : ks.raw_flag;
            ksF1.KeyData = keysetKeyDataOff[ki];
            keysetOffs[ki] = b.append_struct(ksF1);
        }

        // MV1_ANIM_F1 配列 (KeySet 配列は MV1_ANIM_KEYSET_F1[ kskStart : kskStart+KeySetNum ])
        // が Anim.KeySet から連続して並んでいる必要がある。ir.anims[i].keyset_indices は
        // 既に昇順の連続区間であることを期待 (assimp_import.cpp で pushback 順)。
        b.align4();
        offAnim = b.pos();
        for (std::size_t ai = 0; ai < ir.anims.size(); ++ai) {
            const auto &an = ir.anims[ai];
            f1::MV1_ANIM_F1 af1{};
            af1.Index = static_cast<std::int32_t>(ai);
            // Container は後で AnimSet 配列を書いてから逆引きして埋める
            af1.Container = 0;
            af1.TargetFrameIndex = an.target_frame_index;
            af1.MaxTime = an.max_time;
            af1.RotateOrder = 0;
            af1.KeySetNum = static_cast<std::int32_t>(an.keyset_indices.size());
            af1.KeySet = an.keyset_indices.empty()
                         ? 0u
                         : keysetOffs[an.keyset_indices.front()];
            animOffsets[ai] = b.append_struct(af1);
        }

        // MV1_ANIMSET_F1 配列
        b.align4();
        offAnimSet = b.pos();
        for (std::size_t si = 0; si < ir.anim_sets.size(); ++si) {
            const auto &as = ir.anim_sets[si];
            f1::MV1_ANIMSET_F1 asF1{};
            asF1.Name = animSetNameOff[si];
            asF1.Index = static_cast<std::int32_t>(si);
            asF1.MaxTime = as.max_time;
            asF1.AnimNum = static_cast<std::int32_t>(as.anim_indices.size());
            asF1.Anim = as.anim_indices.empty() ? 0u : animOffsets[as.anim_indices.front()];
            asF1.Flag = as.flag;
            animSetOffsets[si] = b.append_struct(asF1);
        }

        // Anim の Container を埋め戻す
        for (std::size_t si = 0; si < ir.anim_sets.size(); ++si) {
            const auto &as = ir.anim_sets[si];
            for (std::size_t ai : as.anim_indices) {
                b.overwrite_u32(animOffsets[ai] + 4, animSetOffsets[si]);  // MV1_ANIM_F1.Container は 2nd DWORD
            }
        }

        // AnimSet 配列の DimPrev/DimNext をリンク
        for (std::size_t si = 0; si < ir.anim_sets.size(); ++si) {
            std::uint32_t prev = (si == 0) ? 0u : animSetOffsets[si - 1];
            std::uint32_t next = (si + 1 < ir.anim_sets.size()) ? animSetOffsets[si + 1] : 0u;
            b.overwrite_u32(animSetOffsets[si] + 0, prev);
            b.overwrite_u32(animSetOffsets[si] + 4, next);
        }
    }

    b.align4();
    std::uint32_t offStringBuffer = b.pos();
    b.append_bytes(strings.bytes().data(), strings.bytes().size());
    std::uint32_t stringSize = static_cast<std::uint32_t>(strings.bytes().size());

    // ====== すべての *_F1 構造体を埋めて上書き ======
    std::int32_t totalTriangles = 0;
    for (const auto &m : ir.meshes) totalTriangles += static_cast<std::int32_t>(m.indices.size() / 3);

    // -- Frame[0] (root、skin 時のみ) --
    if (isSkin) {
        f1::MV1_FRAME_F1 rootFrame{};
        rootFrame.Name  = nameFrame0;  // "root" または ""
        rootFrame.Index = 0;
        rootFrame.Scale = { 1.0f, 1.0f, 1.0f };
        rootFrame.Quaternion = { 0.0f, 0.0f, 0.0f, 1.0f };
        rootFrame.Flag  = 0;
        rootFrame.TotalMeshNum = static_cast<std::int32_t>(ir.meshes.size());
        rootFrame.TotalChildNum = meshCount + 1;  // mesh frames + bones root
        if (!ir.meshes.empty()) {
            rootFrame.FirstChild = frameOffsets[firstMeshFrameIdx];
            rootFrame.LastChild  = frameOffsets[firstMeshFrameIdx + meshCount - 1];
        }
        rootFrame.PositionAndNormalData = offPAndN;
        rootFrame.VertFlag = 0;
        rootFrame.MaxBoneBlendNum = 4;
        rootFrame.SmoothingAngle = 0.0f;
        rootFrame.AutoCreateNormal = 0;
        b.overwrite_struct(frameOffsets[0], rootFrame);
    }

    // -- Mesh frames (static: Frame[0..M-1] top-level siblings / skin: Frame[1..M] root の子) --
    for (std::size_t mi = 0; mi < ir.meshes.size(); ++mi) {
        const auto &m = ir.meshes[mi];
        f1::MV1_FRAME_F1 mf{};
        mf.Name  = strings.add(m.name.empty() ? ("mesh" + std::to_string(mi)) : m.name);
        mf.Index = static_cast<std::int32_t>(firstMeshFrameIdx + mi);
        mf.Scale = { 1.0f, 1.0f, 1.0f };
        mf.Quaternion = { 0.0f, 0.0f, 0.0f, 1.0f };
        mf.Flag  = 0;
        mf.Parent = isSkin ? frameOffsets[0] : 0u;  // skin は root に、static は top-level
        // Prev/Next sibling chain (DxLib 本家 save multi.x 観測): 同じ親を持つ兄弟をリンク
        // static: top-level 兄弟として全 mesh frame をリンク
        // skin:   root 下の兄弟として mesh frames をリンク
        mf.Prev = (mi == 0) ? 0u : frameOffsets[firstMeshFrameIdx + mi - 1];
        mf.Next = (mi + 1 == ir.meshes.size()) ? 0u : frameOffsets[firstMeshFrameIdx + mi + 1];
        mf.TotalMeshNum = 1;
        mf.MeshNum = 1;
        mf.Mesh = meshOffsets[mi];
        mf.VertexNum   = static_cast<std::int32_t>(m.indices.size());  // TL vertex count (per-corner)
        mf.TriangleNum = static_cast<std::int32_t>(m.indices.size() / 3);
        mf.PositionNum = static_cast<std::int32_t>(meshFramePosNum[mi]);
        mf.NormalNum   = static_cast<std::int32_t>(meshFrameNormalNum[mi]);
        mf.PositionAndNormalData = meshFramePandNOff[mi];
        if (isSkin) {
            mf.VertFlag = static_cast<std::uint16_t>(
                (hasNormals ? e::FRAME_NORMAL_TYPE_S16 : e::FRAME_NORMAL_TYPE_NONE));
            mf.MaxBoneBlendNum = 4;
            mf.IsSkinMesh = 1;
            mf.UseSkinBoneNum = static_cast<std::int32_t>(ir.bones.size());
            mf.UseSkinBone    = offFrame0UseSkinBone;
            mf.SkinBoneNum    = static_cast<std::int32_t>(ir.bones.size());
            mf.SkinBone       = offSkinBone;
        } else {
            mf.VertFlag = static_cast<std::uint16_t>(
                e::FRAME_VERT_FLAG_MATRIX_WEIGHT_NONE |
                (hasNormals ? e::FRAME_NORMAL_TYPE_S16 : e::FRAME_NORMAL_TYPE_NONE));
            mf.MaxBoneBlendNum = 0;
        }
        mf.SmoothingAngle = 0.0f;
        mf.AutoCreateNormal = 0;
        b.overwrite_struct(frameOffsets[firstMeshFrameIdx + mi], mf);
    }

    // -- Frame[2..N+1] (bones、skin 時) --
    if (isSkin) {
        for (std::size_t bi = 0; bi < ir.bones.size(); ++bi) {
            const auto &bir = ir.bones[bi];
            f1::MV1_FRAME_F1 bf{};
            bf.Name  = boneFrameName[bi];
            bf.Index = static_cast<std::int32_t>(bi + bonesBaseIdx);
            bf.Translate = { bir.translate[0], bir.translate[1], bir.translate[2] };
            bf.Scale     = { bir.scale[0],     bir.scale[1],     bir.scale[2] };
            bf.Rotate    = { 0, 0, 0 };
            bf.Quaternion= { bir.quaternion[0], bir.quaternion[1], bir.quaternion[2], bir.quaternion[3] };
            bf.Flag = 0;
            // Parent: -1 → Frame[0] (root)、それ以外 → Frame[bone.parent + bonesBaseIdx]
            std::uint32_t parentOff = (bir.parent < 0)
                                      ? frameOffsets[0]
                                      : frameOffsets[bir.parent + bonesBaseIdx];
            bf.Parent = parentOff;
            // 全 frame は共有 PandN ポインタを持つ (DxChara 準拠)
            bf.PositionAndNormalData = offPAndN;
            b.overwrite_struct(frameOffsets[bi + bonesBaseIdx], bf);
        }
    }

    // -- SkinBone 配列 (skin 時) --
    if (isSkin) {
        for (std::size_t bi = 0; bi < ir.bones.size(); ++bi) {
            const auto &bir = ir.bones[bi];
            f1::MV1_SKIN_BONE_F1 sb{};
            sb.Index = static_cast<std::int32_t>(bi);
            sb.BoneFrame = static_cast<std::int32_t>(bi + bonesBaseIdx);  // Frame index
            std::memcpy(&sb.ModelLocalMatrix, bir.inv_bind, sizeof(bir.inv_bind));
            sb.ModelLocalMatrixIsTranslateOnly = 0;
            sb.UseFrameNum = 1;
            sb.UseFrame    = skinBoneUseFrameOffsets[bi];
            b.overwrite_struct(skinBoneOffsets[bi], sb);
        }
    }

    // ================================================================
    // 全 *_F1 配列は DimPrev / DimNext リンクリストを持つ (DxLib は
    // 配列先頭から next を辿るため、null のままだと walk が途中で落ちる)。
    // 下のヘルパーで 2 WORD ポインタを後で埋める。
    // ================================================================
    auto link_array = [&](std::vector<std::uint32_t> &offs) {
        for (std::size_t i = 0; i < offs.size(); ++i) {
            std::uint32_t prev = (i == 0) ? 0u : offs[i - 1];
            std::uint32_t next = (i + 1 < offs.size()) ? offs[i + 1] : 0u;
            // MV1_*_F1 先頭 2 DWORD が DimPrev / DimNext (共通 layout)
            b.overwrite_u32(offs[i] + 0, prev);
            b.overwrite_u32(offs[i] + 4, next);
        }
    };

    // -- Materials --
    for (std::size_t i = 0; i < ir.materials.size(); ++i) {
        const auto &m = ir.materials[i];
        f1::MV1_MATERIAL_F1 mat{};
        mat.Name = matName[i];
        mat.Index = static_cast<std::int32_t>(i);
        std::memcpy(&mat.Diffuse,  m.diffuse.data(),  16);
        std::memcpy(&mat.Ambient,  m.ambient.data(),  16);
        std::memcpy(&mat.Specular, m.specular.data(), 16);
        std::memcpy(&mat.Emissive, m.emissive.data(), 16);
        mat.Power = m.power;
        mat.Alpha = m.alpha;
        mat.DrawBlendMode = 1;  // NOBLEND
        mat.DrawBlendParam = 255;
        if (m.diffuse_texture >= 0) {
            mat.DiffuseLayerNum = 1;
            mat.DiffuseLayer[0].Texture = m.diffuse_texture;
            mat.DiffuseLayer[0].BlendType = 0;
        }
        b.overwrite_struct(materialOffsets[i], mat);
    }

    // -- Textures --
    for (std::size_t i = 0; i < ir.textures.size(); ++i) {
        const auto &t = ir.textures[i];
        f1::MV1_TEXTURE_F1 tex{};
        tex.Name          = texName[i];
        tex.Index         = static_cast<std::int32_t>(i);
        tex.ColorFilePath = texColorPath[i];
        tex.AlphaFilePath = 0;
        tex.AddressModeU  = 1;  // WRAP
        tex.AddressModeV  = 1;
        tex.FilterMode    = 2;  // LINEAR
        tex.Flag          = 0x06;  // REVERSE + BMP32_ALL_ZERO_ALPHA_TO_XRGB8 (観測値)
        tex.ScaleU = 1.0f;
        tex.ScaleV = 1.0f;
        (void)t;
        b.overwrite_struct(textureOffsets[i], tex);
    }

    // -- Meshes --
    for (std::size_t i = 0; i < ir.meshes.size(); ++i) {
        const auto &m = ir.meshes[i];
        f1::MV1_MESH_F1 mesh{};
        mesh.Index = static_cast<std::int32_t>(i);
        // Mesh.Container = このメッシュ専用の frame (Frame[1..M])
        mesh.Container = frameOffsets[firstMeshFrameIdx + i];
        if (m.material >= 0 && m.material < static_cast<int>(ir.materials.size()))
            mesh.Material = materialOffsets[m.material];
        mesh.TriangleListNum = 1;
        mesh.TriangleList = tlOffsets[i];
        mesh.Visible = 1;
        mesh.BackCulling = 1;
        // DxLib は UVSet を 1 以上を期待する模様 (UV なし mesh でも 1 set × 2 comp)
        mesh.UVSetUnitNum = 1;
        mesh.UVUnitNum    = 2;
        const std::int32_t meshVN = static_cast<std::int32_t>(m.indices.size());
        // Index type 選定: 65535 以下なら U16、超過時のみ U32
        const bool useU32 = meshVN > 65535;
        const std::uint32_t idxType = useU32 ? e::MESH_VERT_INDEX_TYPE_U32 : e::MESH_VERT_INDEX_TYPE_U16;
        // VertFlag (DxLib save L18995 準拠):
        //   COMMON_COLOR     = 0x20  常時 (頂点カラー個別出さない)
        //   NON_TOON_OUTLINE = 0x40  ★常時立てて、末尾に per-vertex bit データを書く
        //                             (VertexNum/8 byte、全 1 = outline なし)
        //   pos index U16/U32 + nrm index 同型
        std::uint32_t vf = e::MESH_VERT_FLAG_COMMON_COLOR
                         | e::MESH_VERT_FLAG_NON_TOON_OUTLINE
                         | idxType
                         | (hasNormals && !m.normals.empty() ? (idxType << 2) : 0);
        mesh.VertFlag = static_cast<std::int32_t>(vf);
        mesh.VertexNum = meshVN;  // per-corner count
        mesh.FaceNum   = static_cast<std::int32_t>(m.indices.size() / 3);
        mesh.VertexData = meshVertexDataOffsets[i];
        b.overwrite_struct(meshOffsets[i], mesh);
    }

    // -- TriangleLists --
    std::int32_t sumTLVertexNum = 0, sumTLIndexNum = 0;
    for (std::size_t i = 0; i < ir.meshes.size(); ++i) {
        const auto &m = ir.meshes[i];
        f1::MV1_TRIANGLE_LIST_F1 tl{};
        tl.Index = static_cast<std::int32_t>(i);
        tl.Container = meshOffsets[i];
        tl.VertexType = isSkin ? e::VERTEX_TYPE_SKIN_4BONE : e::VERTEX_TYPE_NORMAL;
        tl.Flag = static_cast<std::uint16_t>(e::TRILIST_INDEX_TYPE_U32 | (e::TRILIST_INDEX_TYPE_U32 << 2));
        tl.VertexNum = static_cast<std::uint16_t>(m.indices.size());
        tl.IndexNum  = static_cast<std::uint16_t>(m.indices.size());
        tl.MeshVertexIndexAndIndexData = tlDataOffsets[i];
        b.overwrite_struct(tlOffsets[i], tl);
        sumTLVertexNum += tl.VertexNum;
        sumTLIndexNum  += tl.IndexNum;
    }

    // -- Header 最終埋め込み --
    hdr.ChangeDrawMaterialTableSize = changeTableSize;
    hdr.ChangeDrawMaterialTable     = offChangeDrawMatTable;
    hdr.ChangeMatrixTableSize       = changeTableSize;
    hdr.ChangeMatrixTable           = offChangeMatTable;
    hdr.FrameNum            = frameNum;
    hdr.Frame               = offFrame;       // 配列先頭
    if (isSkin) {
        // skin: root のみ top-level
        hdr.TopFrameNum       = 1;
        hdr.FirstTopFrame     = frameOffsets[0];
        hdr.LastTopFrame      = frameOffsets[0];
    } else {
        // static: 全 mesh frame が top-level 兄弟として並ぶ
        hdr.TopFrameNum       = meshCount;
        hdr.FirstTopFrame     = frameOffsets[0];
        hdr.LastTopFrame      = frameOffsets[meshCount - 1];
    }
    if (isSkin) {
        hdr.SkinBoneNum         = static_cast<std::int32_t>(ir.bones.size());
        hdr.SkinBone            = offSkinBone;
        hdr.SkinBoneUseFrameNum = static_cast<std::int32_t>(ir.bones.size());
        hdr.SkinBoneUseFrame    = offSkinBoneUseFramePtr;
        hdr.FrameUseSkinBoneNum = static_cast<std::int32_t>(ir.bones.size());
        hdr.FrameUseSkinBone    = offFrameUseSkinBone;
    }
    hdr.MaterialNum         = static_cast<std::int32_t>(ir.materials.size());
    hdr.Material            = offMaterial;
    hdr.TextureNum          = static_cast<std::int32_t>(ir.textures.size());
    hdr.Texture             = ir.textures.empty() ? 0u : offTexture;
    hdr.MeshNum             = static_cast<std::int32_t>(ir.meshes.size());
    hdr.Mesh                = offMesh;
    hdr.TriangleListNum     = static_cast<std::int32_t>(ir.meshes.size());
    hdr.TriangleList        = offTriangleList;
    // VertexData 領域は offPAndN から始まり、StringBuffer の直前で終わる
    // (layout: PandN → Mesh.VertexData × N → TL.IndexData × N → stringBuffer)
    std::int32_t totalVertexDataBytes = static_cast<std::int32_t>(offStringBuffer) - static_cast<std::int32_t>(offPAndN);
    hdr.VertexData          = offPAndN;
    hdr.VertexDataSize      = totalVertexDataBytes;
    hdr.TriangleNum         = totalTriangles;
    // Unit sizes (DxLib が内部で使用、0 だと割り算で crash)
    hdr.AnimKeySetUnitSize  = static_cast<std::int32_t>(sizeof(f1::MV1_ANIM_KEYSET_F1));  // = 20
    hdr.AnimUnitSize        = static_cast<std::int32_t>(sizeof(f1::MV1_ANIM_F1));          // = 44
    hdr.TriangleListVertexNum = sumTLVertexNum;
    hdr.MeshFaceNum         = totalTriangles;
    hdr.MeshVertexIndexNum  = sumTLVertexNum;
    hdr.TriangleListIndexNum= sumTLIndexNum;
    // TriangleList の pos buffer (runtime MV1_TLIST_NORMAL_POS / SKIN_POS_4B) は
    // VertexType に応じて割り振る:
    //   NORMAL     → TriangleListNormalPositionNum
    //   SKIN_4BONE → TriangleListSkinPosition4BNum
    // 値は各 TL.VertexNum の合計 (= per-corner count 総和 = normalNum)
    if (isSkin) {
        hdr.TriangleListNormalPositionNum = 0;
        hdr.TriangleListSkinPosition4BNum = static_cast<std::int32_t>(normalNum);
    } else {
        hdr.TriangleListNormalPositionNum = static_cast<std::int32_t>(normalNum);
        hdr.TriangleListSkinPosition4BNum = 0;
    }
    // MeshPositionSize = sum(Frame.PosUnitSize × Frame.PositionNum)
    //   PosUnitSize = sizeof(MV1_MESH_POSITION:44) + (MaxBoneBlendNum - 4) × 8
    //   非 skin: MaxBoneBlendNum=0 → PosUnitSize = 44 - 32 = 12
    //   skin:    MaxBoneBlendNum=4 → PosUnitSize = 44
    const int posUnitSize = isSkin ? 44 : 12;
    hdr.MeshPositionSize    = static_cast<std::int32_t>(positionNum * posUnitSize);
    hdr.MeshNormalNum       = static_cast<std::int32_t>(normalNum);
    std::int32_t totalMeshVertexSize = 0;
    for (const auto &m : ir.meshes) {
        int vertUnit = 28;
        totalMeshVertexSize += static_cast<std::int32_t>(m.indices.size()) * vertUnit;
    }
    hdr.MeshVertexSize      = totalMeshVertexSize;
    hdr.StringSize          = static_cast<std::int32_t>(stringSize);
    hdr.StringBuffer        = offStringBuffer;

    // ====== Animation header fields ======
    if (hasAnim) {
        // AnimKeyDataSize = ファイル内 blob の byte 数
        // OriginalAnimKeyDataSize = DxLib runtime の AnimKeyData 割当 byte 数
        hdr.AnimKeyDataSize         = static_cast<std::int32_t>(animKeyDataSize);
        // round-trip 時は元値を保持 (raw blob モードでは自前計算不可のため)
        hdr.OriginalAnimKeyDataSize = ir.anim_original_keydata_size > 0
            ? static_cast<std::int32_t>(ir.anim_original_keydata_size)
            : static_cast<std::int32_t>(runtimeAnimKeyDataSize);
        hdr.AnimKeyData             = offAnimKeyData;
        hdr.AnimKeySetNum           = static_cast<std::int32_t>(ir.anim_keysets.size());
        hdr.AnimKeySet              = offAnimKeySet;
        hdr.AnimNum                 = static_cast<std::int32_t>(ir.anims.size());
        hdr.Anim                    = offAnim;
        hdr.AnimSetNum              = static_cast<std::int32_t>(ir.anim_sets.size());
        hdr.AnimSet                 = offAnimSet;
    }

    b.overwrite_struct(0, hdr);

    // ====== Linked list (DimPrev / DimNext) を全配列に張る ======
    link_array(materialOffsets);
    link_array(textureOffsets);
    link_array(meshOffsets);
    link_array(tlOffsets);
    if (isSkin) link_array(skinBoneOffsets);
    link_array(frameOffsets);  // Frame 配列も

    // ====== DXA (literal) 圧縮 + 出力組立 ======
    auto inner = std::span<const std::uint8_t>(b.buf.data() + 4, b.buf.size() - 4);
    auto dxa_block = dxa::encode(inner);

    r.bytes.reserve(4 + dxa_block.size());
    r.bytes.push_back('M'); r.bytes.push_back('V');
    r.bytes.push_back('1'); r.bytes.push_back('1');
    r.bytes.insert(r.bytes.end(), dxa_block.begin(), dxa_block.end());
    return r;
}

WriteResult save_mv1(const ModelIR &ir, const std::string &path) {
    auto r = write_mv1(ir);
    if (!r.ok()) return r;
    std::FILE *fp = std::fopen(path.c_str(), "wb");
    if (!fp) { r.error = "cannot write: " + path; return r; }
    std::fwrite(r.bytes.data(), 1, r.bytes.size(), fp);
    std::fclose(fp);
    return r;
}

}
