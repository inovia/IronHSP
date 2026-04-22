#include "obj_export.hpp"
#include "mv1_enums.hpp"
#include <cstdio>
#include <cstdint>
#include <cstring>
#include <vector>

namespace mv1conv {

namespace {

// PositionAndNormalData を (positions[], normals[]) として取り出す。非スキンのみ想定。
struct FrameVerts {
    std::vector<float> pos;     // 3 * PositionNum 個の float
    std::vector<float> nrm;     // 3 * NormalNum 個、FRAME_NORMAL_TYPE_NONE なら空
};

FrameVerts decode_position_and_normal(const Mv1File &f, const f1::MV1_FRAME_F1 &fr) {
    FrameVerts out;
    if (fr.PositionAndNormalData == 0 || fr.PositionNum <= 0) return out;
    const std::uint8_t *p = f.buffer().data() + fr.PositionAndNormalData;
    const std::uint8_t *end = f.buffer().data() + f.buffer().size();

    const bool pos16   = (fr.VertFlag & e::FRAME_VERT_FLAG_POSITION_B16) != 0;
    const bool wNone   = (fr.VertFlag & e::FRAME_VERT_FLAG_MATRIX_WEIGHT_NONE) != 0;
    const std::uint16_t nType = fr.VertFlag & e::FRAME_VERT_FLAG_NORMAL_TYPE_MASK;

    float subMin[3] = {0,0,0}, subWidth[3] = {0,0,0};
    if (pos16) {
        // MV1_POSITION_16BIT_SUBINFO_F1 x 3 (x,y,z それぞれ Min/Width)
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
            out.pos[i*3+0] = subMin[0] + (wx / 65535.0f) * subWidth[0];
            out.pos[i*3+1] = subMin[1] + (wy / 65535.0f) * subWidth[1];
            out.pos[i*3+2] = subMin[2] + (wz / 65535.0f) * subWidth[2];
            p += 6;
        } else {
            if (p + 12 > end) { out.pos.clear(); return out; }
            std::memcpy(&out.pos[i*3+0], p + 0, 4);
            std::memcpy(&out.pos[i*3+1], p + 4, 4);
            std::memcpy(&out.pos[i*3+2], p + 8, 4);
            p += 12;
        }
    }

    // スキニングウェイト (非スキンならこのブロック無し)
    if (!wNone) {
        const bool idxU16 = (fr.VertFlag & e::FRAME_VERT_FLAG_MATRIX_INDEX_MASK) != 0;
        const bool wtU16  = (fr.VertFlag & e::FRAME_VERT_FLAG_MATRIX_WEIGHT_MASK) != 0;
        const std::size_t idxSz = idxU16 ? 2u : 1u;
        const std::size_t wtSz  = wtU16  ? 2u : 1u;
        for (int i = 0; i < fr.PositionNum; ++i) {
            // 各頂点: MaxBoneBlendNum 対まで、またはインデックス=-1 終端
            for (int b = 0; b < fr.MaxBoneBlendNum; ++b) {
                if (p + idxSz > end) return out;
                std::int32_t idx = 0;
                if (idxU16) {
                    std::uint16_t v; std::memcpy(&v, p, 2);
                    idx = (v == 0xFFFFu) ? -1 : static_cast<std::int32_t>(v);
                } else {
                    idx = (p[0] == 0xFFu) ? -1 : static_cast<std::int32_t>(p[0]);
                }
                p += idxSz;
                if (idx == -1) break;
                if (p + wtSz > end) return out;
                p += wtSz;
            }
        }
    }

    // 法線
    if (nType != e::FRAME_NORMAL_TYPE_NONE && fr.NormalNum > 0) {
        const bool hasTB = (fr.VertFlag & e::FRAME_VERT_FLAG_NT_BINORMAL) != 0;
        const int setsPerVertex = hasTB ? 3 : 1;  // N / T / B
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
                        std::int16_t v[3];
                        std::memcpy(v, p, 6);
                        n[0] = v[0] / 32767.0f;
                        n[1] = v[1] / 32767.0f;
                        n[2] = v[2] / 32767.0f;
                    }
                    p += 6;
                    break;
                case e::FRAME_NORMAL_TYPE_F32:
                    if (p + 12 > end) return out;
                    std::memcpy(n, p, 12);
                    p += 12;
                    break;
                default:
                    return out;
                }
                if (s == 0) {  // Normal のみ採用、Tangent/Binormal は破棄
                    out.nrm[i*3+0] = n[0];
                    out.nrm[i*3+1] = n[1];
                    out.nrm[i*3+2] = n[2];
                }
            }
        }
    }

    return out;
}

