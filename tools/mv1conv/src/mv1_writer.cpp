#include "mv1_writer.hpp"
#include "mv1_f1.hpp"
#include "mv1_enums.hpp"
#include "dxa.hpp"
#include <algorithm>
#include <cmath>
#include <cstring>
#include <cstdio>
#include <cstdlib>
#include <map>
#include <tuple>
#include <unordered_map>

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
    // DxLib 慣用: 各 frame/mesh が ChangeInfo.Fill pointer でこのテーブルの
    // 特定オフセットを指す。最小サイズは frame/mesh 数 × 4 byte、16 byte alignment。
    // IR が round-trip 由来なら元の buffer を保持、ない場合は標準レイアウトで生成。
    auto compute_change_size = [](int n) -> std::int32_t {
        (void)n;
        // 以前の値 256 に一時戻し (blade 等 MagicID 不正 crash 調査中)
        return 256;
    };
    std::int32_t drawMatSz = ir.change_draw_material_table.empty()
        ? compute_change_size(static_cast<int>(ir.meshes.size()))
        : static_cast<std::int32_t>(ir.change_draw_material_table.size());
    std::int32_t matSz = ir.change_matrix_table.empty()
        ? compute_change_size(frameNum)
        : static_cast<std::int32_t>(ir.change_matrix_table.size());
    b.align4();
    std::uint32_t offChangeDrawMatTable = b.pos();
    if (ir.change_draw_material_table.empty()) {
        // CDMT[0] に Frame (bit 1) + Mesh (bit 2..) のビット和を書き込む。
        // 公式 cube 観測: CDMT=0x06 (Frame.CheckBit=2 | Mesh.CheckBit=4)
        std::vector<std::uint8_t> cdmt(drawMatSz, 0);
        // Frame は bit 1 (全 frame 共通の render bit?)
        if (!cdmt.empty()) cdmt[0] |= 0x02;
        // 各 mesh は bit (2 + mesh_idx)
        for (std::size_t mi = 0; mi < ir.meshes.size() && mi < 30; ++mi) {
            int bit = 2 + static_cast<int>(mi);
            cdmt[bit/8] |= static_cast<std::uint8_t>(1 << (bit % 8));
        }
        b.append_bytes(cdmt.data(), drawMatSz);
    } else {
        b.append_bytes(ir.change_draw_material_table.data(), drawMatSz);
    }
    b.align4();
    std::uint32_t offChangeMatTable = b.pos();
    if (ir.change_matrix_table.empty()) {
        // CMT: 各 frame の CheckBit を OR した値 (公式 cube: 0x02)
        std::vector<std::uint8_t> cmt(matSz, 0);
        for (int fi = 0; fi < frameNum && fi < 240; ++fi) {
            int bitAddr = fi + 1;  // CheckBit = 1 << bitAddr
            cmt[bitAddr/8] |= static_cast<std::uint8_t>(1 << (bitAddr % 8));
        }
        b.append_bytes(cmt.data(), matSz);
    } else {
        b.append_bytes(ir.change_matrix_table.data(), matSz);
    }

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

    // 各 mesh で採用する bone set (top-54 by total weight)。
    // TL.UseBone[54] 上限内に収めるため余剰は weight 0 化。
    std::vector<std::vector<std::uint16_t>> perMeshKeptBones(ir.meshes.size());
    if (isSkin) {
        for (std::size_t mi = 0; mi < ir.meshes.size(); ++mi) {
            const auto &m = ir.meshes[mi];
            std::unordered_map<int, float> boneWeightSum;
            for (const auto &vb : m.bone_weights) {
                for (int s = 0; s < 4; ++s) {
                    if (vb.bone[s] >= 0 && vb.weight[s] > 0.0f
                        && vb.bone[s] < static_cast<int>(ir.bones.size())) {
                        boneWeightSum[vb.bone[s]] += vb.weight[s];
                    }
                }
            }
            std::vector<std::pair<int,float>> sorted(boneWeightSum.begin(), boneWeightSum.end());
            std::sort(sorted.begin(), sorted.end(),
                      [](auto &a, auto &b){ return a.second > b.second; });
            if (sorted.size() > 54) {
                std::fprintf(stderr, "warning: mesh %zu uses %zu bones > 54 (DxLib max), "
                             "keeping top 54 by weight; %zu bones dropped\n",
                             mi, sorted.size(), sorted.size() - 54);
                sorted.resize(54);
            }
            auto &kept = perMeshKeptBones[mi];
            kept.reserve(sorted.size());
            for (auto &p : sorted) kept.push_back(static_cast<std::uint16_t>(p.first));
            if (kept.empty()) kept.push_back(0);  // fallback
        }
    }

    for (std::size_t mi = 0; mi < ir.meshes.size(); ++mi) {
        const auto &m = ir.meshes[mi];
        b.align4();
        meshFramePandNOff[mi] = b.pos();
        std::uint32_t pn = static_cast<std::uint32_t>(m.positions.size() / 3);
        // DxLib 慣用レイアウト: NormalNum = PositionNum (unique per-position normal)。
        // 本家は per-unique-position 単位で normal を出す (YUKARI.mv1 等で確認)。
        std::uint32_t nn = m.normals.empty() ? 0 : pn;
        meshFramePosNum[mi]    = pn;
        meshFrameNormalNum[mi] = nn;
        positionNum += pn;
        normalNum   += nn;

        // Position: float3 (unique、m.positions そのまま)
        for (float f : m.positions) b.append_bytes(&f, 4);

        // Weight block (skin 時、per-unique-position 単位)
        // bone 数 > 255 (= U8 sentinel 255 と衝突) の場合は U16 index を使用。
        // また kept bone set (≤54) に無い bone は weight 0 化 (UseBone[54] overflow 回避)。
        if (isSkin) {
            const bool useU16Idx = ir.bones.size() > 255;
            const auto &weights = m.bone_weights;
            // kept set check 用 (線形 scan で十分、最大 54 要素)
            const auto &kept = perMeshKeptBones[mi];
            auto is_kept = [&](int bi) {
                for (auto k : kept) if (static_cast<int>(k) == bi) return true;
                return false;
            };
            for (std::uint32_t v = 0; v < pn; ++v) {
                VertexBone vb;
                if (v < weights.size()) vb = weights[v];
                else { vb.bone[0] = 0; vb.weight[0] = 1.0f; }
                // 再正規化: kept でない bone を除外 + weight 合計を 1 に再スケール
                float totalKeptW = 0.0f;
                bool keepMask[4] = {false, false, false, false};
                for (int s = 0; s < 4; ++s) {
                    if (vb.bone[s] >= 0 && vb.weight[s] > 0.0f && is_kept(vb.bone[s])) {
                        keepMask[s] = true;
                        totalKeptW += vb.weight[s];
                    }
                }
                // 全 bone が dropped された場合、kept[0] に全 weight 集約
                if (totalKeptW <= 0.0f && !kept.empty()) {
                    vb.bone[0] = static_cast<int>(kept[0]);
                    vb.weight[0] = 1.0f;
                    for (int s = 1; s < 4; ++s) { vb.bone[s] = -1; vb.weight[s] = 0.0f; }
                    keepMask[0] = true;
                    totalKeptW = 1.0f;
                }
                int written = 0;
                for (int s = 0; s < 4; ++s) {
                    if (!keepMask[s]) continue;
                    if (useU16Idx) {
                        std::uint16_t idx = static_cast<std::uint16_t>(vb.bone[s]);
                        b.append_bytes(&idx, 2);
                    } else {
                        std::uint8_t idx = static_cast<std::uint8_t>(vb.bone[s]);
                        b.append_bytes(&idx, 1);
                    }
                    float w_norm = vb.weight[s] / totalKeptW;
                    std::uint8_t w = static_cast<std::uint8_t>(
                        std::clamp(static_cast<int>(w_norm * 255.0f + 0.5f), 0, 255));
                    b.append_bytes(&w, 1);
                    ++written;
                }
                // sentinel: もし 4 スロット全部埋めてないなら -1 を書き込む
                if (written < 4) {
                    if (useU16Idx) {
                        std::uint16_t s_idx = 0xFFFFu; b.append_bytes(&s_idx, 2);
                    } else {
                        std::uint8_t s_idx = 0xFFu; b.append_bytes(&s_idx, 1);
                    }
                }
            }
        }

        // Normal: S16 quantize、per-unique-position (PositionNum 個)
        if (!m.normals.empty()) {
            auto to_s16 = [](float v) -> std::int16_t {
                float c = std::clamp(v, -1.0f, 1.0f);
                return static_cast<std::int16_t>(c * 32767.0f);
            };
            for (std::uint32_t i = 0; i < pn; ++i) {
                float nx = 0, ny = 1, nz = 0;
                if (i * 3 + 2 < m.normals.size()) {
                    nx = m.normals[i * 3 + 0];
                    ny = m.normals[i * 3 + 1];
                    nz = m.normals[i * 3 + 2];
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
    // DxLib 慣用レイアウト: Mesh.VertexNum = unique vertex 数 (= PositionNum)。
    // PositionIndex / NormalIndex は identity (0..P-1)、UV は per-unique-pos。
    std::vector<std::uint32_t> meshVertexDataOffsets(ir.meshes.size());
    for (std::size_t mi = 0; mi < ir.meshes.size(); ++mi) {
        const auto &m = ir.meshes[mi];
        b.align4();
        meshVertexDataOffsets[mi] = b.pos();
        const std::size_t vn = m.positions.size() / 3;  // unique vertex count

        // Common Diffuse/Specular color (COMMON_COLOR flag 前提)。
        // 公式 cube 観測: Diffuse=0xFFFFFFFF (白)、Specular=0x00000000 (黒/無効)。
        std::uint32_t diffWhite = 0xFFFFFFFFu;
        std::uint32_t specBlack = 0x00000000u;
        b.append_bytes(&diffWhite, 4);
        b.append_bytes(&specBlack, 4);

        // vn に応じて U8/U16/U32 を選択 (Mesh.VertFlag と整合)
        const std::size_t idxSize =
            (vn <= 255)   ? 1 :
            (vn <= 65535) ? 2 : 4;
        // PositionIndex[0..vn-1] = identity
        for (std::size_t i = 0; i < vn; ++i) {
            std::uint32_t posIdx = static_cast<std::uint32_t>(i);
            b.append_bytes(&posIdx, idxSize);
        }
        // NormalIndex[0..vn-1] = identity (unique normal per position)
        if (hasNormals && !m.normals.empty()) {
            for (std::size_t i = 0; i < vn; ++i) {
                std::uint32_t nrmIdx = static_cast<std::uint32_t>(i);
                b.append_bytes(&nrmIdx, idxSize);
            }
        }
        // UV[0..vn-1]: m.uvs は per-unique-pos 既定
        for (std::size_t i = 0; i < vn; ++i) {
            float u = 0.0f, vv = 0.0f;
            if (i * 2 + 1 < m.uvs.size()) {
                u  = m.uvs[i*2+0];
                vv = m.uvs[i*2+1];
            }
            b.append_bytes(&u, 4);
            b.append_bytes(&vv, 4);
        }
        // NON_TOON_OUTLINE bits: vn bits
        std::size_t bitBytes = (vn + 7) / 8;
        for (std::size_t i = 0; i < bitBytes; ++i) {
            // Toon outline bits: 公式 cube_official が 0x00 を使用 (outline 有効)。
            // bit=0 → ToonOutLineScale=1.0, bit=1 → 0.0。非 toon material では runtime 無視だが
            // 公式に合わせる (描画影響があるかも)。
            std::uint8_t all1 = 0x00;
            b.append_bytes(&all1, 1);
        }
        while (b.pos() & 3u) {
            std::uint8_t z = 0;
            b.append_bytes(&z, 1);
        }
    }

    // ====== 9. TriangleList.MeshVertexIndexAndIndexData ======
    // TL index タイプを頂点数に応じて U8/U16/U32 で最適化 (サイズ削減)
    std::vector<std::uint16_t> tlFlagCache(ir.meshes.size());
    std::vector<std::uint32_t> tlDataOffsets(ir.meshes.size());
    for (std::size_t mi = 0; mi < ir.meshes.size(); ++mi) {
        const auto &m = ir.meshes[mi];
        b.align4();
        tlDataOffsets[mi] = b.pos();
        if (isSkin) {
            // 先に計算済 perMeshKeptBones (top-54 by weight) を再利用。
            const auto &kept = perMeshKeptBones[mi];
            std::uint16_t useBoneN = static_cast<std::uint16_t>(kept.size());
            b.append_bytes(&useBoneN, 2);
            for (std::uint16_t u : kept) {
                b.append_bytes(&u, 2);
            }
        }
        // DxLib 慣用: TL.VertexNum = 参照する mesh vertex 数 (unique)、
        //              TL.IndexNum = triangle corner 数 (per-corner)。
        const std::size_t mvn = m.positions.size() / 3;  // unique mesh vertex count
        const std::size_t idn = m.indices.size();        // triangle corner count
        auto pick_type = [](std::size_t max) {
            if (max <= 0xFFu) return e::TRILIST_INDEX_TYPE_U8;
            if (max <= 0xFFFFu) return e::TRILIST_INDEX_TYPE_U16;
            return e::TRILIST_INDEX_TYPE_U32;
        };
        // mesh vertex index type: mv 数に応じて / triangle index type: 同 mv 数 (index 値域は 0..mvn-1)
        std::uint16_t mvIdxType = pick_type(mvn);
        std::uint16_t idxType   = pick_type(mvn);
        tlFlagCache[mi] = static_cast<std::uint16_t>(mvIdxType | (idxType << 2));

        auto write_idx = [&](std::uint32_t v, std::uint16_t t) {
            if (t == e::TRILIST_INDEX_TYPE_U8) {
                std::uint8_t b8 = static_cast<std::uint8_t>(v); b.append_bytes(&b8, 1);
            } else if (t == e::TRILIST_INDEX_TYPE_U16) {
                std::uint16_t w = static_cast<std::uint16_t>(v); b.append_bytes(&w, 2);
            } else {
                b.append_bytes(&v, 4);
            }
        };

        // MeshVertexIndex[0..mvn-1] = identity (TL uses all mesh vertices)
        for (std::size_t i = 0; i < mvn; ++i) write_idx(static_cast<std::uint32_t>(i), mvIdxType);
        // Index[0..idn-1] = m.indices[i] (triangle corner → TL vertex = mesh vertex)
        for (std::size_t i = 0; i < idn; ++i) write_idx(m.indices[i], idxType);
        while (b.pos() & 3u) { std::uint8_t z = 0; b.append_bytes(&z, 1); }
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
    std::vector<std::uint32_t> shapeNameOff(ir.shapes.size());
    for (std::size_t i = 0; i < ir.shapes.size(); ++i)
        shapeNameOff[i] = strings.add(ir.shapes[i].name);
    std::vector<std::uint32_t> rigidNameOff(ir.physics_rigid_bodies.size());
    for (std::size_t i = 0; i < ir.physics_rigid_bodies.size(); ++i)
        rigidNameOff[i] = strings.add(ir.physics_rigid_bodies[i].name);
    std::vector<std::uint32_t> jointNameOff(ir.physics_joints.size());
    for (std::size_t i = 0; i < ir.physics_joints.size(); ++i)
        jointNameOff[i] = strings.add(ir.physics_joints[i].name);

    // ====== Shape (blend shape / morph) blobs ======
    // layout: MV1_SHAPE_VERTEX_F1[] (flat、全 shape × 全 mesh) →
    //         MV1_SHAPE_MESH_F1[] (各 SHAPE_VERTEX 区間の先頭を指す) →
    //         MV1_SHAPE_F1[] (各 MV1_SHAPE_MESH_F1 の先頭を指す) →
    //         MV1_FRAME_SHAPE_F1 (root frame 用、全 shape を指す) →
    //         MV1_FILEHEAD_SHAPE_F1 (集計値)
    std::uint32_t offFileHeadShape = 0;
    std::uint32_t offFrameShapeArrForRoot = 0;  // rootFrame.FrameShape に流す
    std::uint32_t totalShapeVertexNum = 0;
    std::uint32_t totalShapeMeshNum = 0;
    std::uint32_t offFileHeadPhysics = 0;
    // どの mesh が shape に参照されているか事前計算 (MV1_MESH_F1.Shape flag 兼、
    // FILEHEAD_SHAPE の TargetMeshVertexNum / SkinPosition4BNum 集計に使用)
    std::vector<std::uint8_t> meshHasShape(ir.meshes.size(), 0);
    for (const auto &sh : ir.shapes) {
        for (const auto &sm : sh.meshes) {
            if (sm.target_mesh < ir.meshes.size()) meshHasShape[sm.target_mesh] = 1;
        }
    }
    if (!ir.shapes.empty()) {
        // SHAPE_VERTEX 配列 (全 shape × 全 mesh の vertex を連結)
        std::vector<std::uint32_t> shapeMeshVertexOff;  // 各 ShapeMeshIR 先頭の offset
        shapeMeshVertexOff.reserve(ir.shapes.size() * 4);  // 概算

        b.align4();
        std::uint32_t offShapeVertices = b.pos();
        for (const auto &sh : ir.shapes) {
            for (const auto &sm : sh.meshes) {
                shapeMeshVertexOff.push_back(b.pos());
                for (const auto &sv : sm.vertices) {
                    f1::MV1_SHAPE_VERTEX_F1 v{};
                    v.TargetMeshVertex = static_cast<std::int32_t>(sv.target_mesh_vertex);
                    v.Position = { sv.dp[0], sv.dp[1], sv.dp[2] };
                    v.Normal   = { sv.dn[0], sv.dn[1], sv.dn[2] };
                    b.append_struct(v);
                    ++totalShapeVertexNum;
                }
            }
        }
        (void)offShapeVertices;

        // SHAPE_MESH 配列
        b.align4();
        std::uint32_t offShapeMeshArr = b.pos();
        std::vector<std::uint32_t> shapeMeshOffs;
        std::size_t smFlatIdx = 0;
        for (const auto &sh : ir.shapes) {
            for (const auto &sm : sh.meshes) {
                f1::MV1_SHAPE_MESH_F1 smF1{};
                smF1.Index = static_cast<std::int32_t>(shapeMeshOffs.size());
                // TargetMesh は MV1_MESH_F1 オフセット
                if (sm.target_mesh < ir.meshes.size())
                    smF1.TargetMesh = meshOffsets[sm.target_mesh];
                smF1.IsVertexPress = 0;
                smF1.VertexPressParam = 0;
                smF1.VertexNum = static_cast<std::uint32_t>(sm.vertices.size());
                smF1.Vertex = shapeMeshVertexOff[smFlatIdx];
                shapeMeshOffs.push_back(b.append_struct(smF1));
                ++smFlatIdx;
                ++totalShapeMeshNum;
            }
        }

        // SHAPE_MESH DimPrev/DimNext
        for (std::size_t i = 0; i < shapeMeshOffs.size(); ++i) {
            std::uint32_t prev = (i == 0) ? 0u : shapeMeshOffs[i - 1];
            std::uint32_t next = (i + 1 < shapeMeshOffs.size()) ? shapeMeshOffs[i + 1] : 0u;
            b.overwrite_u32(shapeMeshOffs[i] + 0, prev);
            b.overwrite_u32(shapeMeshOffs[i] + 4, next);
        }

        // SHAPE 配列
        b.align4();
        std::uint32_t offShapeArr = b.pos();
        std::vector<std::uint32_t> shapeOffs;
        std::size_t meshRunIdx = 0;
        for (std::size_t si = 0; si < ir.shapes.size(); ++si) {
            const auto &sh = ir.shapes[si];
            f1::MV1_SHAPE_F1 sF1{};
            sF1.Name = shapeNameOff[si];
            sF1.Index = static_cast<std::int32_t>(si);
            // Container: root 既定。frame[0] (root if skin, mesh[0] if static) へのポインタ
            sF1.Container = frameOffsets[0];
            sF1.MeshNum = static_cast<std::int32_t>(sh.meshes.size());
            sF1.Mesh = sh.meshes.empty() ? 0u : shapeMeshOffs[meshRunIdx];
            meshRunIdx += sh.meshes.size();
            shapeOffs.push_back(b.append_struct(sF1));
        }
        // SHAPE DimPrev/DimNext
        for (std::size_t i = 0; i < shapeOffs.size(); ++i) {
            std::uint32_t prev = (i == 0) ? 0u : shapeOffs[i - 1];
            std::uint32_t next = (i + 1 < shapeOffs.size()) ? shapeOffs[i + 1] : 0u;
            b.overwrite_u32(shapeOffs[i] + 0, prev);
            b.overwrite_u32(shapeOffs[i] + 4, next);
        }

        // FRAME_SHAPE: 全 shape を 1 frame にアタッチ (root frame [0])
        b.align4();
        offFrameShapeArrForRoot = b.pos();
        {
            f1::MV1_FRAME_SHAPE_F1 fs{};
            fs.ShapeNum = static_cast<std::int32_t>(ir.shapes.size());
            fs.Shape = shapeOffs.empty() ? 0u : shapeOffs[0];
            b.append_struct(fs);
        }

        // FILEHEAD_SHAPE
        // DxLib は buffer 確保に Shape* 集計値を使う (DxModel.cpp L13268 付近)。
        // 計算: 各 shape-affected mesh について
        //   TargetMeshVertexNum += mesh.VertexNum (per-corner)
        //   skin なら SkinPosition4BNum += TL.VertexNum
        //   static なら NormalPositionNum += TL.VertexNum
        std::int32_t shapeTargetMeshVN = 0;
        std::int32_t shapeSkin4BNum = 0;
        std::int32_t shapeNormalPosNum = 0;
        for (std::size_t mi = 0; mi < ir.meshes.size(); ++mi) {
            if (!meshHasShape[mi]) continue;
            const auto &m = ir.meshes[mi];
            // DxLib の L13544 等が参照するのは TL.VertexNum (= unique 頂点数)
            std::int32_t vn = static_cast<std::int32_t>(m.positions.size() / 3);
            shapeTargetMeshVN += vn;
            if (isSkin) shapeSkin4BNum += vn;
            else        shapeNormalPosNum += vn;
        }

        b.align4();
        offFileHeadShape = b.pos();
        f1::MV1_FILEHEAD_SHAPE_F1 fh{};
        fh.FrameNum = 1;
        fh.Frame    = offFrameShapeArrForRoot;
        fh.DataNum  = static_cast<std::int32_t>(ir.shapes.size());
        fh.Data     = offShapeArr;
        fh.MeshNum  = static_cast<std::int32_t>(totalShapeMeshNum);
        fh.Mesh     = offShapeMeshArr;
        fh.VertexNum = static_cast<std::int32_t>(totalShapeVertexNum);
        fh.Vertex   = offShapeVertices;
        fh.PressVertexDataSize = 0;
        fh.PressVertexData = 0;
        fh.TargetMeshVertexNum = shapeTargetMeshVN;
        fh.ShapeVertexUnitSize = static_cast<std::int32_t>(sizeof(f1::MV1_SHAPE_VERTEX_F1));
        fh.NormalPositionNum = shapeNormalPosNum;
        fh.SkinPosition4BNum = shapeSkin4BNum;
        fh.SkinPosition8BNum = 0;
        fh.SkinPositionFREEBSize = 0;
        b.append_struct(fh);
    }

    // ====== Physics (rigid bodies + joints) ======
    if (!ir.physics_rigid_bodies.empty() || !ir.physics_joints.empty()) {
        // RigidBody array
        b.align4();
        std::uint32_t offRigids = b.pos();
        std::vector<std::uint32_t> rigidOffs(ir.physics_rigid_bodies.size());
        for (std::size_t i = 0; i < ir.physics_rigid_bodies.size(); ++i) {
            const auto &rb = ir.physics_rigid_bodies[i];
            f1::MV1_PHYSICS_RIGIDBODY_F1 rf{};
            rf.Name = rigidNameOff[i];
            rf.Index = static_cast<std::int32_t>(i);
            // TargetFrame: bone → Frame[bonesBaseIdx + bone] の offset (skin 時)
            if (rb.target_bone >= 0 && isSkin) {
                rf.TargetFrame = frameOffsets[bonesBaseIdx + rb.target_bone];
            }
            rf.RigidBodyGroupIndex = rb.group_index;
            rf.RigidBodyGroupTarget = rb.group_target;
            rf.ShapeType = rb.shape_type;
            rf.ShapeW = rb.shape_w;
            rf.ShapeH = rb.shape_h;
            rf.ShapeD = rb.shape_d;
            rf.Position = { rb.position[0], rb.position[1], rb.position[2] };
            rf.Rotation = { rb.rotation[0], rb.rotation[1], rb.rotation[2] };
            rf.RigidBodyWeight = rb.weight;
            rf.RigidBodyPosDim = rb.pos_dim;
            rf.RigidBodyRotDim = rb.rot_dim;
            rf.RigidBodyRecoil = rb.recoil;
            rf.RigidBodyFriction = rb.friction;
            rf.RigidBodyType = rb.body_type;
            rigidOffs[i] = b.append_struct(rf);
        }
        for (std::size_t i = 0; i < rigidOffs.size(); ++i) {
            std::uint32_t prev = (i == 0) ? 0u : rigidOffs[i - 1];
            std::uint32_t next = (i + 1 < rigidOffs.size()) ? rigidOffs[i + 1] : 0u;
            b.overwrite_u32(rigidOffs[i] + 0, prev);
            b.overwrite_u32(rigidOffs[i] + 4, next);
        }

        // Joint array
        b.align4();
        std::uint32_t offJoints = b.pos();
        std::vector<std::uint32_t> jointOffs(ir.physics_joints.size());
        for (std::size_t i = 0; i < ir.physics_joints.size(); ++i) {
            const auto &jt = ir.physics_joints[i];
            f1::MV1_PHYSICS_JOINT_F1 jf{};
            jf.Name = jointNameOff[i];
            jf.Index = static_cast<std::int32_t>(i);
            if (jt.rigid_a >= 0 && jt.rigid_a < static_cast<int>(rigidOffs.size()))
                jf.RigidBodyA = rigidOffs[jt.rigid_a];
            if (jt.rigid_b >= 0 && jt.rigid_b < static_cast<int>(rigidOffs.size()))
                jf.RigidBodyB = rigidOffs[jt.rigid_b];
            jf.Position = { jt.position[0], jt.position[1], jt.position[2] };
            jf.Rotation = { jt.rotation[0], jt.rotation[1], jt.rotation[2] };
            jf.ConstrainPosition1 = { jt.constrain_pos_1[0], jt.constrain_pos_1[1], jt.constrain_pos_1[2] };
            jf.ConstrainPosition2 = { jt.constrain_pos_2[0], jt.constrain_pos_2[1], jt.constrain_pos_2[2] };
            jf.ConstrainRotation1 = { jt.constrain_rot_1[0], jt.constrain_rot_1[1], jt.constrain_rot_1[2] };
            jf.ConstrainRotation2 = { jt.constrain_rot_2[0], jt.constrain_rot_2[1], jt.constrain_rot_2[2] };
            jf.SpringPosition = { jt.spring_pos[0], jt.spring_pos[1], jt.spring_pos[2] };
            jf.SpringRotation = { jt.spring_rot[0], jt.spring_rot[1], jt.spring_rot[2] };
            jointOffs[i] = b.append_struct(jf);
        }
        for (std::size_t i = 0; i < jointOffs.size(); ++i) {
            std::uint32_t prev = (i == 0) ? 0u : jointOffs[i - 1];
            std::uint32_t next = (i + 1 < jointOffs.size()) ? jointOffs[i + 1] : 0u;
            b.overwrite_u32(jointOffs[i] + 0, prev);
            b.overwrite_u32(jointOffs[i] + 4, next);
        }

        // FILEHEAD_PHYSICS
        b.align4();
        offFileHeadPhysics = b.pos();
        f1::MV1_FILEHEAD_PHYSICS_F1 ph{};
        ph.WorldGravity = ir.physics_gravity;
        ph.RigidBodyNum = static_cast<std::int32_t>(ir.physics_rigid_bodies.size());
        ph.RigidBody = ir.physics_rigid_bodies.empty() ? 0u : offRigids;
        ph.JointNum = static_cast<std::int32_t>(ir.physics_joints.size());
        ph.Joint = ir.physics_joints.empty() ? 0u : offJoints;
        b.append_struct(ph);
    }

    // ====== Animation blobs (存在時のみ) ======
    // layout: AnimKeyData blob (全 keyset の time+value を連結)
    //         → MV1_ANIM_KEYSET_F1 配列
    //         → MV1_ANIM_F1 配列
    //         → MV1_ANIMSET_F1 配列
    // 各 F1 の相対ポインタは全てファイル先頭からの byte offset。
    const bool hasAnim = !std::getenv("MV1CONV_STRIP_ANIM") &&
                         !ir.anim_sets.empty() && !ir.anims.empty() && !ir.anim_keysets.empty();
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
            // DataType == SHAPE 時は先頭に WORD TargetShapeIndex
            if (ks.data_type == AnimKeySetIR::DT_SHAPE) {
                std::uint16_t tsi = static_cast<std::uint16_t>(
                    ks.target_shape_index >= 0 ? ks.target_shape_index : 0);
                b.append_bytes(&tsi, 2);
            }
            // KeyData layout (最もシンプル): [DWORD Num] [float×N time] [keyVals...]
            std::uint32_t n = static_cast<std::uint32_t>(ks.key_times.size());
            b.append_bytes(&n, 4);
            for (float t : ks.key_times) b.append_bytes(&t, 4);
            for (float v : ks.key_values) b.append_bytes(&v, 4);
            b.align4();

            int val_size = 4;  // LINEAR / FLAT default
            if (ks.key_type == AnimKeySetIR::KT_VECTOR)              val_size = 12;
            else if (ks.key_type == AnimKeySetIR::KT_QUATERNION_X)   val_size = 16;
            else if (ks.key_type == AnimKeySetIR::KT_QUATERNION_VMD) val_size = 16;
            else if (ks.key_type == AnimKeySetIR::KT_MATRIX3X3)      val_size = 36;
            else if (ks.key_type == AnimKeySetIR::KT_MATRIX4X4C)     val_size = 48;
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

    // ChangeInfo 設定ヘルパ: 各 frame/mesh に対し、table 内の位置を BitAddress で計算。
    // DxLib 本家 MV1ChangeInfoSetup (DxModel.cpp L5191) 準拠。
    auto set_change_info = [](f1::MV1_CHANGE_F1 &ci, std::uint32_t tableOff,
                              int bitAddress, int fillBitNum) {
        ci.Target   = static_cast<std::uint32_t>(bitAddress / 32);
        ci.CheckBit = static_cast<std::uint32_t>(1u << (bitAddress % 32));
        ci.Size     = static_cast<std::uint32_t>(
            ((bitAddress % 32) + fillBitNum + 31) / 32);
        ci.Fill     = tableOff;
    };

    // -- Frame[0] (root、skin 時のみ) --
    if (isSkin) {
        f1::MV1_FRAME_F1 rootFrame{};
        rootFrame.Name  = nameFrame0;  // "root" または ""
        rootFrame.Index = 0;
        rootFrame.Scale = { 1.0f, 1.0f, 1.0f };
        rootFrame.Quaternion = { 0.0f, 0.0f, 0.0f, 1.0f };
        rootFrame.Flag  = 0x01;  // MV1_FRAMEFLAG_VISIBLE (描画必須!)
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
        rootFrame.FrameShape = offFrameShapeArrForRoot;  // skin: root に shape attach
        // ChangeInfo: 一旦無効 (設定すると DxLib 実ロードで segfault するケースあり、継続調査)
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
        mf.Flag  = 0x01;  // MV1_FRAMEFLAG_VISIBLE (描画必須!)
        mf.Parent = isSkin ? frameOffsets[0] : 0u;  // skin は root に、static は top-level
        // Prev/Next sibling chain (DxLib 本家 save multi.x 観測): 同じ親を持つ兄弟をリンク
        // static: top-level 兄弟として全 mesh frame をリンク
        // skin:   root 下の兄弟として mesh frames をリンク
        mf.Prev = (mi == 0) ? 0u : frameOffsets[firstMeshFrameIdx + mi - 1];
        mf.Next = (mi + 1 == ir.meshes.size()) ? 0u : frameOffsets[firstMeshFrameIdx + mi + 1];
        // static model: 最初の mesh frame (= Frame[0]) に shape をアタッチ
        if (!isSkin && mi == 0) mf.FrameShape = offFrameShapeArrForRoot;
        mf.TotalMeshNum = 1;
        mf.MeshNum = 1;
        mf.Mesh = meshOffsets[mi];
        mf.VertexNum   = static_cast<std::int32_t>(m.positions.size() / 3);  // TL vertex count (unique)
        mf.TriangleNum = static_cast<std::int32_t>(m.indices.size() / 3);
        mf.PositionNum = static_cast<std::int32_t>(meshFramePosNum[mi]);
        mf.NormalNum   = static_cast<std::int32_t>(meshFrameNormalNum[mi]);
        mf.PositionAndNormalData = meshFramePandNOff[mi];
        if (isSkin) {
            const std::uint16_t idxBit = (ir.bones.size() > 255)
                ? e::FRAME_VERT_FLAG_MATRIX_INDEX_MASK : 0;
            mf.VertFlag = static_cast<std::uint16_t>(
                idxBit |
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
        {
            int frameIdx = static_cast<int>(firstMeshFrameIdx + mi);
            int bitAddr = frameIdx + 1;
            // ChangeInfo: static のみ設定 (skin + bone + mesh フレーム全設定は crash するので一旦 static only)
            if (!isSkin) {
                set_change_info(mf.ChangeDrawMaterialInfo,
                                offChangeDrawMatTable, bitAddr, 1);
                set_change_info(mf.ChangeMatrixInfo,
                                offChangeMatTable, bitAddr, 1);
            } else {
                (void)bitAddr;
            }
        }
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
            bf.Flag = 0x01;  // MV1_FRAMEFLAG_VISIBLE
            // Parent: -1 → Frame[0] (root)、それ以外 → Frame[bone.parent + bonesBaseIdx]
            std::uint32_t parentOff = (bir.parent < 0)
                                      ? frameOffsets[0]
                                      : frameOffsets[bir.parent + bonesBaseIdx];
            bf.Parent = parentOff;
            // 全 frame は共有 PandN ポインタを持つ (DxChara 準拠)
            bf.PositionAndNormalData = offPAndN;
            {
                int frameIdx = static_cast<int>(bi + bonesBaseIdx);
                int bitAddr = frameIdx + 1;
                // Temporarily disabled: skin load segfault 調査中
                (void)bitAddr;
                (void)offChangeDrawMatTable;
                (void)offChangeMatTable;
            }
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

    // -- Lights --
    std::vector<std::uint32_t> lightNameOff(ir.lights.size());
    for (std::size_t i = 0; i < ir.lights.size(); ++i)
        lightNameOff[i] = strings.add(ir.lights[i].name);
    std::vector<std::uint32_t> lightOffs(ir.lights.size());
    std::uint32_t offLightArr = 0;
    if (!ir.lights.empty()) {
        b.align4();
        offLightArr = b.pos();
        for (std::size_t i = 0; i < ir.lights.size(); ++i) {
            const auto &l = ir.lights[i];
            f1::MV1_LIGHT_F1 lf{};
            lf.Name = lightNameOff[i];
            lf.Index = static_cast<std::int32_t>(i);
            lf.FrameIndex = (l.target_bone >= 0 && isSkin)
                ? static_cast<std::int32_t>(bonesBaseIdx + l.target_bone)
                : 0;
            lf.Type = l.type;
            std::memcpy(&lf.Diffuse,  l.diffuse.data(),  16);
            std::memcpy(&lf.Specular, l.specular.data(), 16);
            std::memcpy(&lf.Ambient,  l.ambient.data(),  16);
            lf.Range = l.range;
            lf.Falloff = l.falloff;
            lf.Attenuation0 = l.attenuation0;
            lf.Attenuation1 = l.attenuation1;
            lf.Attenuation2 = l.attenuation2;
            lf.Theta = l.theta;
            lf.Phi   = l.phi;
            lightOffs[i] = b.append_struct(lf);
        }
        for (std::size_t i = 0; i < lightOffs.size(); ++i) {
            std::uint32_t prev = (i == 0) ? 0u : lightOffs[i - 1];
            std::uint32_t next = (i + 1 < lightOffs.size()) ? lightOffs[i + 1] : 0u;
            b.overwrite_u32(lightOffs[i] + 0, prev);
            b.overwrite_u32(lightOffs[i] + 4, next);
        }
    }

    // -- ToonInfo blocks (is_toon=true の material のみ) --
    std::vector<std::uint32_t> toonInfoOff(ir.materials.size(), 0);
    for (std::size_t i = 0; i < ir.materials.size(); ++i) {
        const auto &m = ir.materials[i];
        if (!m.is_toon) continue;
        b.align4();
        f1::MV1_MATERIAL_TOON_F1 tn{};
        tn.Type = 1;  // DX_MATERIAL_TYPE_TOON
        tn.DiffuseGradTexture  = m.toon_diffuse_grad_texture;
        tn.SpecularGradTexture = m.toon_specular_grad_texture;
        tn.DiffuseGradBlendType  = m.toon_diffuse_grad_blend;
        tn.SpecularGradBlendType = m.toon_specular_grad_blend;
        tn.OutLineWidth    = m.toon_outline_width;
        std::memcpy(&tn.OutLineColor, m.toon_outline_color.data(), 16);
        tn.OutLineDotWidth = m.toon_outline_dot_width;
        tn.EnableSphereMap    = m.toon_enable_sphere_map;
        tn.SphereMapBlendType = m.toon_sphere_map_blend;
        tn.SphereMapTexture   = static_cast<std::int16_t>(m.toon_sphere_map_texture);
        toonInfoOff[i] = b.append_struct(tn);
    }

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
        // Blend mode / alpha test (IR に値があれば使用、無ければ DxLib default)
        mat.DrawBlendMode  = (m.draw_blend_mode != 0 || m.draw_blend_param != 0)
                             ? m.draw_blend_mode : 1;   // 1 = NOBLEND default
        mat.DrawBlendParam = (m.draw_blend_mode != 0 || m.draw_blend_param != 0)
                             ? m.draw_blend_param : 255;
        mat.UseAlphaTest = m.use_alpha_test;
        mat.AlphaFunc    = m.alpha_func;
        mat.AlphaRef     = m.alpha_ref;
        if (m.diffuse_texture >= 0) {
            mat.DiffuseLayerNum = 1;
            mat.DiffuseLayer[0].Texture = m.diffuse_texture;
            mat.DiffuseLayer[0].BlendType = m.diffuse_layer_blend;
        }
        if (m.specular_texture >= 0) {
            mat.SpecularLayerNum = 1;
            mat.SpecularLayer[0].Texture = m.specular_texture;
            mat.SpecularLayer[0].BlendType = m.specular_layer_blend;
        }
        if (m.normal_texture >= 0) {
            mat.NormalLayerNum = 1;
            mat.NormalLayer[0].Texture = m.normal_texture;
            mat.NormalLayer[0].BlendType = m.normal_layer_blend;
        }
        mat.ToonInfo = toonInfoOff[i];
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
        mesh.Shape = meshHasShape[i];
        // Mesh.Container = このメッシュ専用の frame (Frame[1..M])
        mesh.Container = frameOffsets[firstMeshFrameIdx + i];
        if (m.material >= 0 && m.material < static_cast<int>(ir.materials.size()))
            mesh.Material = materialOffsets[m.material];
        // Mesh.ChangeInfo: cube_official 観測準拠。Fill=0 固定、CheckBit は
        // mesh index + 2 (bit 2 以降)。Size=1。UseVertexDiffuseColor=1 も必須。
        {
            int bitAddr = 2 + static_cast<int>(i);
            mesh.ChangeInfo.Target   = static_cast<std::uint32_t>(bitAddr / 32);
            mesh.ChangeInfo.CheckBit = 1u << (bitAddr % 32);
            mesh.ChangeInfo.Size     = 1;
            mesh.ChangeInfo.Fill     = 0;
        }
        mesh.UseVertexDiffuseColor  = 1;   // 公式 cube で 1 観測 — 描画可視化に必要
        mesh.UseVertexSpecularColor = 0;
        mesh.NotOneDiffuseAlpha     = 0;
        mesh.TriangleListNum = 1;
        mesh.TriangleList = tlOffsets[i];
        mesh.Visible = 1;
        mesh.BackCulling = 1;
        // DxLib は UVSet を 1 以上を期待する模様 (UV なし mesh でも 1 set × 2 comp)
        mesh.UVSetUnitNum = 1;
        mesh.UVUnitNum    = 2;
        // DxLib 慣用: Mesh.VertexNum = unique vertex 数 (PositionNum と同じ)、
        //              Mesh.FaceNum = triangle 数。
        const std::int32_t meshVN = static_cast<std::int32_t>(m.positions.size() / 3);
        // Index type 選定: vn 数 (unique) に応じて
        // DxLib 公式 cube は 8 頂点で U8 index を使用。vn に応じて U8/U16/U32 を選択。
        const std::uint32_t idxType =
            (meshVN <= 255)   ? e::MESH_VERT_INDEX_TYPE_U8  :
            (meshVN <= 65535) ? e::MESH_VERT_INDEX_TYPE_U16 :
                                e::MESH_VERT_INDEX_TYPE_U32;
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
        mesh.VertexNum = meshVN;
        mesh.FaceNum   = static_cast<std::int32_t>(m.indices.size() / 3);
        mesh.VertexData = meshVertexDataOffsets[i];
        b.overwrite_struct(meshOffsets[i], mesh);
    }

    // -- TriangleLists --
    // DxLib 慣用: TL.VertexNum = unique 頂点数 (= mesh vertex), TL.IndexNum = 3 × triangle。
    std::int32_t sumTLVertexNum = 0, sumTLIndexNum = 0;
    for (std::size_t i = 0; i < ir.meshes.size(); ++i) {
        const auto &m = ir.meshes[i];
        f1::MV1_TRIANGLE_LIST_F1 tl{};
        tl.Index = static_cast<std::int32_t>(i);
        tl.Container = meshOffsets[i];
        tl.VertexType = isSkin ? e::VERTEX_TYPE_SKIN_4BONE : e::VERTEX_TYPE_NORMAL;
        tl.Flag = tlFlagCache[i];
        const std::size_t mvn = m.positions.size() / 3;
        const std::size_t idn = m.indices.size();
        tl.VertexNum = static_cast<std::uint16_t>(std::min<std::size_t>(mvn, 0xFFFFu));
        tl.IndexNum  = static_cast<std::uint16_t>(std::min<std::size_t>(idn, 0xFFFFu));
        tl.MeshVertexIndexAndIndexData = tlDataOffsets[i];
        b.overwrite_struct(tlOffsets[i], tl);
        sumTLVertexNum += tl.VertexNum;
        sumTLIndexNum  += tl.IndexNum;
    }

    // -- Header 最終埋め込み --
    hdr.ChangeDrawMaterialTableSize = drawMatSz;
    hdr.ChangeDrawMaterialTable     = offChangeDrawMatTable;
    hdr.ChangeMatrixTableSize       = matSz;
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
    hdr.LightNum            = static_cast<std::int32_t>(ir.lights.size());
    hdr.Light               = offLightArr;
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
    // MeshVertexSize = sum(Mesh.VertexNum × 28) — 28 bytes = MV1_MESH_VERTEX runtime struct
    std::int32_t totalMeshVertexSize = 0;
    for (const auto &m : ir.meshes) {
        int vertUnit = 28;
        totalMeshVertexSize += static_cast<std::int32_t>(m.positions.size() / 3) * vertUnit;
    }
    hdr.MeshVertexSize      = totalMeshVertexSize;
    hdr.StringSize          = static_cast<std::int32_t>(stringSize);
    hdr.StringBuffer        = offStringBuffer;

    // Shape / Physics section pointers
    hdr.Shape = offFileHeadShape;
    hdr.Physics = offFileHeadPhysics;

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
