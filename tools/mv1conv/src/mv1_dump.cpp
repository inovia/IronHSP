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

namespace {

void print_frames(const Mv1File &f, std::FILE *out) {
    auto h = f.header();
    if (h->FrameNum <= 0 || h->Frame == 0) {
        std::fprintf(out, "\n== Frames == (none)\n");
        return;
    }
    std::fprintf(out, "\n== Frames (%d, top=%d) ==\n", h->FrameNum, h->TopFrameNum);
    auto arr = f.at<f1::MV1_FRAME_F1>(h->Frame);
    if (!arr) { std::fprintf(out, "  <out-of-range>\n"); return; }
    for (int i = 0; i < h->FrameNum; ++i) {
        const auto &fr = arr[i];
        std::fprintf(out, "  [%2d] name=\"%.*s\"  mesh=%d  bones=%d(use=%d)  verts=%d tri=%d  parent=0x%X\n",
                     fr.Index,
                     static_cast<int>(f.name(fr.Name).size()), f.name(fr.Name).data(),
                     fr.MeshNum, fr.SkinBoneNum, fr.UseSkinBoneNum,
                     fr.VertexNum, fr.TriangleNum, fr.Parent);
        std::fprintf(out, "         T=(%.3f,%.3f,%.3f) S=(%.3f,%.3f,%.3f) R=(%.3f,%.3f,%.3f)  Q=(%.3f,%.3f,%.3f,%.3f)\n",
                     fr.Translate.x, fr.Translate.y, fr.Translate.z,
                     fr.Scale.x, fr.Scale.y, fr.Scale.z,
                     fr.Rotate.x, fr.Rotate.y, fr.Rotate.z,
                     fr.Quaternion.x, fr.Quaternion.y, fr.Quaternion.z, fr.Quaternion.w);
        std::fprintf(out, "         VertFlag=0x%04X  MaxBoneBlend=%u  PosNum=%d NormNum=%d  PandN=0x%X  FrameShape=0x%X\n",
                     fr.VertFlag, fr.MaxBoneBlendNum,
                     fr.PositionNum, fr.NormalNum, fr.PositionAndNormalData, fr.FrameShape);
    }
}

void print_meshes(const Mv1File &f, std::FILE *out) {
    auto h = f.header();
    if (h->MeshNum <= 0 || h->Mesh == 0) {
        std::fprintf(out, "\n== Meshes == (none)\n");
        return;
    }
    std::fprintf(out, "\n== Meshes (%d) ==\n", h->MeshNum);
    auto arr = f.at<f1::MV1_MESH_F1>(h->Mesh);
    if (!arr) { std::fprintf(out, "  <out-of-range>\n"); return; }
    for (int i = 0; i < h->MeshNum; ++i) {
        const auto &m = arr[i];
        std::fprintf(out, "  [%2d] container=0x%X mat=0x%X  V=%d F=%d  tris=%d  vflag=0x%X\n",
                     m.Index, m.Container, m.Material, m.VertexNum, m.FaceNum, m.TriangleListNum, m.VertFlag);
        std::fprintf(out, "         Shape=%d  Visible=%d  Cull=%d  UVSets=%u UVComp=%u  vDiff=%d vSpec=%d\n",
                     m.Shape, m.Visible, m.BackCulling, m.UVSetUnitNum, m.UVUnitNum,
                     m.UseVertexDiffuseColor, m.UseVertexSpecularColor);
    }
}

void print_skinbones(const Mv1File &f, std::FILE *out) {
    auto h = f.header();
    if (h->SkinBoneNum <= 0 || h->SkinBone == 0) return;
    std::fprintf(out, "\n== SkinBones (%d) ==\n", h->SkinBoneNum);
    auto arr = f.at<f1::MV1_SKIN_BONE_F1>(h->SkinBone);
    if (!arr) return;
    for (int i = 0; i < h->SkinBoneNum; ++i) {
        const auto &b = arr[i];
        std::fprintf(out, "  [%2d] BoneFrame=%d  translateOnly=%d  useFrameNum=%d  T=(%.3f,%.3f,%.3f)\n",
                     b.Index, b.BoneFrame, b.ModelLocalMatrixIsTranslateOnly, b.UseFrameNum,
                     b.ModelLocalMatrix.m[3][0], b.ModelLocalMatrix.m[3][1], b.ModelLocalMatrix.m[3][2]);
    }
}

void print_animsets(const Mv1File &f, std::FILE *out) {
    auto h = f.header();
    if (h->AnimSetNum <= 0 || h->AnimSet == 0) {
        if (h->AnimNum > 0)
            std::fprintf(out, "\n== Anim == %d anim, %d keyset (no animset array)\n", h->AnimNum, h->AnimKeySetNum);
        return;
    }
    std::fprintf(out, "\n== AnimSets (%d, anims=%d keysets=%d keyDataSize=%d) ==\n",
                 h->AnimSetNum, h->AnimNum, h->AnimKeySetNum, h->AnimKeyDataSize);
    auto arr = f.at<f1::MV1_ANIMSET_F1>(h->AnimSet);
    if (!arr) return;
    for (int i = 0; i < h->AnimSetNum; ++i) {
        const auto &a = arr[i];
        std::fprintf(out, "  [%2d] name=\"%.*s\"  maxTime=%.3f  animNum=%d  flag=0x%X\n",
                     a.Index,
                     static_cast<int>(f.name(a.Name).size()), f.name(a.Name).data(),
                     a.MaxTime, a.AnimNum, a.Flag);
    }
}

void print_shape(const Mv1File &f, std::FILE *out) {
    auto h = f.header();
    if (h->Shape == 0) return;
    auto s = f.at<f1::MV1_FILEHEAD_SHAPE_F1>(h->Shape);
    if (!s) return;
    std::fprintf(out, "\n== Shape (off=0x%X) ==\n", h->Shape);
    std::fprintf(out, "  FrameNum=%d  DataNum=%d  MeshNum=%d  VertexNum=%d  unitSize=%d  targetMeshV=%d\n",
                 s->FrameNum, s->DataNum, s->MeshNum, s->VertexNum, s->ShapeVertexUnitSize, s->TargetMeshVertexNum);
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
    print_frames(file, out);
    print_meshes(file, out);
    print_skinbones(file, out);
    print_textures(file, out);
    print_materials(file, out);
    print_triangle_lists(file, out);
    print_animsets(file, out);
    print_shape(file, out);
    return 0;
}

}