// Mesh の VertexData から (pos index, nrm index, uv) を取り出す
struct MeshVertices {
    std::vector<std::uint32_t> posIdx;   // VertexNum 個
    std::vector<std::uint32_t> nrmIdx;   // VertexNum 個 (nrmIdxType != NONE の場合のみ)
    std::vector<float>         uv;       // 2 * VertexNum 個 (第 1 UV set の 2 成分のみ取る)
};

std::uint32_t read_index(const std::uint8_t *&p, std::uint32_t type, const std::uint8_t *end) {
    std::uint32_t v = 0;
    switch (type) {
    case e::MESH_VERT_INDEX_TYPE_NONE: return 0;
    case e::MESH_VERT_INDEX_TYPE_U8:
        if (p + 1 > end) return 0; v = *p++; break;
    case e::MESH_VERT_INDEX_TYPE_U16:
        if (p + 2 > end) return 0;
        { std::uint16_t w; std::memcpy(&w, p, 2); v = w; p += 2; } break;
    case e::MESH_VERT_INDEX_TYPE_U32:
        if (p + 4 > end) return 0;
        std::memcpy(&v, p, 4); p += 4; break;
    }
    return v;
}

std::size_t index_type_size(std::uint32_t type) {
    switch (type) {
    case e::MESH_VERT_INDEX_TYPE_NONE: return 0;
    case e::MESH_VERT_INDEX_TYPE_U8:   return 1;
    case e::MESH_VERT_INDEX_TYPE_U16:  return 2;
    case e::MESH_VERT_INDEX_TYPE_U32:  return 4;
    }
    return 0;
}

