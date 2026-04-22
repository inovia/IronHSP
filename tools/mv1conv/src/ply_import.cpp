#include "ply_import.hpp"
#include <cstdio>
#include <cstdint>
#include <cstring>
#include <filesystem>
#include <sstream>
#include <string>
#include <vector>

namespace mv1conv {

namespace {

enum class Fmt { Ascii, BinaryLE, BinaryBE };

enum class PType { U8, I8, U16, I16, U32, I32, F32, F64, Unknown };

PType parse_ptype(const std::string &s) {
    if (s == "char"   || s == "int8")   return PType::I8;
    if (s == "uchar"  || s == "uint8")  return PType::U8;
    if (s == "short"  || s == "int16")  return PType::I16;
    if (s == "ushort" || s == "uint16") return PType::U16;
    if (s == "int"    || s == "int32")  return PType::I32;
    if (s == "uint"   || s == "uint32") return PType::U32;
    if (s == "float"  || s == "float32")return PType::F32;
    if (s == "double" || s == "float64")return PType::F64;
    return PType::Unknown;
}
std::size_t ptype_size(PType t) {
    switch (t) {
    case PType::U8: case PType::I8: return 1;
    case PType::U16: case PType::I16: return 2;
    case PType::U32: case PType::I32: case PType::F32: return 4;
    case PType::F64: return 8;
    default: return 0;
    }
}

struct Property {
    std::string name;
    bool isList = false;
    PType countType = PType::Unknown;
    PType itemType  = PType::Unknown;
};
struct Element {
    std::string name;
    std::size_t count = 0;
    std::vector<Property> props;
};

// 最小 PLY loader: vertex (float x,y,z) + face (list uchar int vertex_indices) 前提
}

LoadResult load_ply(const std::string &path) {
    LoadResult r;
    std::FILE *fp = std::fopen(path.c_str(), "rb");
    if (!fp) { r.error = "cannot open: " + path; return r; }

    std::error_code ec;
    auto fsize = std::filesystem::file_size(path, ec);
    if (ec) { r.error = "file_size: " + ec.message(); std::fclose(fp); return r; }
    std::vector<std::uint8_t> all(fsize);
    if (std::fread(all.data(), 1, all.size(), fp) != all.size()) {
        r.error = "short read"; std::fclose(fp); return r;
    }
    std::fclose(fp);

    // ヘッダは ASCII で "end_header\n" まで
    std::string_view view(reinterpret_cast<const char *>(all.data()), all.size());
    auto hdrEnd = view.find("end_header");
    if (hdrEnd == std::string_view::npos) { r.error = "PLY: no end_header"; return r; }
    std::size_t dataStart = hdrEnd + std::string("end_header").size();
    if (dataStart < all.size() && all[dataStart] == '\r') ++dataStart;
    if (dataStart < all.size() && all[dataStart] == '\n') ++dataStart;

    std::istringstream ss(std::string(view.substr(0, hdrEnd)));
    std::string line;
    Fmt fmt = Fmt::Ascii;
    std::vector<Element> elems;
    while (std::getline(ss, line)) {
        if (!line.empty() && line.back() == '\r') line.pop_back();
        std::istringstream ls(line);
        std::string tok;
        ls >> tok;
        if (tok == "ply" || tok == "comment" || tok == "obj_info" || tok == "end_header") continue;
        if (tok == "format") {
            std::string f; ls >> f;
            if (f == "ascii") fmt = Fmt::Ascii;
            else if (f == "binary_little_endian") fmt = Fmt::BinaryLE;
            else if (f == "binary_big_endian")    fmt = Fmt::BinaryBE;
        } else if (tok == "element") {
            Element e;
            ls >> e.name >> e.count;
            elems.push_back(e);
        } else if (tok == "property") {
            if (elems.empty()) continue;
            Property pr;
            std::string a, b;
            ls >> a;
            if (a == "list") {
                pr.isList = true;
                std::string c;
                ls >> b >> c >> pr.name;
                pr.countType = parse_ptype(b);
                pr.itemType  = parse_ptype(c);
            } else {
                ls >> pr.name;
                pr.itemType = parse_ptype(a);
            }
            elems.back().props.push_back(pr);
        }
    }

    MeshIR mesh;
    mesh.name = "ply";

    // データ読み
    const std::uint8_t *p = all.data() + dataStart;
    const std::uint8_t *pEnd = all.data() + all.size();
    std::istringstream asciiStream;
    if (fmt == Fmt::Ascii) {
        asciiStream.str(std::string(reinterpret_cast<const char *>(p), pEnd - p));
    }
    auto readTypeBinary = [&](PType t, double &out) -> bool {
        std::size_t sz = ptype_size(t);
        if (p + sz > pEnd) return false;
        switch (t) {
        case PType::U8:  out = p[0]; break;
        case PType::I8:  out = (std::int8_t)p[0]; break;
        case PType::U16: { std::uint16_t v; std::memcpy(&v, p, 2); out = v; break; }
        case PType::I16: { std::int16_t  v; std::memcpy(&v, p, 2); out = v; break; }
        case PType::U32: { std::uint32_t v; std::memcpy(&v, p, 4); out = v; break; }
        case PType::I32: { std::int32_t  v; std::memcpy(&v, p, 4); out = v; break; }
        case PType::F32: { float v; std::memcpy(&v, p, 4); out = v; break; }
        case PType::F64: { double v; std::memcpy(&v, p, 8); out = v; break; }
        default: return false;
        }
        p += sz;
        return true;
    };
    auto readTypeAscii = [&](PType, double &out) -> bool {
        return static_cast<bool>(asciiStream >> out);
    };
    auto readType = [&](PType t, double &out) -> bool {
        if (fmt == Fmt::Ascii) return readTypeAscii(t, out);
        if (fmt == Fmt::BinaryLE) return readTypeBinary(t, out);
        // BE は未対応
        return false;
    };

    // 1 パス: 全 element を順に。vertex 要素は position を蓄積、face 要素は indices に展開
    std::vector<float> verts;
    for (const auto &e : elems) {
        if (e.name == "vertex") {
            int xi = -1, yi = -1, zi = -1;
            for (std::size_t i = 0; i < e.props.size(); ++i) {
                if (e.props[i].name == "x") xi = static_cast<int>(i);
                else if (e.props[i].name == "y") yi = static_cast<int>(i);
                else if (e.props[i].name == "z") zi = static_cast<int>(i);
            }
            for (std::size_t v = 0; v < e.count; ++v) {
                float x = 0, y = 0, z = 0;
                for (std::size_t i = 0; i < e.props.size(); ++i) {
                    double d;
                    if (e.props[i].isList) {
                        double ct; readType(e.props[i].countType, ct);
                        int cnt = static_cast<int>(ct);
                        for (int k = 0; k < cnt; ++k) { readType(e.props[i].itemType, d); }
                    } else {
                        readType(e.props[i].itemType, d);
                        if ((int)i == xi) x = static_cast<float>(d);
                        else if ((int)i == yi) y = static_cast<float>(d);
                        else if ((int)i == zi) z = static_cast<float>(d);
                    }
                }
                verts.push_back(x); verts.push_back(y); verts.push_back(z);
            }
        } else if (e.name == "face") {
            for (std::size_t fi = 0; fi < e.count; ++fi) {
                for (const auto &pr : e.props) {
                    if (pr.isList) {
                        double ct; readType(pr.countType, ct);
                        int cnt = static_cast<int>(ct);
                        std::vector<std::uint32_t> poly;
                        poly.reserve(cnt);
                        for (int k = 0; k < cnt; ++k) {
                            double d; readType(pr.itemType, d);
                            poly.push_back(static_cast<std::uint32_t>(d));
                        }
                        if (pr.name == "vertex_indices" || pr.name == "vertex_index") {
                            for (std::size_t k = 1; k + 1 < poly.size(); ++k) {
                                mesh.indices.push_back(poly[0]);
                                mesh.indices.push_back(poly[k]);
                                mesh.indices.push_back(poly[k+1]);
                            }
                        }
                    } else {
                        double d; readType(pr.itemType, d);
                    }
                }
            }
        } else {
            // 不明な element はスキップ
            for (std::size_t k = 0; k < e.count; ++k) {
                for (const auto &pr : e.props) {
                    if (pr.isList) {
                        double ct; readType(pr.countType, ct);
                        int cnt = static_cast<int>(ct);
                        for (int j = 0; j < cnt; ++j) { double d; readType(pr.itemType, d); }
                    } else {
                        double d; readType(pr.itemType, d);
                    }
                }
            }
        }
    }

    if (verts.empty() || mesh.indices.empty()) {
        r.error = "PLY: no vertices or faces";
        return r;
    }
    mesh.positions = std::move(verts);
    r.ir.meshes.push_back(std::move(mesh));
    MaterialIR m; m.name = "default";
    r.ir.materials.push_back(m);
    return r;
}

}
