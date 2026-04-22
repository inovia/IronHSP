#include "mv1_writer.hpp"
#include "mv1_f1.hpp"
#include "mv1_enums.hpp"
#include "dxa.hpp"
#include <cstring>
#include <cstdio>

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

    // ====== 2. トップレベル 1 フレーム (全メッシュを子として持つ) ======
    // シンプルのため Frame[0] のみ (hierarchy なし、全メッシュ直結)
    b.align4();
    std::uint32_t offFrame = b.append_zero(sizeof(f1::MV1_FRAME_F1));

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

    // ====== 7. PositionAndNormalData (Frame[0]) ======
    // 全メッシュの positions/normals を連結 (mesh ごとに個別 frame を持たせる設計も
    // あるが、ここでは 1 frame で全部保持する簡素版)
    std::vector<float> allPositions, allNormals;
    std::vector<std::uint32_t> meshPosBase(ir.meshes.size()), meshNrmBase(ir.meshes.size());
    bool hasNormals = false;
    for (std::size_t mi = 0; mi < ir.meshes.size(); ++mi) {
        const auto &m = ir.meshes[mi];
        meshPosBase[mi] = static_cast<std::uint32_t>(allPositions.size() / 3);
        allPositions.insert(allPositions.end(), m.positions.begin(), m.positions.end());
        if (!m.normals.empty()) {
            hasNormals = true;
            meshNrmBase[mi] = static_cast<std::uint32_t>(allNormals.size() / 3);
            allNormals.insert(allNormals.end(), m.normals.begin(), m.normals.end());
        }
    }
    b.align4();
    std::uint32_t offPAndN = b.pos();
    // 位置: float32
    for (float f : allPositions) b.append_bytes(&f, 4);
    // weights block はスキニング無しなのでスキップ (VertFlag で WEIGHT_NONE)
    // 法線: float32
    for (float f : allNormals) b.append_bytes(&f, 4);

    std::uint32_t positionNum = static_cast<std::uint32_t>(allPositions.size() / 3);
    std::uint32_t normalNum   = static_cast<std::uint32_t>(allNormals.size() / 3);

    // ====== 8. Mesh.VertexData (mesh ごと) ======
    // 各メッシュの頂点ごとに pos index (u32) + nrm index (u32) + (optional UV)
    std::vector<std::uint32_t> meshVertexDataOffsets(ir.meshes.size());
    for (std::size_t mi = 0; mi < ir.meshes.size(); ++mi) {
        const auto &m = ir.meshes[mi];
        b.align4();
        meshVertexDataOffsets[mi] = b.pos();
        const std::size_t vn = m.positions.size() / 3;

        // COMMON_COLOR なし、頂点カラーなしにしたいので COMMON_COLOR を立てて白×2 を先頭配置
        // (per-vertex color の場合は vn * 8 byte 必要で要追加実装)
        std::uint32_t white = 0xFFFFFFFFu;
        b.append_bytes(&white, 4);
        b.append_bytes(&white, 4);

        // pos index (u32)
        for (std::size_t v = 0; v < vn; ++v) {
            std::uint32_t idx = meshPosBase[mi] + static_cast<std::uint32_t>(v);
            b.append_bytes(&idx, 4);
        }
        // nrm index (u32)
        if (hasNormals && !m.normals.empty()) {
            for (std::size_t v = 0; v < vn; ++v) {
                std::uint32_t idx = meshNrmBase[mi] + static_cast<std::uint32_t>(v);
                b.append_bytes(&idx, 4);
            }
        }
        // 頂点カラー: COMMON_COLOR 立っているので省略
        // UV: 1 set × 2 comp (U,V)
        if (!m.uvs.empty()) {
            for (std::size_t v = 0; v < vn; ++v) {
                float u = m.uvs[v*2+0];
                float vv = m.uvs[v*2+1];
                b.append_bytes(&u, 4);
                b.append_bytes(&vv, 4);
            }
        }
    }

    // ====== 9. TriangleList.MeshVertexIndexAndIndexData ======
    std::vector<std::uint32_t> tlDataOffsets(ir.meshes.size());
    for (std::size_t mi = 0; mi < ir.meshes.size(); ++mi) {
        const auto &m = ir.meshes[mi];
        b.align4();
        tlDataOffsets[mi] = b.pos();
        // NORMAL vertex type はボーン情報先頭ブロックなし
        // tl.VertexNum = m の頂点数 (mesh vertex index は 0..VertexNum-1 恒等)
        const std::size_t vn = m.positions.size() / 3;
        // mesh vertex index (u32)
        for (std::size_t v = 0; v < vn; ++v) {
            std::uint32_t idx = static_cast<std::uint32_t>(v);
            b.append_bytes(&idx, 4);
        }
        // index (u32) = triangle list のインデックス
        for (std::uint32_t idx : m.indices) {
            b.append_bytes(&idx, 4);
        }
    }

    // ====== 10. StringBuffer ======
    // マテリアル/テクスチャ/フレーム名をプール
    std::uint32_t nameFrame0 = strings.add("root");
    std::vector<std::uint32_t> matName(ir.materials.size());
    for (std::size_t i = 0; i < ir.materials.size(); ++i)
        matName[i] = strings.add(ir.materials[i].name);
    std::vector<std::uint32_t> texName(ir.textures.size()),
                               texColorPath(ir.textures.size());
    for (std::size_t i = 0; i < ir.textures.size(); ++i) {
        texName[i]      = strings.add(ir.textures[i].name);
        texColorPath[i] = strings.add(ir.textures[i].color_path);
    }

    b.align4();
    std::uint32_t offStringBuffer = b.pos();
    b.append_bytes(strings.bytes().data(), strings.bytes().size());
    std::uint32_t stringSize = static_cast<std::uint32_t>(strings.bytes().size());

    // ====== すべての *_F1 構造体を埋めて上書き ======
    // -- Frame[0] --
    f1::MV1_FRAME_F1 frame{};
    frame.Name  = nameFrame0;
    frame.Index = 0;
    frame.Scale = { 1.0f, 1.0f, 1.0f };
    frame.Quaternion = { 0.0f, 0.0f, 0.0f, 1.0f };
    frame.Flag  = 0;
    frame.TotalMeshNum = static_cast<std::int32_t>(ir.meshes.size());
    frame.MeshNum = static_cast<std::int32_t>(ir.meshes.size());
    frame.Mesh = offMesh;
    frame.VertexNum = positionNum;
    // TriangleNum: ir 全体 sum
    std::int32_t totalTriangles = 0;
    for (const auto &m : ir.meshes) totalTriangles += static_cast<std::int32_t>(m.indices.size() / 3);
    frame.TriangleNum = totalTriangles;
    frame.PositionNum = static_cast<std::int32_t>(positionNum);
    frame.NormalNum   = static_cast<std::int32_t>(normalNum);
    frame.PositionAndNormalData = offPAndN;
    // VertFlag: WEIGHT_NONE + NORMAL_TYPE_F32 (if any)
    frame.VertFlag = e::FRAME_VERT_FLAG_MATRIX_WEIGHT_NONE |
                     (hasNormals ? e::FRAME_NORMAL_TYPE_F32 : e::FRAME_NORMAL_TYPE_NONE);
    frame.MaxBoneBlendNum = 0;
    frame.SmoothingAngle = 0.0f;
    frame.AutoCreateNormal = 0;
    b.overwrite_struct(offFrame, frame);

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
        mesh.Container = offFrame;
        if (m.material >= 0 && m.material < static_cast<int>(ir.materials.size()))
            mesh.Material = materialOffsets[m.material];
        mesh.TriangleListNum = 1;
        mesh.TriangleList = tlOffsets[i];
        mesh.Visible = 1;
        mesh.BackCulling = 1;
        mesh.UVSetUnitNum = m.uvs.empty() ? 0 : 1;
        mesh.UVUnitNum    = m.uvs.empty() ? 0 : 2;
        // VertFlag: COMMON_COLOR ON + pos index U32 + (nrm index U32 if normals)
        std::uint32_t vf = e::MESH_VERT_FLAG_COMMON_COLOR
                         | e::MESH_VERT_INDEX_TYPE_U32       // pos index: U32
                         | (hasNormals && !m.normals.empty() ? (e::MESH_VERT_INDEX_TYPE_U32 << 2) : 0);
        mesh.VertFlag = static_cast<std::int32_t>(vf);
        mesh.VertexNum = static_cast<std::int32_t>(m.positions.size() / 3);
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
        tl.VertexType = e::VERTEX_TYPE_NORMAL;
        // Flag: MVERT_INDEX=U32 (bit0-1=2), INDEX=U32 (bit2-3=2<<2=8) → 0x0A
        tl.Flag = static_cast<std::uint16_t>(e::TRILIST_INDEX_TYPE_U32 | (e::TRILIST_INDEX_TYPE_U32 << 2));
        tl.VertexNum = static_cast<std::uint16_t>(m.positions.size() / 3);
        tl.IndexNum  = static_cast<std::uint16_t>(m.indices.size());
        tl.MeshVertexIndexAndIndexData = tlDataOffsets[i];
        b.overwrite_struct(tlOffsets[i], tl);
        sumTLVertexNum += tl.VertexNum;
        sumTLIndexNum  += tl.IndexNum;
    }

    // -- Header 最終埋め込み --
    hdr.FrameNum            = 1;
    hdr.Frame               = offFrame;
    hdr.TopFrameNum         = 1;
    hdr.FirstTopFrame       = offFrame;
    hdr.LastTopFrame        = offFrame;
    hdr.MaterialNum         = static_cast<std::int32_t>(ir.materials.size());
    hdr.Material            = offMaterial;
    hdr.TextureNum          = static_cast<std::int32_t>(ir.textures.size());
    hdr.Texture             = ir.textures.empty() ? 0u : offTexture;
    hdr.MeshNum             = static_cast<std::int32_t>(ir.meshes.size());
    hdr.Mesh                = offMesh;
    hdr.TriangleListNum     = static_cast<std::int32_t>(ir.meshes.size());
    hdr.TriangleList        = offTriangleList;
    hdr.VertexData          = offPAndN;  // (参考情報、実際は各 mesh 毎に個別)
    hdr.VertexDataSize      = 0;  // DxLib ローダーが参照しないはず
    hdr.TriangleNum         = totalTriangles;
    hdr.TriangleListVertexNum = sumTLVertexNum;
    hdr.MeshFaceNum         = totalTriangles;
    hdr.MeshVertexIndexNum  = sumTLVertexNum;
    hdr.TriangleListIndexNum= sumTLIndexNum;
    hdr.TriangleListNormalPositionNum = static_cast<std::int32_t>(positionNum);
    hdr.MeshPositionSize    = static_cast<std::int32_t>(positionNum * 12);
    hdr.MeshNormalNum       = static_cast<std::int32_t>(normalNum);
    hdr.MeshVertexSize      = sumTLVertexNum * 32;  // ざっくり
    hdr.StringSize          = static_cast<std::int32_t>(stringSize);
    hdr.StringBuffer        = offStringBuffer;

    b.overwrite_struct(0, hdr);

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