MeshVertices decode_mesh_vertices(const Mv1File &f, const f1::MV1_MESH_F1 &m) {
    MeshVertices out;
    if (m.VertexData == 0 || m.VertexNum <= 0) return out;
    const std::uint8_t *p = f.buffer().data() + m.VertexData;
    const std::uint8_t *end = f.buffer().data() + f.buffer().size();

    const std::uint32_t posIdxT = m.VertFlag & e::MESH_VERT_FLAG_POS_IND_TYPE_MASK;
    const std::uint32_t nrmIdxT = (m.VertFlag & e::MESH_VERT_FLAG_NRM_IND_TYPE_MASK) >> 2;
    const bool commonColor = (m.VertFlag & e::MESH_VERT_FLAG_COMMON_COLOR) != 0;
    const bool uvU16       = (m.VertFlag & e::MESH_VERT_FLAG_UV_U16) != 0;
    const bool nonToon     = (m.VertFlag & e::MESH_VERT_FLAG_NON_TOON_OUTLINE) != 0;

    if (commonColor) {
        // COLOR_U8 diffuse + COLOR_U8 specular
        if (p + 8 > end) return out; p += 8;
    }

    // 座標インデックス
    out.posIdx.reserve(m.VertexNum);
    for (int i = 0; i < m.VertexNum; ++i)
        out.posIdx.push_back(read_index(p, posIdxT, end));

    // 法線インデックス
    if (nrmIdxT != e::MESH_VERT_INDEX_TYPE_NONE) {
        out.nrmIdx.reserve(m.VertexNum);
        for (int i = 0; i < m.VertexNum; ++i)
            out.nrmIdx.push_back(read_index(p, nrmIdxT, end));
    }

    // 頂点カラー (COMMON_COLOR でない場合、各頂点 COLOR_U8×2 = 8 byte)
    if (!commonColor) {
        if (p + 8 * static_cast<std::size_t>(m.VertexNum) > end) { out = {}; return out; }
        p += 8 * static_cast<std::size_t>(m.VertexNum);
    }

    // UV 値
    const int uvSetCount = m.UVSetUnitNum;
    const int uvCompCount = m.UVUnitNum;
    out.uv.resize(static_cast<std::size_t>(m.VertexNum) * 2);
    for (int i = 0; i < m.VertexNum; ++i) {
        float firstUV[2] = {0, 0};
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

    // トゥーン輪郭情報 (1 bit/vertex, nonToon が立っている場合のみ)
    if (nonToon) {
        std::size_t bytes = (static_cast<std::size_t>(m.VertexNum) + 7) / 8;
        if (p + bytes > end) return out;
        p += bytes;
    }

    return out;
}

// TriangleList の MeshVertexIndexAndIndexData から三角形インデックスを取り出す
// 戻り値: mesh vertex index 列 (長さ = tl.IndexNum)。スキンメッシュなら先頭部分をスキップ。
std::vector<std::uint32_t> decode_triangles(
    const Mv1File &f, const f1::MV1_TRIANGLE_LIST_F1 &tl,
    const f1::MV1_MESH_F1 &mesh, const std::vector<std::uint32_t> &meshVIdx)
{
    std::vector<std::uint32_t> result;
    if (tl.MeshVertexIndexAndIndexData == 0 || tl.IndexNum == 0 || tl.VertexNum == 0)
        return result;
    const std::uint8_t *p = f.buffer().data() + tl.MeshVertexIndexAndIndexData;
    const std::uint8_t *end = f.buffer().data() + f.buffer().size();

    // Skin の場合は先頭にボーン情報
    if (tl.VertexType == e::VERTEX_TYPE_SKIN_4BONE || tl.VertexType == e::VERTEX_TYPE_SKIN_8BONE) {
        if (p + 2 > end) return result;
        std::uint16_t useBoneNum; std::memcpy(&useBoneNum, p, 2); p += 2;
        if (p + 2 * static_cast<std::size_t>(useBoneNum) > end) return result;
        p += 2 * static_cast<std::size_t>(useBoneNum);
    } else if (tl.VertexType == e::VERTEX_TYPE_SKIN_FREEBONE) {
        if (p + 2 > end) return result;
        p += 2;
    }

    // VertexNum 個のメッシュ頂点インデックス → TriangleList 内頂点 i → mesh.VertexData 内 index
    const std::uint16_t mIdxT = tl.Flag & e::TRILIST_FLAG_MVERT_INDEX_MASK;
    const std::uint16_t iIdxT = (tl.Flag & e::TRILIST_FLAG_INDEX_MASK) >> 2;
    std::size_t mIdxSz = 0, iIdxSz = 0;
    switch (mIdxT) { case e::TRILIST_INDEX_TYPE_U8: mIdxSz=1; break; case e::TRILIST_INDEX_TYPE_U16: mIdxSz=2; break; case e::TRILIST_INDEX_TYPE_U32: mIdxSz=4; break; }
    switch (iIdxT) { case e::TRILIST_INDEX_TYPE_U8: iIdxSz=1; break; case e::TRILIST_INDEX_TYPE_U16: iIdxSz=2; break; case e::TRILIST_INDEX_TYPE_U32: iIdxSz=4; break; }

    auto read = [&](std::size_t sz) -> std::uint32_t {
        std::uint32_t v = 0;
        if (p + sz > end) return 0;
        if (sz == 1) v = *p;
        else if (sz == 2) { std::uint16_t w; std::memcpy(&w, p, 2); v = w; }
        else { std::memcpy(&v, p, 4); }
        p += sz;
        return v;
    };

    // tl.VertexNum 個 (mesh.VertexData 内の index)
    std::vector<std::uint32_t> tlToMesh(tl.VertexNum);
    for (int i = 0; i < tl.VertexNum; ++i) tlToMesh[i] = read(mIdxSz);

    // tl.IndexNum 個 (tl.VertexNum 内の index)
    result.resize(tl.IndexNum);
    for (int i = 0; i < tl.IndexNum; ++i) {
        std::uint32_t tlV = read(iIdxSz);
        std::uint32_t meshV = (tlV < tlToMesh.size()) ? tlToMesh[tlV] : 0;
        // meshV は mesh の VertexData 内の頂点番号 → これは posIdx/nrmIdx/uv で既に解決済
        result[i] = meshV;
    }
    (void)mesh; (void)meshVIdx;
    return result;
}

}

