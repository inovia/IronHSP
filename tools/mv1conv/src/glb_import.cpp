#include "glb_import.hpp"
#include "mini_json.hpp"
#include <cstdio>
#include <cstdint>
#include <cstring>
#include <filesystem>
#include <string>
#include <vector>

namespace mv1conv {

namespace {

// glTF accessor componentType
constexpr int CT_I8  = 5120, CT_U8  = 5121;
constexpr int CT_I16 = 5122, CT_U16 = 5123;
constexpr int CT_U32 = 5125, CT_F32 = 5126;

std::size_t comp_size(int ct) {
    switch (ct) {
    case CT_I8: case CT_U8: return 1;
    case CT_I16: case CT_U16: return 2;
    case CT_U32: case CT_F32: return 4;
    default: return 0;
    }
}

int type_count(const std::string &t) {
    if (t == "SCALAR") return 1;
    if (t == "VEC2")   return 2;
    if (t == "VEC3")   return 3;
    if (t == "VEC4")   return 4;
    if (t == "MAT2")   return 4;
    if (t == "MAT3")   return 9;
    if (t == "MAT4")   return 16;
    return 0;
}

struct Accessor {
    int bufferView = -1;
    std::size_t byteOffset = 0;
    int componentType = 0;
    std::size_t count = 0;
    std::string type;
};
struct BufferView {
    int buffer = 0;
    std::size_t byteOffset = 0;
    std::size_t byteLength = 0;
};

// accessor から float[count * components] に正規化して読み出し
std::vector<float> read_floats(const Accessor &a, const BufferView &bv,
                                const std::uint8_t *bin, std::size_t binSize)
{
    std::vector<float> out;
    int compN = type_count(a.type);
    if (compN == 0) return out;
    std::size_t stride = comp_size(a.componentType) * compN;
    std::size_t start = bv.byteOffset + a.byteOffset;
    if (start + stride * a.count > binSize) return out;
    out.resize(a.count * compN);
    for (std::size_t i = 0; i < a.count; ++i) {
        const std::uint8_t *p = bin + start + i * stride;
        for (int c = 0; c < compN; ++c) {
            double d = 0;
            switch (a.componentType) {
            case CT_F32: { float v; std::memcpy(&v, p + c * 4, 4); d = v; break; }
            case CT_U32: { std::uint32_t v; std::memcpy(&v, p + c * 4, 4); d = v; break; }
            case CT_U16: { std::uint16_t v; std::memcpy(&v, p + c * 2, 2); d = v; break; }
            case CT_I16: { std::int16_t  v; std::memcpy(&v, p + c * 2, 2); d = v; break; }
            case CT_U8:  d = p[c]; break;
            case CT_I8:  d = static_cast<std::int8_t>(p[c]); break;
            }
            out[i * compN + c] = static_cast<float>(d);
        }
    }
    return out;
}

std::vector<std::uint32_t> read_indices(const Accessor &a, const BufferView &bv,
                                         const std::uint8_t *bin, std::size_t binSize)
{
    std::vector<std::uint32_t> out;
    std::size_t start = bv.byteOffset + a.byteOffset;
    std::size_t sz = comp_size(a.componentType) * a.count;
    if (start + sz > binSize) return out;
    out.reserve(a.count);
    for (std::size_t i = 0; i < a.count; ++i) {
        const std::uint8_t *p = bin + start + i * comp_size(a.componentType);
        switch (a.componentType) {
        case CT_U8:  out.push_back(p[0]); break;
        case CT_U16: { std::uint16_t v; std::memcpy(&v, p, 2); out.push_back(v); } break;
        case CT_U32: { std::uint32_t v; std::memcpy(&v, p, 4); out.push_back(v); } break;
        default: out.push_back(0); break;
        }
    }
    return out;
}

}

LoadResult load_glb(const std::string &path) {
    LoadResult r;
    std::FILE *fp = std::fopen(path.c_str(), "rb");
    if (!fp) { r.error = "cannot open: " + path; return r; }
    std::error_code ec;
    auto sz = std::filesystem::file_size(path, ec);
    if (ec) { r.error = "file_size: " + ec.message(); std::fclose(fp); return r; }
    std::vector<std::uint8_t> all(sz);
    if (std::fread(all.data(), 1, all.size(), fp) != all.size()) {
        r.error = "short read"; std::fclose(fp); return r;
    }
    std::fclose(fp);

    if (all.size() < 12 || std::memcmp(all.data(), "glTF", 4) != 0) {
        r.error = "not a GLB (missing 'glTF' magic)";
        return r;
    }
    std::uint32_t version, total;
    std::memcpy(&version, all.data() + 4, 4);
    std::memcpy(&total,   all.data() + 8, 4);
    if (version != 2) {
        r.error = "GLB version " + std::to_string(version) + " unsupported (need 2)";
        return r;
    }
    if (total > all.size()) {
        r.error = "GLB length exceeds file size";
        return r;
    }

    const std::uint8_t *cp = all.data() + 12;
    const std::uint8_t *cpEnd = all.data() + total;
    std::string jsonStr;
    std::vector<std::uint8_t> bin;
    while (cp + 8 <= cpEnd) {
        std::uint32_t clen, ctype;
        std::memcpy(&clen,  cp + 0, 4);
        std::memcpy(&ctype, cp + 4, 4);
        cp += 8;
        if (cp + clen > cpEnd) { r.error = "GLB chunk overflow"; return r; }
        if (ctype == 0x4E4F534A) {  // 'JSON'
            jsonStr.assign(reinterpret_cast<const char *>(cp), clen);
        } else if (ctype == 0x004E4942) {  // 'BIN\0'
            bin.assign(cp, cp + clen);
        }
        cp += clen;
    }
    if (jsonStr.empty()) { r.error = "GLB: no JSON chunk"; return r; }

    std::string jerr;
    auto root = json::parse(jsonStr.data(), jsonStr.size(), jerr);
    if (!root.is_object()) { r.error = "glTF JSON parse: " + jerr; return r; }

    // accessors / bufferViews を展開
    std::vector<Accessor> accs;
    for (const auto &a : root["accessors"].arr()) {
        Accessor ac;
        ac.bufferView   = static_cast<int>(a["bufferView"].as_number(-1));
        ac.byteOffset   = static_cast<std::size_t>(a["byteOffset"].as_number(0));
        ac.componentType= static_cast<int>(a["componentType"].as_number(0));
        ac.count        = static_cast<std::size_t>(a["count"].as_number(0));
        ac.type         = a["type"].as_string();
        accs.push_back(ac);
    }
    std::vector<BufferView> bvs;
    for (const auto &b : root["bufferViews"].arr()) {
        BufferView bv;
        bv.buffer     = static_cast<int>(b["buffer"].as_number(0));
        bv.byteOffset = static_cast<std::size_t>(b["byteOffset"].as_number(0));
        bv.byteLength = static_cast<std::size_t>(b["byteLength"].as_number(0));
        bvs.push_back(bv);
    }

    auto get_acc_floats = [&](int accIdx) -> std::vector<float> {
        if (accIdx < 0 || accIdx >= static_cast<int>(accs.size())) return {};
        const auto &a = accs[accIdx];
        if (a.bufferView < 0 || a.bufferView >= static_cast<int>(bvs.size())) return {};
        return read_floats(a, bvs[a.bufferView], bin.data(), bin.size());
    };
    auto get_acc_ints = [&](int accIdx) -> std::vector<std::uint32_t> {
        if (accIdx < 0 || accIdx >= static_cast<int>(accs.size())) return {};
        const auto &a = accs[accIdx];
        if (a.bufferView < 0 || a.bufferView >= static_cast<int>(bvs.size())) return {};
        return read_indices(a, bvs[a.bufferView], bin.data(), bin.size());
    };

    // materials
    const auto &jmats = root["materials"].arr();
    for (std::size_t mi = 0; mi < jmats.size(); ++mi) {
        MaterialIR m;
        m.name = jmats[mi]["name"].as_string("mat" + std::to_string(mi));
        const auto &pbr = jmats[mi]["pbrMetallicRoughness"];
        const auto &bcf = pbr["baseColorFactor"];
        if (bcf.is_array() && bcf.size() >= 3) {
            m.diffuse[0] = static_cast<float>(bcf[0].as_number(0.8));
            m.diffuse[1] = static_cast<float>(bcf[1].as_number(0.8));
            m.diffuse[2] = static_cast<float>(bcf[2].as_number(0.8));
            m.diffuse[3] = static_cast<float>(bcf.size() >= 4 ? bcf[3].as_number(1.0) : 1.0);
        }
        r.ir.materials.push_back(m);
    }

    // meshes / primitives
    const auto &jmeshes = root["meshes"].arr();
    for (std::size_t mi = 0; mi < jmeshes.size(); ++mi) {
        const auto &prims = jmeshes[mi]["primitives"].arr();
        for (std::size_t pi = 0; pi < prims.size(); ++pi) {
            const auto &prim = prims[pi];
            MeshIR mesh;
            mesh.name = jmeshes[mi]["name"].as_string("mesh" + std::to_string(mi)) +
                        (prims.size() > 1 ? ("_prim" + std::to_string(pi)) : std::string{});

            int posAcc = static_cast<int>(prim["attributes"]["POSITION"].as_number(-1));
            int nrmAcc = static_cast<int>(prim["attributes"]["NORMAL"].as_number(-1));
            int uvAcc  = static_cast<int>(prim["attributes"]["TEXCOORD_0"].as_number(-1));
            int idxAcc = static_cast<int>(prim["indices"].as_number(-1));
            int matIdx = static_cast<int>(prim["material"].as_number(-1));

            mesh.positions = get_acc_floats(posAcc);
            if (nrmAcc >= 0) mesh.normals = get_acc_floats(nrmAcc);
            if (uvAcc  >= 0) {
                mesh.uvs = get_acc_floats(uvAcc);
                // glTF は左上原点、MV1 writer は左上原点仮定なので反転不要
            }
            if (idxAcc >= 0) mesh.indices = get_acc_ints(idxAcc);
            else {
                // non-indexed: 0..N-1
                mesh.indices.resize(mesh.positions.size() / 3);
                for (std::size_t i = 0; i < mesh.indices.size(); ++i) mesh.indices[i] = static_cast<std::uint32_t>(i);
            }
            if (matIdx >= 0) mesh.material = matIdx;

            if (mesh.positions.empty() || mesh.indices.empty()) continue;
            r.ir.meshes.push_back(std::move(mesh));
        }
    }

    if (r.ir.meshes.empty()) { r.error = "glTF: no valid mesh/primitive found"; return r; }
    if (r.ir.materials.empty()) {
        MaterialIR m; m.name = "default";
        r.ir.materials.push_back(m);
        for (auto &m2 : r.ir.meshes) m2.material = 0;
    }
    return r;
}

}
