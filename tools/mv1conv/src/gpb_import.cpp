#include "gpb_import.hpp"
#include <cstdio>
#include <cstdint>
#include <cstring>
#include <filesystem>
#include <string>
#include <vector>

namespace mv1conv {

namespace {

// GPB type IDs (gameplay3d の Bundle.h より抜粋、主要なもの)
constexpr std::uint32_t GPB_TYPE_SCENE    = 1;
constexpr std::uint32_t GPB_TYPE_NODE     = 2;
constexpr std::uint32_t GPB_TYPE_MODEL    = 5;
constexpr std::uint32_t GPB_TYPE_MESH     = 34;
constexpr std::uint32_t GPB_TYPE_MESHPART = 35;
constexpr std::uint32_t GPB_TYPE_MESHSKIN = 36;

// Vertex usage (gameplay3d VertexFormat::Usage)
constexpr std::uint32_t GPB_USAGE_POSITION      = 1;
constexpr std::uint32_t GPB_USAGE_NORMAL        = 2;
constexpr std::uint32_t GPB_USAGE_COLOR         = 3;
constexpr std::uint32_t GPB_USAGE_TANGENT       = 4;
constexpr std::uint32_t GPB_USAGE_BINORMAL      = 5;
constexpr std::uint32_t GPB_USAGE_BLENDWEIGHTS  = 6;
constexpr std::uint32_t GPB_USAGE_BLENDINDICES  = 7;
constexpr std::uint32_t GPB_USAGE_TEXCOORD0     = 8;
constexpr std::uint32_t GPB_USAGE_TEXCOORD1     = 9;

// Index format
constexpr std::uint32_t GPB_IDX_UBYTE  = 0x1401;
constexpr std::uint32_t GPB_IDX_USHORT = 0x1403;
constexpr std::uint32_t GPB_IDX_UINT   = 0x1405;
// GamePlay は別 enum 値を使う場合もあり
constexpr std::uint32_t GPB_IDX_UBYTE_ALT  = 5121;
constexpr std::uint32_t GPB_IDX_USHORT_ALT = 5123;
constexpr std::uint32_t GPB_IDX_UINT_ALT   = 5125;

// Primitive type
constexpr std::uint32_t GPB_PRIM_TRIANGLES = 4;

struct Reader {
    const std::uint8_t *p;
    const std::uint8_t *pEnd;
    std::string err;

    bool avail(std::size_t n) const { return p + n <= pEnd; }
    bool read(void *dst, std::size_t n) {
        if (!avail(n)) { err = "truncated"; return false; }
        std::memcpy(dst, p, n); p += n; return true;
    }
    std::uint32_t u32() { std::uint32_t v=0; read(&v, 4); return v; }
    std::uint16_t u16() { std::uint16_t v=0; read(&v, 2); return v; }
    std::uint8_t  u8()  { std::uint8_t  v=0; read(&v, 1); return v; }
    float         f32() { float v=0; read(&v, 4); return v; }

