#include "mv1_dump.hpp"
#include <cstdio>

namespace mv1conv {

namespace {

void print_header(const Mv1File &f, std::FILE *out) {
    auto h = f.header();
    std::fprintf(out, "== Root Header ==\n");
    std::fprintf(out, "  CheckID              : %.4s\n", h->CheckID);
    std::fprintf(out, "  Version              : %u\n", h->Version);
    std::fprintf(out, "  RightHandType        : %s\n", h->RightHandType ? "right" : "left");
    std::fprintf(out, "  AutoCreateNormal     : %d\n", h->AutoCreateNormal);
    std::fprintf(out, "  FrameNum             : %d  (Frame off=0x%X)\n", h->FrameNum, h->Frame);
    std::fprintf(out, "  TopFrameNum          : %d\n", h->TopFrameNum);
    std::fprintf(out, "  FrameUseSkinBoneNum  : %d\n", h->FrameUseSkinBoneNum);
    std::fprintf(out, "  MaterialNum          : %d  (Material off=0x%X)\n", h->MaterialNum, h->Material);
    std::fprintf(out, "  TextureNum           : %d  (Texture off=0x%X)\n", h->TextureNum, h->Texture);
    std::fprintf(out, "  MeshNum              : %d  (Mesh off=0x%X)\n", h->MeshNum, h->Mesh);
    std::fprintf(out, "  LightNum             : %d\n", h->LightNum);
    std::fprintf(out, "  SkinBoneNum          : %d\n", h->SkinBoneNum);
    std::fprintf(out, "  SkinBoneUseFrameNum  : %d\n", h->SkinBoneUseFrameNum);
    std::fprintf(out, "  TriangleListNum      : %d\n", h->TriangleListNum);
    std::fprintf(out, "  VertexDataSize       : %u  (off=0x%X)\n", h->VertexDataSize, h->VertexData);
    std::fprintf(out, "  TriangleNum          : %d\n", h->TriangleNum);
    std::fprintf(out, "  TriangleListVertexNum: %d\n", h->TriangleListVertexNum);
    std::fprintf(out, "  StringSize           : %d  (StringBuffer off=0x%X, UTF8=%d)\n",
                 h->StringSize, h->StringBuffer, h->IsStringUTF8);
    std::fprintf(out, "  AnimKeyDataSize      : %d  (orig=%d)\n",
                 h->AnimKeyDataSize, h->OriginalAnimKeyDataSize);
    std::fprintf(out, "  AnimKeySetNum        : %d  (unit=%d)\n", h->AnimKeySetNum, h->AnimKeySetUnitSize);
    std::fprintf(out, "  AnimNum              : %d  (unit=%d)\n", h->AnimNum, h->AnimUnitSize);
    std::fprintf(out, "  AnimSetNum           : %d\n", h->AnimSetNum);
    std::fprintf(out, "  Shape  / Physics     : off=0x%X / off=0x%X\n", h->Shape, h->Physics);
    std::fprintf(out, "  MaterialNumberOrderDraw : %d\n", h->MaterialNumberOrderDraw);
}

void print_textures(const Mv1File &f, std::FILE *out) {
    auto h = f.header();
    if (h->TextureNum <= 0 || h->Texture == 0) {
        std::fprintf(out, "\n== Textures == (none)\n");
        return;
    }
    std::fprintf(out, "\n== Textures (%d) ==\n", h->TextureNum);
    auto arr = f.at<f1::MV1_TEXTURE_F1>(h->Texture);
    if (!arr) { std::fprintf(out, "  <out-of-range>\n"); return; }
    for (int i = 0; i < h->TextureNum; ++i) {
        const auto &t = arr[i];
        std::fprintf(out, "  [%2d] name=\"%.*s\"  color=\"%.*s\"\n",
                     t.Index,
                     static_cast<int>(f.name(t.Name).size()), f.name(t.Name).data(),
                     static_cast<int>(f.name(t.ColorFilePath).size()), f.name(t.ColorFilePath).data());
        std::fprintf(out, "         alpha=\"%.*s\"  addrU/V=%d/%d  filter=%d  flag=0x%02X\n",
                     static_cast<int>(f.name(t.AlphaFilePath).size()), f.name(t.AlphaFilePath).data(),
                     t.AddressModeU, t.AddressModeV, t.FilterMode, t.Flag);
    }
}

void print_materials(const Mv1File &f, std::FILE *out) {
    auto h = f.header();
    if (h->MaterialNum <= 0 || h->Material == 0) {
        std::fprintf(out, "\n== Materials == (none)\n");
        return;
    }
    std::fprintf(out, "\n== Materials (%d) ==\n", h->MaterialNum);
    auto arr = f.at<f1::MV1_MATERIAL_F1>(h->Material);
    if (!arr) { std::fprintf(out, "  <out-of-range>\n"); return; }
    for (int i = 0; i < h->MaterialNum; ++i) {
        const auto &m = arr[i];
        std::fprintf(out, "  [%2d] name=\"%.*s\"  diff=(%.3f,%.3f,%.3f,%.3f) pow=%.2f alpha=%.2f\n",
                     m.Index,
                     static_cast<int>(f.name(m.Name).size()), f.name(m.Name).data(),
                     m.Diffuse.r, m.Diffuse.g, m.Diffuse.b, m.Diffuse.a,
                     m.Power, m.Alpha);
        std::fprintf(out, "         layers D=%d S=%d N=%d  blend=%d/%d  toon=%s\n",
                     m.DiffuseLayerNum, m.SpecularLayerNum, m.NormalLayerNum,
                     m.DrawBlendMode, m.DrawBlendParam, m.ToonInfo ? "yes" : "no");
        for (int li = 0; li < m.DiffuseLayerNum && li < 8; ++li) {
            std::fprintf(out, "           D[%d]: tex=%d blend=%d\n",
                         li, m.DiffuseLayer[li].Texture, m.DiffuseLayer[li].BlendType);
        }
    }
}

void print_triangle_lists(const Mv1File &f, std::FILE *out) {
    auto h = f.header();
    if (h->TriangleListNum <= 0 || h->TriangleList == 0) {
        std::fprintf(out, "\n== TriangleLists == (none)\n");
        return;
    }
    std::fprintf(out, "\n== TriangleLists (%d) ==\n", h->TriangleListNum);
    auto arr = f.at<f1::MV1_TRIANGLE_LIST_F1>(h->TriangleList);
    if (!arr) { std::fprintf(out, "  <out-of-range>\n"); return; }
    for (int i = 0; i < h->TriangleListNum; ++i) {
        const auto &t = arr[i];
        std::fprintf(out, "  [%2d] vtype=%u flag=0x%04X vnum=%u inum=%u  container=0x%X  data=0x%X\n",
                     t.Index, t.VertexType, t.Flag, t.VertexNum, t.IndexNum, t.Container, t.MeshVertexIndexAndIndexData);
    }
}

}

int dump(const Mv1File &file, std::FILE *out) {
    if (!file.ok()) {
        std::fprintf(out, "ERROR: %s\n", file.error().c_str());
        return 1;
    }
    auto h = file.header();
    if (!h) { std::fprintf(out, "ERROR: header inaccessible\n"); return 1; }

    print_header(file, out);
    print_textures(file, out);
    print_materials(file, out);
    print_triangle_lists(file, out);
    return 0;
}

}