int export_obj(const Mv1File &file, const std::string &obj_path) {
    if (!file.ok()) {
        std::fprintf(stderr, "ERROR: %s\n", file.error().c_str());
        return 1;
    }
    auto h = file.header();

    std::FILE *fp = std::fopen(obj_path.c_str(), "w");
    if (!fp) { std::fprintf(stderr, "cannot write: %s\n", obj_path.c_str()); return 1; }
    std::fprintf(fp, "# Generated by mv1conv from %s\n", "mv1");

    // Frame 毎に座標/法線プールがある。(MeshPosition は Frame.PositionNum 単位で連続)
    // まずフレーム配列をキャッシュ化。
    auto frameArr = file.at<f1::MV1_FRAME_F1>(h->Frame);
    auto meshArr  = file.at<f1::MV1_MESH_F1>(h->Mesh);
    auto tlArr    = file.at<f1::MV1_TRIANGLE_LIST_F1>(h->TriangleList);

    if (!frameArr || !meshArr || !tlArr) {
        std::fprintf(stderr, "array offset out-of-range\n");
        std::fclose(fp);
        return 1;
    }

    // Global OBJ 頂点インデックス管理 (OBJ は 1-based)
    std::size_t globalVBase = 1, globalVNBase = 1, globalVTBase = 1;
    int skipped_skin = 0, total_tris = 0;

    for (int mi = 0; mi < h->MeshNum; ++mi) {
        const auto &mesh = meshArr[mi];

        // Container から所属フレームを特定
        if (mesh.Container == 0) continue;
        auto container = file.at<f1::MV1_FRAME_F1>(mesh.Container);
        if (!container) continue;

        // Frame の座標/法線を decode
        auto fv = decode_position_and_normal(file, *container);
        auto mv = decode_mesh_vertices(file, mesh);
        if (fv.pos.empty() || mv.posIdx.empty()) continue;

        // mesh 単位で VertexNum 個の OBJ 頂点を emit (pos/nrm/uv を展開)
        auto meshName = file.name(container->Name);
        std::fprintf(fp, "\ng mesh_%d_%.*s\n", mi,
                     static_cast<int>(meshName.size()), meshName.data());

        // position (参照された pos index のみでなく全てを書く方式にする)
        for (int i = 0; i < mesh.VertexNum; ++i) {
            std::uint32_t pi = mv.posIdx[i];
            if (pi * 3 + 2 < fv.pos.size()) {
                std::fprintf(fp, "v %.6f %.6f %.6f\n",
                             fv.pos[pi*3+0], fv.pos[pi*3+1], fv.pos[pi*3+2]);
            } else {
                std::fprintf(fp, "v 0 0 0\n");
            }
        }
        std::size_t vEmit = mesh.VertexNum;

        // normal
        std::size_t vnEmit = 0;
        if (!fv.nrm.empty() && !mv.nrmIdx.empty()) {
            for (int i = 0; i < mesh.VertexNum; ++i) {
                std::uint32_t ni = mv.nrmIdx[i];
                if (ni * 3 + 2 < fv.nrm.size()) {
                    std::fprintf(fp, "vn %.6f %.6f %.6f\n",
                                 fv.nrm[ni*3+0], fv.nrm[ni*3+1], fv.nrm[ni*3+2]);
                } else {
                    std::fprintf(fp, "vn 0 1 0\n");
                }
            }
            vnEmit = mesh.VertexNum;
        }

        // uv
        std::size_t vtEmit = 0;
        if (!mv.uv.empty()) {
            for (int i = 0; i < mesh.VertexNum; ++i) {
                // OBJ の v は下原点、MV1 は上原点なので v 反転
                std::fprintf(fp, "vt %.6f %.6f\n", mv.uv[i*2+0], 1.0f - mv.uv[i*2+1]);
            }
            vtEmit = mesh.VertexNum;
        }

        // 三角形リストを走査
        for (int ti = 0; ti < h->TriangleListNum; ++ti) {
            const auto &tl = tlArr[ti];
            // container を逆引き (Container は mesh へのポインタ)
            if (tl.Container == 0) continue;
            auto tlMesh = file.at<f1::MV1_MESH_F1>(tl.Container);
            if (!tlMesh) continue;
            if (tlMesh->Index != mesh.Index) continue;  // 別メッシュは後のループで

            if (tl.VertexType != e::VERTEX_TYPE_NORMAL) {
                ++skipped_skin;
                continue;
            }

            auto tris = decode_triangles(file, tl, mesh, mv.posIdx);
            // 3 個ずつで 1 三角形
            for (std::size_t i = 0; i + 2 < tris.size(); i += 3) {
                auto a = tris[i + 0], b = tris[i + 1], c = tris[i + 2];
                auto w = [&](std::uint32_t idx) {
                    std::size_t v  = globalVBase  + idx;
                    if (vtEmit && vnEmit) {
                        std::size_t vt = globalVTBase + idx;
                        std::size_t vn = globalVNBase + idx;
                        std::fprintf(fp, "%zu/%zu/%zu", v, vt, vn);
                    } else if (vtEmit) {
                        std::size_t vt = globalVTBase + idx;
                        std::fprintf(fp, "%zu/%zu", v, vt);
                    } else if (vnEmit) {
                        std::size_t vn = globalVNBase + idx;
                        std::fprintf(fp, "%zu//%zu", v, vn);
                    } else {
                        std::fprintf(fp, "%zu", v);
                    }
                };
                std::fprintf(fp, "f "); w(a); std::fprintf(fp, " "); w(b); std::fprintf(fp, " "); w(c); std::fprintf(fp, "\n");
                ++total_tris;
            }
        }

        globalVBase  += vEmit;
        globalVNBase += vnEmit;
        globalVTBase += vtEmit;
    }

    std::fclose(fp);
    std::fprintf(stderr, "wrote %s  (%d triangles, %d skin meshes skipped)\n",
                 obj_path.c_str(), total_tris, skipped_skin);
    return 0;
}

}