    std::string str() {
        std::uint32_t n = u32();
        if (!avail(n)) { err = "truncated string"; return {}; }
        std::string s(reinterpret_cast<const char *>(p), n);
        p += n;
        return s;
    }
};

struct RefEntry {
    std::string id;
    std::uint32_t type;
    std::uint32_t offset;
};

}

LoadResult load_gpb(const std::string &path) {
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

    // Magic: "\xABGPB\xBB\r\n\x1A\n" (PNG-style)
    static const std::uint8_t GPB_SIG[9] = {0xAB, 'G', 'P', 'B', 0xBB, '\r', '\n', 0x1A, '\n'};
    if (all.size() < 9 + 2 + 4 ||
        std::memcmp(all.data(), GPB_SIG, 9) != 0) {
        r.error = "not a GPB file (missing magic)";
        return r;
    }

    Reader R{all.data() + 9, all.data() + all.size(), {}};
    std::uint8_t major = R.u8(), minor = R.u8();
    (void)major; (void)minor;

    // Reference table
    std::uint32_t refCount = R.u32();
    if (!R.err.empty()) { r.error = "GPB: " + R.err; return r; }
    std::vector<RefEntry> refs(refCount);
    for (std::uint32_t i = 0; i < refCount; ++i) {
        refs[i].id     = R.str();
        refs[i].type   = R.u32();
        refs[i].offset = R.u32();
        if (!R.err.empty()) { r.error = "GPB: " + R.err; return r; }
    }

    MeshIR outMesh;
    outMesh.name = "gpb";

    // Mesh 型の reference を順番に処理
    for (const auto &re : refs) {
        if (re.type != GPB_TYPE_MESH) continue;
        if (re.offset >= all.size()) continue;

        Reader M{all.data() + re.offset, all.data() + all.size(), {}};

        // VertexFormat
        std::uint32_t elemN = M.u32();
        struct Elem { std::uint32_t usage, size; };
        std::vector<Elem> elems(elemN);
        std::size_t vertSize = 0;
        for (std::uint32_t k = 0; k < elemN; ++k) {
            elems[k].usage = M.u32();
            elems[k].size  = M.u32();
            vertSize += elems[k].size * 4;  // GPB は全部 float32 assumption
        }
        if (!M.err.empty()) continue;

        // Vertex data
        std::uint32_t vdBytes = M.u32();
        if (!M.avail(vdBytes)) continue;
        const std::uint8_t *vdata = M.p;
        M.p += vdBytes;

        std::uint32_t vertCount = (vertSize > 0) ? (vdBytes / static_cast<std::uint32_t>(vertSize)) : 0;
        if (vertCount == 0) continue;

        // Bounds 読み飛ばし: min[3] + max[3] + center[3] + radius = 40 byte
        M.p += 40;

        // 頂点属性をそれぞれ分解
        std::size_t off = 0;
        int posOff = -1, nrmOff = -1, uvOff = -1;
        int posN = 0, nrmN = 0, uvN = 0;
        for (const auto &e : elems) {
            if (e.usage == GPB_USAGE_POSITION)  { posOff = static_cast<int>(off); posN = e.size; }
            if (e.usage == GPB_USAGE_NORMAL)    { nrmOff = static_cast<int>(off); nrmN = e.size; }
            if (e.usage == GPB_USAGE_TEXCOORD0) { uvOff  = static_cast<int>(off); uvN  = e.size; }
            off += e.size * 4;
        }
        if (posOff < 0) continue;

        std::uint32_t vBase = static_cast<std::uint32_t>(outMesh.positions.size() / 3);
        outMesh.positions.reserve(outMesh.positions.size() + vertCount * 3);
        if (nrmOff >= 0) outMesh.normals.reserve(outMesh.normals.size() + vertCount * 3);
        if (uvOff  >= 0) outMesh.uvs.reserve(outMesh.uvs.size() + vertCount * 2);

        for (std::uint32_t vi = 0; vi < vertCount; ++vi) {
            const std::uint8_t *vp = vdata + vi * vertSize;
            float v[3] = {0, 0, 0};
            std::memcpy(v, vp + posOff, std::min(posN, 3) * 4);
            outMesh.positions.push_back(v[0]);
            outMesh.positions.push_back(v[1]);
            outMesh.positions.push_back(v[2]);
            if (nrmOff >= 0) {
                float n[3] = {0, 0, 0};
                std::memcpy(n, vp + nrmOff, std::min(nrmN, 3) * 4);
                outMesh.normals.push_back(n[0]);
                outMesh.normals.push_back(n[1]);
                outMesh.normals.push_back(n[2]);
            }
            if (uvOff >= 0) {
                float u[2] = {0, 0};
                std::memcpy(u, vp + uvOff, std::min(uvN, 2) * 4);
                outMesh.uvs.push_back(u[0]);
                outMesh.uvs.push_back(u[1]);
            }
        }

        // MeshParts
        // GPB v1.5 の実フォーマット (duck.gpb / tamane.gpb / sphaceship.gpb で確認):
        //   prim_type     : uint
        //   idx_format    : uint
        //   idx_byte_count: uint     ← インデックス配列の **バイト数** (count ではない)
        //   data          : [idx_byte_count]
        std::uint32_t partN = M.u32();
        if (!M.err.empty()) continue;
        for (std::uint32_t pi = 0; pi < partN; ++pi) {
            std::uint32_t primType  = M.u32();
            std::uint32_t idxFormat = M.u32();
            std::uint32_t idxBytes  = M.u32();

            std::size_t idxSz = 0;
            if      (idxFormat == GPB_IDX_UBYTE  || idxFormat == GPB_IDX_UBYTE_ALT)  idxSz = 1;
            else if (idxFormat == GPB_IDX_USHORT || idxFormat == GPB_IDX_USHORT_ALT) idxSz = 2;
            else if (idxFormat == GPB_IDX_UINT   || idxFormat == GPB_IDX_UINT_ALT)   idxSz = 4;
            else { break; }

            if (!M.avail(idxBytes)) break;
            const std::uint8_t *ip = M.p;
            M.p += idxBytes;

            if (primType != GPB_PRIM_TRIANGLES) continue;
            std::size_t idxCount = idxBytes / idxSz;

            for (std::size_t k = 0; k < idxCount; ++k) {
                std::uint32_t v = 0;
                if      (idxSz == 1) v = ip[k];
                else if (idxSz == 2) { std::uint16_t w; std::memcpy(&w, ip + k*2, 2); v = w; }
                else                 { std::memcpy(&v, ip + k*4, 4); }
                outMesh.indices.push_back(vBase + v);
            }
        }
    }

    if (outMesh.positions.empty() || outMesh.indices.empty()) {
        r.error = "GPB: no Mesh with vertices + indices found";
        return r;
    }

    r.ir.meshes.push_back(std::move(outMesh));
    MaterialIR m; m.name = "default";
    r.ir.materials.push_back(m);
    return r;
}

}
