#include "mv1_reader.hpp"
#include "mv1_dump.hpp"
#include "obj_export.hpp"
#include "obj_import.hpp"
#include "stl_import.hpp"
#include "ply_import.hpp"
#include "x_import.hpp"
#include "glb_import.hpp"
#include "wrl_import.hpp"
#include "pmd_import.hpp"
#include "pmx_import.hpp"
#include "gpb_import.hpp"
#ifdef MV1CONV_HAVE_ASSIMP
#include "assimp_import.hpp"
#endif
#include "mv1_writer.hpp"
#include "dxa.hpp"
#include <cstdio>
#include <cstring>
#include <string>

using namespace mv1conv;

static int convert_generic(const char *in, const char *out) {
    // 拡張子で判別
    std::string path(in);
    auto ext_pos = path.find_last_of('.');
    std::string ext = (ext_pos == std::string::npos) ? "" : path.substr(ext_pos + 1);
    for (auto &c : ext) c = static_cast<char>(std::tolower(c));

    LoadResult lr;
    ObjLoadResult olr;
    ModelIR *ir = nullptr;
    std::string err;

    if (ext == "stl") {
        lr = load_stl(in);
        if (!lr.ok()) { err = lr.error; }
        else ir = &lr.ir;
    } else if (ext == "ply") {
        lr = load_ply(in);
        if (!lr.ok()) { err = lr.error; }
        else ir = &lr.ir;
    } else if (ext == "x") {
        lr = load_x(in);
        if (!lr.ok()) { err = lr.error; }
        else ir = &lr.ir;
    } else if (ext == "glb" || ext == "gltf" || ext == "vrm") {
        // .vrm は GLB ベース: 基礎 geometry + スキン + マテリアル色は取り込める。
        // VRM 固有拡張 (humanoid mapping / SpringBone / MToon) は現状未対応。
#ifdef MV1CONV_HAVE_ASSIMP
        // assimp の glTF importer は VRM を GLB として扱えてボーン抽出できる
        lr = load_via_assimp(in);
        if (!lr.ok()) { err = lr.error; }
        else ir = &lr.ir;
#else
        lr = load_glb(in);
        if (!lr.ok()) { err = lr.error; }
        else ir = &lr.ir;
#endif
    } else if (ext == "wrl" || ext == "vrml") {
        lr = load_wrl(in);
        if (!lr.ok()) { err = lr.error; }
        else ir = &lr.ir;
    } else if (ext == "pmd") {
        lr = load_pmd(in);
        if (!lr.ok()) { err = lr.error; }
        else ir = &lr.ir;
    } else if (ext == "pmx") {
        lr = load_pmx(in);
        if (!lr.ok()) { err = lr.error; }
        else ir = &lr.ir;
    } else if (ext == "gpb") {
        lr = load_gpb(in);
        if (!lr.ok()) { err = lr.error; }
        else ir = &lr.ir;
#ifdef MV1CONV_HAVE_ASSIMP
    } else if (ext == "fbx" || ext == "dae" || ext == "3ds" ||
               ext == "blend" || ext == "ase" || ext == "ifc" ||
               ext == "ms3d" || ext == "lwo" || ext == "lws" ||
               ext == "3mf" || ext == "m3d" || ext == "b3d" ||
               ext == "usd" || ext == "usda" || ext == "usdc" || ext == "usdz") {
        lr = load_via_assimp(in);
        if (!lr.ok()) { err = lr.error; }
        else ir = &lr.ir;
#endif
    } else if (ext == "obj") {
        olr = load_obj(in);
        if (!olr.ok()) { err = olr.error; }
        else ir = &olr.ir;
    } else {
        std::fprintf(stderr, "unsupported extension: %s\n  built-in: .obj .stl .ply .x .glb .gltf .vrm .wrl .pmd .pmx .gpb\n"
#ifdef MV1CONV_HAVE_ASSIMP
                     "  assimp:   .fbx .dae .3ds .blend .3mf .ase .ifc .ms3d .lwo .m3d .b3d\n"
#endif
                     , ext.c_str());
        return 2;
    }

    if (!err.empty()) {
        std::fprintf(stderr, "ERROR: %s\n", err.c_str());
        return 1;
    }

    auto w = save_mv1(*ir, out);
    if (!w.ok()) {
        std::fprintf(stderr, "ERROR: %s\n", w.error.c_str());
        return 1;
    }
    std::size_t totalTri = 0;
    for (const auto &m : ir->meshes) totalTri += m.indices.size() / 3;
    std::fprintf(stderr, "wrote %s (%zu bytes)  meshes=%zu tris=%zu\n",
                 out, w.bytes.size(), ir->meshes.size(), totalTri);

    auto check = Mv1File::load(out);
    if (!check.ok()) {
        std::fprintf(stderr, "FAIL re-load: %s\n", check.error().c_str());
        return 1;
    }
    auto h = check.header();
    std::fprintf(stderr, "re-load OK: frames=%d meshes=%d mats=%d tris=%d\n",
                 h->FrameNum, h->MeshNum, h->MaterialNum, h->TriangleNum);
    return 0;
}

static int cmd_convert(int argc, char **argv) {
    if (argc < 2) {
        std::fprintf(stderr, "usage: mv1conv convert <input.{obj|stl|ply}> <output.mv1>\n");
        return 2;
    }
    return convert_generic(argv[0], argv[1]);
}

