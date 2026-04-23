#include "mv1_reader.hpp"
#include "mv1_dump.hpp"
#include "mv1_to_ir.hpp"
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
#include "vmd_import.hpp"
#include "vrm_import.hpp"
#ifdef MV1CONV_HAVE_ASSIMP
#include "assimp_export.hpp"
#endif
#ifdef MV1CONV_HAVE_ASSIMP
#include "assimp_import.hpp"
#endif
#include "mv1_writer.hpp"
#include "dxa.hpp"
#include <cstdio>
#include <cstring>
#include <filesystem>
#include <string>

using namespace mv1conv;

static int convert_generic(const char *in, const char *out, bool noBones = false) {
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
#ifdef MV1CONV_HAVE_ASSIMP
        // assimp の X importer は multi-mesh 階層を展開してくれるので、
        // MV1CONV_X_USE_BUILTIN=1 が無ければ assimp を優先
        if (!std::getenv("MV1CONV_X_USE_BUILTIN")) {
            lr = load_via_assimp(in);
            if (!lr.ok()) { err = lr.error; }
            else ir = &lr.ir;
        } else
#endif
        {
            lr = load_x(in);
            if (!lr.ok()) { err = lr.error; }
            else ir = &lr.ir;
        }
    } else if (ext == "glb" || ext == "gltf" || ext == "vrm") {
#ifdef MV1CONV_HAVE_ASSIMP
        lr = load_via_assimp(in);
        if (!lr.ok()) { err = lr.error; }
        else ir = &lr.ir;
#else
        lr = load_glb(in);
        if (!lr.ok()) { err = lr.error; }
        else ir = &lr.ir;
#endif
        // .vrm 限定で VRM 拡張を上書き適用 (humanoid bone rename + MToon)
        if (ext == "vrm" && lr.ok()) {
            bool useMmdNames = std::getenv("MV1CONV_VRM_MMD_NAMES") != nullptr;
            auto vr = apply_vrm_extensions(in, lr.ir, useMmdNames);
            if (vr.ok()) { lr.ir = std::move(vr.ir); ir = &lr.ir; }
        }
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
    } else if (ext == "mv1") {
        // MV1 → IR 変換 (round-trip + anim 保持の要)
        lr = load_mv1_to_ir(in);
        if (!lr.ok()) { err = lr.error; }
        else ir = &lr.ir;
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

    if (noBones) {
        ir->bones.clear();
        for (auto &m : ir->meshes) m.bone_weights.clear();
    }
    // TEMP debug: --no-tex flag でテクスチャ bind を消す
    if (std::getenv("MV1CONV_NO_TEX")) {
        ir->textures.clear();
        for (auto &mat : ir->materials) mat.diffuse_texture = -1;
    }
    if (std::getenv("MV1CONV_NO_UV")) {
        for (auto &m : ir->meshes) m.uvs.clear();
    }
    if (const char *onlyStr = std::getenv("MV1CONV_ONLY_MESH")) {
        int idx = std::atoi(onlyStr);
        if (idx >= 0 && idx < static_cast<int>(ir->meshes.size())) {
            MeshIR keep = std::move(ir->meshes[idx]);
            ir->meshes.clear();
            ir->meshes.push_back(std::move(keep));
        }
    }
    if (const char *firstN = std::getenv("MV1CONV_FIRST_N")) {
        int n = std::atoi(firstN);
        if (n > 0 && n < static_cast<int>(ir->meshes.size())) {
            ir->meshes.resize(n);
        }
    }

    // ====== Texture copy: 入力 .obj/.fbx/.pmx が参照するテクスチャ実ファイルを
    //        出力 .mv1 と同じディレクトリにコピーし、IR のパスを basename に書き換え。
    //        環境変数 MV1CONV_NO_COPY_TEX=1 で無効化。 ======
    if (!std::getenv("MV1CONV_NO_COPY_TEX") && !ir->textures.empty()) {
        namespace fs = std::filesystem;
        fs::path in_path(in);
        fs::path out_path(out);
        fs::path in_dir  = in_path.has_parent_path() ? in_path.parent_path() : fs::path(".");
        fs::path out_dir = out_path.has_parent_path() ? out_path.parent_path() : fs::path(".");
        int copied = 0, missing = 0;
        for (auto &tex : ir->textures) {
            if (tex.color_path.empty()) continue;
            fs::path src(tex.color_path);
            // 絶対パスならそのまま、相対なら入力 dir から解決
            if (!src.is_absolute()) src = in_dir / src;
            std::error_code ec;
            fs::path resolved = fs::weakly_canonical(src, ec);
            if (ec || !fs::exists(resolved, ec)) {
                // 入力 dir 基準以外にも basename 単体で探す (GPB 等ファイル名のみ)
                fs::path alt = in_dir / fs::path(tex.color_path).filename();
                if (fs::exists(alt, ec)) resolved = alt;
            }
            if (!fs::exists(resolved, ec)) {
                ++missing;
                continue;
            }
            fs::path dst = out_dir / resolved.filename();
            // 同一パスなら copy 不要 (round-trip 時)
            if (fs::exists(dst, ec)) {
                std::error_code ec2;
                if (!fs::equivalent(resolved, dst, ec2)) {
                    fs::copy_file(resolved, dst, fs::copy_options::overwrite_existing, ec2);
                    if (!ec2) ++copied;
                }
            } else {
                std::error_code ec2;
                fs::copy_file(resolved, dst, fs::copy_options::overwrite_existing, ec2);
                if (!ec2) ++copied;
            }
            // IR のパスを basename に書き換え (DxLib は .mv1 と同じ dir を探す)
            tex.color_path = resolved.filename().string();
            if (tex.name.find('/') != std::string::npos || tex.name.find('\\') != std::string::npos) {
                tex.name = resolved.filename().string();
            }
        }
        if (copied > 0 || missing > 0) {
            std::fprintf(stderr, "textures: %d copied, %d missing (use MV1CONV_NO_COPY_TEX=1 to skip)\n",
                         copied, missing);
        }
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
        std::fprintf(stderr, "usage: mv1conv convert [--no-bones] <input> <output.mv1>\n");
        return 2;
    }
    bool noBones = false;
    int a = 0;
    if (argc >= 3 && std::strcmp(argv[0], "--no-bones") == 0) { noBones = true; a = 1; }
    return convert_generic(argv[a], argv[a + 1], noBones);
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

static void print_usage(std::FILE *fp) {
    std::fprintf(fp,
        "mv1conv — DxLib .mv1 reader / writer / converter\n"
        "\n"
        "Subcommands:\n"
        "  convert <input> <output.mv1> [--no-bones]\n"
        "      任意フォーマット (.obj/.stl/.ply/.x/.glb/.gltf/.vrm/.wrl/.pmd/\n"
        "       .pmx/.gpb/.fbx/.dae/.3ds/.usdz/.mv1/その他 assimp 対応) → .mv1\n"
        "  export <input.mv1> <output.ext>\n"
        "      .mv1 → .obj/.gltf/.glb/.dae/.ply/.stl/.fbx (assimp Exporter 経由)\n"
        "  attach-anim <model.mv1> <motion.vmd> <output.mv1>\n"
        "      VMD (MMD motion) を .mv1 に付与 (bone + face morph)\n"
        "  dump   <file.mv1>\n"
        "      header/frames/meshes/materials/textures/TL/anims/shapes を表示\n"
        "  decode <file.mv1> <out.bin>\n"
        "      DXA 展開後の生バッファを書き出し (debug 用)\n"
        "  repack <in.mv1> <out.mv1>\n"
        "      decode → 再 encode で DXA round-trip 検証\n"
        "  obj <file.mv1> <out.obj>\n"
        "      静的メッシュを OBJ に抽出 (deprecated、export 推奨)\n"
        "  from-obj <in.obj> <out.mv1>\n"
        "      OBJ → .mv1 (deprecated、convert 推奨)\n"
        "  batch [-o <outdir>] <input1> [input2 ...]\n"
        "      複数入力を一括変換 (glob はシェルに展開させる)\n"
        "\n"
        "Environment variables:\n"
        "  MV1CONV_NO_COPY_TEX=1    texture コピー無効化\n"
        "  MV1CONV_VIA_BLENDER=1    assimp FBX 失敗時に Blender fallback\n"
        "  MV1CONV_BLENDER=/path    Blender 実行ファイル明示\n"
        "  MV1CONV_VRM_MMD_NAMES=1  VRM humanoid bone を MMD 日本語名に変換\n"
        "  MV1CONV_X_USE_BUILTIN=1  .x は組込 loader (assimp の代わりに)\n"
        "  MV1CONV_NO_TEX=1         texture 全削除 (debug)\n"
        "  MV1CONV_NO_UV=1          UV 全削除 (debug)\n"
        "  MV1CONV_ONLY_MESH=N      mesh #N のみ残す (debug)\n"
        "  MV1CONV_FIRST_N=N        先頭 N meshes のみ残す (debug)\n"
        "\n"
        "Options:\n"
        "  --help, -h  : usage 表示\n"
    );
}

int main(int argc, char **argv) {
    if (argc < 2 ||
        std::strcmp(argv[1], "--help") == 0 ||
        std::strcmp(argv[1], "-h") == 0) {
        print_usage((argc < 2) ? stderr : stdout);
        return (argc < 2) ? 2 : 0;
    }
    const char *sub = argv[1];
    if (std::strcmp(sub, "dump") == 0)   return cmd_dump(argc - 2, argv + 2);
    if (std::strcmp(sub, "decode") == 0) return cmd_decode(argc - 2, argv + 2);
    if (std::strcmp(sub, "obj") == 0)    return cmd_obj(argc - 2, argv + 2);
    if (std::strcmp(sub, "repack") == 0) return cmd_repack(argc - 2, argv + 2);
    if (std::strcmp(sub, "from-obj") == 0) return cmd_from_obj(argc - 2, argv + 2);
    if (std::strcmp(sub, "convert") == 0)  return cmd_convert(argc - 2, argv + 2);
    if (std::strcmp(sub, "export") == 0) {
        if (argc < 4) {
            std::fprintf(stderr,
                         "usage: mv1conv export <input.mv1> <output.<obj|gltf|glb|dae|ply|stl|fbx>>\n");
            return 2;
        }
        const char *inPath  = argv[2];
        const char *outPath = argv[3];
        auto lr = load_mv1_to_ir(inPath);
        if (!lr.ok()) {
            std::fprintf(stderr, "ERROR: %s\n", lr.error.c_str());
            return 1;
        }
#ifdef MV1CONV_HAVE_ASSIMP
        std::string err = export_via_assimp(lr.ir, outPath, "");
        if (!err.empty()) {
            std::fprintf(stderr, "ERROR: %s\n", err.c_str());
            return 1;
        }
        std::fprintf(stderr, "exported %s → %s\n", inPath, outPath);
        return 0;
#else
        std::fprintf(stderr, "ERROR: export requires assimp (build without MV1CONV_USE_ASSIMP=OFF)\n");
        return 1;
#endif
    }
    if (std::strcmp(sub, "attach-anim") == 0) {
        if (argc < 5) {
            std::fprintf(stderr,
                         "usage: mv1conv attach-anim <model.mv1> <motion.vmd> <out.mv1>\n");
            return 2;
        }
        const char *modelPath = argv[2];
        const char *vmdPath   = argv[3];
        const char *outPath   = argv[4];
        auto lr = load_mv1_to_ir(modelPath);
        if (!lr.ok()) {
            std::fprintf(stderr, "ERROR: %s\n", lr.error.c_str());
            return 1;
        }
        auto attached = attach_vmd(vmdPath, lr.ir);
        if (!attached.ok()) {
            std::fprintf(stderr, "ERROR: %s\n", attached.error.c_str());
            return 1;
        }
        auto w = save_mv1(attached.ir, outPath);
        if (!w.ok()) {
            std::fprintf(stderr, "ERROR: %s\n", w.error.c_str());
            return 1;
        }
        std::fprintf(stderr, "attached anim: animSets=%zu anims=%zu keysets=%zu\n",
                     attached.ir.anim_sets.size(), attached.ir.anims.size(),
                     attached.ir.anim_keysets.size());
        return 0;
    }
    if (std::strcmp(sub, "batch") == 0) {
        // usage: mv1conv batch -o <outdir> <input1> [input2 ...]
        // 各入力を <outdir>/<stem>.mv1 に変換。
        std::string outdir = ".";
        std::vector<std::string> inputs;
        for (int i = 2; i < argc; ++i) {
            if (std::strcmp(argv[i], "-o") == 0 && i + 1 < argc) {
                outdir = argv[++i];
            } else {
                inputs.push_back(argv[i]);
            }
        }
        if (inputs.empty()) {
            std::fprintf(stderr, "usage: mv1conv batch [-o <outdir>] <input1> [input2 ...]\n");
            return 2;
        }
        std::error_code ec;
        std::filesystem::create_directories(outdir, ec);
        int ok = 0, ng = 0;
        for (const auto &in : inputs) {
            std::filesystem::path p(in);
            std::string stem = p.stem().string();
            std::string out = (std::filesystem::path(outdir) / (stem + ".mv1")).string();
            int rc = convert_generic(in.c_str(), out.c_str(), false);
            if (rc == 0) ++ok; else ++ng;
        }
        std::fprintf(stderr, "batch: %d ok / %d failed\n", ok, ng);
        return ng == 0 ? 0 : 1;
    }
    std::fprintf(stderr, "unknown subcommand: %s (try --help)\n", sub);
    return 2;
}
