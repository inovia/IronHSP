#include "mv1_reader.hpp"
#include "mv1_dump.hpp"
#include "obj_export.hpp"
#include <cstdio>
#include <cstring>
#include <string>

using namespace mv1conv;

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
    std::fprintf(stderr, "unknown subcommand: %s\n", sub);
    return 2;
}