static int cmd_from_obj(int argc, char **argv) {
    if (argc < 2) {
        std::fprintf(stderr, "usage: mv1conv from-obj <input.obj> <output.mv1>\n");
        return 2;
    }
    auto obj = load_obj(argv[0]);
    if (!obj.ok()) {
        std::fprintf(stderr, "ERROR: %s\n", obj.error.c_str());
        return 1;
    }
    auto w = save_mv1(obj.ir, argv[1]);
    if (!w.ok()) {
        std::fprintf(stderr, "ERROR: %s\n", w.error.c_str());
        return 1;
    }
    std::fprintf(stderr, "wrote %s (%zu bytes)  meshes=%zu tris=%zu\n",
                 argv[1], w.bytes.size(), obj.ir.meshes.size(),
                 obj.ir.meshes[0].indices.size() / 3);

    // 再読込 check
    auto check = Mv1File::load(argv[1]);
    if (!check.ok()) {
        std::fprintf(stderr, "FAIL re-load: %s\n", check.error().c_str());
        return 1;
    }
    auto h = check.header();
    std::fprintf(stderr, "re-load OK: frames=%d meshes=%d mats=%d tris=%d\n",
                 h->FrameNum, h->MeshNum, h->MaterialNum, h->TriangleNum);
    return 0;
}

static int cmd_repack(int argc, char **argv) {
    if (argc < 2) {
        std::fprintf(stderr, "usage: mv1conv repack <file.mv1> <out.mv1>\n");
        return 2;
    }
    auto f = Mv1File::load(argv[0]);
    if (!f.ok()) {
        std::fprintf(stderr, "ERROR: %s\n", f.error().c_str());
        return 1;
    }
    auto buf = f.buffer();
    // 最初の 4 byte (CheckID) は外側の magic、DXA 内容は buf[4..] 相当
    auto inner = buf.subspan(4);
    auto dxa_block = dxa::encode(inner);

    std::vector<std::uint8_t> out;
    out.reserve(4 + dxa_block.size());
    out.push_back('M'); out.push_back('V'); out.push_back('1'); out.push_back('1');
    out.insert(out.end(), dxa_block.begin(), dxa_block.end());

    std::FILE *fp = std::fopen(argv[1], "wb");
    if (!fp) { std::fprintf(stderr, "cannot write: %s\n", argv[1]); return 1; }
    std::fwrite(out.data(), 1, out.size(), fp);
    std::fclose(fp);
    std::fprintf(stderr, "wrote %s (%zu bytes, DXA block %zu)\n",
                 argv[1], out.size(), dxa_block.size());

    // round-trip 検証
    auto check = Mv1File::load(argv[1]);
    if (!check.ok()) {
        std::fprintf(stderr, "FAIL: re-loaded file errored: %s\n", check.error().c_str());
        return 1;
    }
    if (check.buffer().size() != buf.size()) {
        std::fprintf(stderr, "FAIL: buffer size mismatch %zu vs %zu\n",
                     check.buffer().size(), buf.size());
        return 1;
    }
    if (std::memcmp(check.buffer().data(), buf.data(), buf.size()) != 0) {
        std::fprintf(stderr, "FAIL: buffer content mismatch\n");
        return 1;
    }
    std::fprintf(stderr, "OK: round-trip byte-identical\n");
    return 0;
}

static int cmd_obj(int argc, char **argv) {
    if (argc < 2) {
        std::fprintf(stderr, "usage: mv1conv obj <file.mv1> <out.obj>\n");
        return 2;
    }
    auto f = Mv1File::load(argv[0]);
    if (!f.ok()) {
        std::fprintf(stderr, "ERROR: %s\n", f.error().c_str());
        return 1;
    }
    return export_obj(f, argv[1]);
}

static int cmd_dump(int argc, char **argv) {
    if (argc < 1) {
        std::fprintf(stderr, "usage: mv1conv dump <file.mv1>\n");
        return 2;
    }
    auto f = Mv1File::load(argv[0]);
    return dump(f, stdout);
}

static int cmd_decode(int argc, char **argv) {
    if (argc < 2) {
        std::fprintf(stderr, "usage: mv1conv decode <file.mv1> <out.bin>\n");
        return 2;
    }
    auto f = Mv1File::load(argv[0]);
    // 失敗しても buffer を書き出して原因調査できるように
    auto buf = f.buffer();
    if (buf.empty() && !f.ok()) {
        std::fprintf(stderr, "ERROR: %s\n", f.error().c_str());
        return 1;
    }
    std::FILE *fp = std::fopen(argv[1], "wb");
    if (!fp) { std::fprintf(stderr, "cannot write: %s\n", argv[1]); return 1; }
    std::fwrite(buf.data(), 1, buf.size(), fp);
    std::fclose(fp);
    std::fprintf(stderr, "wrote %zu bytes to %s  (mv1 ok=%d err=%s)\n",
                 buf.size(), argv[1], (int)f.ok(), f.error().c_str());
    return 0;
}

int main(int argc, char **argv) {
    if (argc < 2) {
        std::fprintf(stderr,
                     "mv1conv — DxLib .mv1 reader/converter\n"
                     "usage:\n"
                     "  mv1conv dump   <file.mv1>           -- print header/materials/textures/triangle lists\n"
                     "  mv1conv decode <file.mv1> <out.bin> -- write DXA-decoded raw buffer to out.bin\n");
        return 2;
    }
    const char *sub = argv[1];
    if (std::strcmp(sub, "dump") == 0)   return cmd_dump(argc - 2, argv + 2);
    if (std::strcmp(sub, "decode") == 0) return cmd_decode(argc - 2, argv + 2);
    if (std::strcmp(sub, "obj") == 0)    return cmd_obj(argc - 2, argv + 2);
    if (std::strcmp(sub, "repack") == 0) return cmd_repack(argc - 2, argv + 2);
    if (std::strcmp(sub, "from-obj") == 0) return cmd_from_obj(argc - 2, argv + 2);
    if (std::strcmp(sub, "convert") == 0)  return cmd_convert(argc - 2, argv + 2);
    std::fprintf(stderr, "unknown subcommand: %s\n", sub);
    return 2;
}
