#include "assimp_import.hpp"
#include <assimp/Importer.hpp>
#include <assimp/scene.h>
#include <assimp/postprocess.h>
#include <algorithm>
#include <cstring>
#include <string>
#include <unordered_map>

namespace mv1conv {

namespace {

std::array<float, 4> to_color(const aiColor3D &c, float a = 1.0f) {
    return {c.r, c.g, c.b, a};
}
std::array<float, 4> to_color(const aiColor4D &c) {
    return {c.r, c.g, c.b, c.a};
}

MaterialIR convert_material(const aiMaterial *m, std::vector<TextureIR> &textures) {
    MaterialIR mat;

    aiString name;
    if (m->Get(AI_MATKEY_NAME, name) == AI_SUCCESS && name.length > 0)
        mat.name = std::string(name.C_Str(), name.length);
    else
        mat.name = "material";

    aiColor3D c3;
    float f;
    if (m->Get(AI_MATKEY_COLOR_DIFFUSE, c3) == AI_SUCCESS)  mat.diffuse  = to_color(c3);
    if (m->Get(AI_MATKEY_COLOR_AMBIENT, c3) == AI_SUCCESS)  mat.ambient  = to_color(c3);
    if (m->Get(AI_MATKEY_COLOR_SPECULAR, c3) == AI_SUCCESS) mat.specular = to_color(c3);
    if (m->Get(AI_MATKEY_COLOR_EMISSIVE, c3) == AI_SUCCESS) mat.emissive = to_color(c3, 0.0f);
    if (m->Get(AI_MATKEY_SHININESS, f) == AI_SUCCESS) mat.power = f;
    if (m->Get(AI_MATKEY_OPACITY, f) == AI_SUCCESS)   mat.alpha = 1.0f - f;  // MV1 は不透明度の逆

    // Diffuse texture (path のみ、画像データは取り出さず参照のみ残す)
    aiString texPath;
    if (m->GetTexture(aiTextureType_DIFFUSE, 0, &texPath) == AI_SUCCESS) {
        std::string path(texPath.C_Str(), texPath.length);
        // 既存 texture と重複チェック
        int found = -1;
        for (std::size_t i = 0; i < textures.size(); ++i) {
            if (textures[i].color_path == path) { found = static_cast<int>(i); break; }
        }
        if (found >= 0) {
            mat.diffuse_texture = found;
        } else {
            TextureIR t;
            // パスからファイル名だけ取り出し name とする
            auto pos = path.find_last_of("/\\");
            t.name = (pos == std::string::npos) ? path : path.substr(pos + 1);
            t.color_path = path;
            mat.diffuse_texture = static_cast<int>(textures.size());
            textures.push_back(t);
        }
    }

    return mat;
}

void convert_mesh(const aiMesh *m, MeshIR &out,
                  const std::unordered_map<std::string, int> &boneNameToIR)
{
    out.name = std::string(m->mName.C_Str(), m->mName.length);
    if (out.name.empty()) out.name = "mesh";
    out.material = static_cast<int>(m->mMaterialIndex);

    out.positions.resize(m->mNumVertices * 3);
    for (std::uint32_t i = 0; i < m->mNumVertices; ++i) {
        out.positions[i*3+0] = m->mVertices[i].x;
        out.positions[i*3+1] = m->mVertices[i].y;
        out.positions[i*3+2] = m->mVertices[i].z;
    }
    if (m->HasNormals()) {
        out.normals.resize(m->mNumVertices * 3);
        for (std::uint32_t i = 0; i < m->mNumVertices; ++i) {
            out.normals[i*3+0] = m->mNormals[i].x;
            out.normals[i*3+1] = m->mNormals[i].y;
            out.normals[i*3+2] = m->mNormals[i].z;
        }
    }
    if (m->HasTextureCoords(0)) {
        out.uvs.resize(m->mNumVertices * 2);
        for (std::uint32_t i = 0; i < m->mNumVertices; ++i) {
            out.uvs[i*2+0] = m->mTextureCoords[0][i].x;
            // MV1 の UV は V 軸そのまま、assimp も通常そのまま (glTF と同方向)
            out.uvs[i*2+1] = m->mTextureCoords[0][i].y;
        }
    }

    out.indices.reserve(m->mNumFaces * 3);
    for (std::uint32_t i = 0; i < m->mNumFaces; ++i) {
        const auto &f = m->mFaces[i];
        if (f.mNumIndices < 3) continue;
        // fan triangulation (assimp は aiProcess_Triangulate で既に tri 化済み想定)
        for (std::uint32_t k = 1; k + 1 < f.mNumIndices; ++k) {
            out.indices.push_back(f.mIndices[0]);
            out.indices.push_back(f.mIndices[k]);
            out.indices.push_back(f.mIndices[k+1]);
        }
    }

    // スキニング: aiBone (ボーン名) + weights[i] (vertexId + weight) から
    // 頂点単位に再編成。上位 4 本だけ採用。
    if (m->mNumBones > 0 && !boneNameToIR.empty()) {
        out.bone_weights.resize(m->mNumVertices);
        for (std::uint32_t b = 0; b < m->mNumBones; ++b) {
            const aiBone *bone = m->mBones[b];
            std::string bname(bone->mName.C_Str(), bone->mName.length);
            auto it = boneNameToIR.find(bname);
            if (it == boneNameToIR.end()) continue;
            int boneIdx = it->second;
            for (std::uint32_t w = 0; w < bone->mNumWeights; ++w) {
                const auto &vw = bone->mWeights[w];
                if (vw.mVertexId >= m->mNumVertices) continue;
                auto &vb = out.bone_weights[vw.mVertexId];
                // 空スロットを探す
                int slot = -1;
                for (int s = 0; s < 4; ++s) if (vb.bone[s] < 0) { slot = s; break; }
                if (slot >= 0) {
                    vb.bone[slot] = boneIdx;
                    vb.weight[slot] = vw.mWeight;
                } else {
                    // 既に 4 本埋まっている: 最小重みと比較して置き換え
                    int minSlot = 0;
                    for (int s = 1; s < 4; ++s) if (vb.weight[s] < vb.weight[minSlot]) minSlot = s;
                    if (vw.mWeight > vb.weight[minSlot]) {
                        vb.bone[minSlot] = boneIdx;
                        vb.weight[minSlot] = vw.mWeight;
                    }
                }
            }
        }
        // 各頂点でウェイトを正規化
        for (auto &vb : out.bone_weights) {
            float sum = 0;
            for (int s = 0; s < 4; ++s) if (vb.bone[s] >= 0) sum += vb.weight[s];
            if (sum > 1e-6f) {
                for (int s = 0; s < 4; ++s) vb.weight[s] /= sum;
            }
        }
    }
}

// aiNode ツリー全体を flat な BoneIR 配列として収集 (assimp の全 node が
// 潜在的ボーン候補。実際に mesh のボーンで参照される node だけ使う)。
struct NodeRec {
    std::string name;
    int parentIR = -1;
    aiMatrix4x4 localTransform;  // node→parent (bind pose)
};

void collect_nodes(const aiNode *node, int parentIR,
                   std::vector<NodeRec> &out,
                   std::unordered_map<std::string, int> &nameMap)
{
    NodeRec r;
    r.name = std::string(node->mName.C_Str(), node->mName.length);
    r.parentIR = parentIR;
    r.localTransform = node->mTransformation;
    int myIR = static_cast<int>(out.size());
    out.push_back(r);
    if (!r.name.empty()) nameMap[r.name] = myIR;
    for (std::uint32_t c = 0; c < node->mNumChildren; ++c) {
        collect_nodes(node->mChildren[c], myIR, out, nameMap);
    }
}

void fill_bones_from_nodes(const std::vector<NodeRec> &nodes, ModelIR &ir) {
    ir.bones.reserve(nodes.size());
    for (const auto &n : nodes) {
        BoneIR b;
        b.name = n.name;
        b.parent = n.parentIR;
        // 分解: local transform を translate + rotation(quaternion) + scale へ
        aiVector3D t, s;
        aiQuaternion q;
        n.localTransform.Decompose(s, q, t);
        b.translate[0] = t.x; b.translate[1] = t.y; b.translate[2] = t.z;
        b.scale[0] = s.x;     b.scale[1] = s.y;     b.scale[2] = s.z;
        b.quaternion[0] = q.x; b.quaternion[1] = q.y; b.quaternion[2] = q.z; b.quaternion[3] = q.w;
        // inv_bind は aiBone 側で記録されるが、ここでは default (identity + node 位置)
        // aiBone::mOffsetMatrix を後段で fill_inv_bind で上書きする
        ir.bones.push_back(b);
    }
}

void fill_inv_bind(const aiScene *scene,
                   const std::unordered_map<std::string, int> &boneNameToIR,
                   ModelIR &ir)
{
    // 各 aiMesh の各 aiBone で mOffsetMatrix (model→bone local) を採取
    for (std::uint32_t mi = 0; mi < scene->mNumMeshes; ++mi) {
        const aiMesh *m = scene->mMeshes[mi];
        for (std::uint32_t b = 0; b < m->mNumBones; ++b) {
            const aiBone *bone = m->mBones[b];
            std::string bn(bone->mName.C_Str(), bone->mName.length);
            auto it = boneNameToIR.find(bn);
            if (it == boneNameToIR.end()) continue;
            auto &dst = ir.bones[it->second];
            const aiMatrix4x4 &M = bone->mOffsetMatrix;
            // MATRIX_4X4CT_F は行優先 4x3。assimp は列優先 4x4 なので転置して取り出し
            // m[row][col] の aiMatrix は行優先なので a1..d4 で row-major:
            //  a1 a2 a3 a4    = row 0 (usually rotation row 0)
            //  b1 b2 b3 b4    = row 1
            //  c1 c2 c3 c4    = row 2
            //  d1 d2 d3 d4    = row 3 (0 0 0 1)
            // MATRIX_4X4CT_F: m[0..2][0..2] = rotation/scale、m[3][0..2] = translate
            // → 転置して m[col][row] に詰める
            dst.inv_bind[0][0] = M.a1; dst.inv_bind[0][1] = M.b1; dst.inv_bind[0][2] = M.c1;
            dst.inv_bind[1][0] = M.a2; dst.inv_bind[1][1] = M.b2; dst.inv_bind[1][2] = M.c2;
            dst.inv_bind[2][0] = M.a3; dst.inv_bind[2][1] = M.b3; dst.inv_bind[2][2] = M.c3;
            dst.inv_bind[3][0] = M.a4; dst.inv_bind[3][1] = M.b4; dst.inv_bind[3][2] = M.c4;
        }
    }
}

}

LoadResult load_via_assimp(const std::string &path) {
    LoadResult r;

    Assimp::Importer imp;
    const unsigned flags =
        aiProcess_Triangulate |
        aiProcess_JoinIdenticalVertices |
        aiProcess_GenSmoothNormals |
        aiProcess_ImproveCacheLocality |
        aiProcess_FlipUVs |      // MV1/DxLib は V 軸上原点 = glTF の下原点と対称
        aiProcess_SortByPType;

    const aiScene *scene = imp.ReadFile(path, flags);
    if (!scene || !scene->mRootNode) {
        std::string err = imp.GetErrorString();
        r.error = "assimp: " + err;
        // 追加ヒント (assimp の典型エラー判別)
        if (err.find("FBX-DOM unsupported") != std::string::npos
            || err.find("old format version") != std::string::npos) {
            r.error += "\n  HINT: この FBX は 2010 以前の古い形式。assimp は FBX 2011+ のみ対応。"
                       "\n        Autodesk FBX Converter 2013 等で新形式に再保存するか、"
                       "\n        Blender で .glb / .dae / .obj 等へエクスポートしてください。";
        } else if (err.find("FBX-Tokenize") != std::string::npos) {
            r.error += "\n  HINT: FBX ファイルの破損または assimp tokenizer の未対応 edge case。"
                       "\n        別ツール (Blender 等) で読めるなら再エクスポートを試してください。";
        } else if (err.find("No root node") != std::string::npos
                   || err.find("Unable to open") != std::string::npos) {
            r.error += "\n  HINT: ファイル形式が unrecognized かバイナリ構造が壊れている可能性。"
                       "\n        テキスト/バイナリの区別、拡張子の誤り等を確認してください。";
        }
        return r;
    }

    // Materials
    for (std::uint32_t i = 0; i < scene->mNumMaterials; ++i) {
        auto m = convert_material(scene->mMaterials[i], r.ir.textures);
        r.ir.materials.push_back(m);
    }
    if (r.ir.materials.empty()) {
        MaterialIR m; m.name = "default";
        r.ir.materials.push_back(m);
    }

    // ノード階層を BoneIR として収集
    std::vector<NodeRec> nodes;
    std::unordered_map<std::string, int> nameToIR;
    collect_nodes(scene->mRootNode, -1, nodes, nameToIR);
    fill_bones_from_nodes(nodes, r.ir);
    fill_inv_bind(scene, nameToIR, r.ir);

    // Meshes (scene 全体の meshes[] を flat に展開)
    for (std::uint32_t i = 0; i < scene->mNumMeshes; ++i) {
        MeshIR mesh;
        convert_mesh(scene->mMeshes[i], mesh, nameToIR);
        if (mesh.positions.empty() || mesh.indices.empty()) continue;
        r.ir.meshes.push_back(std::move(mesh));
    }

    // スキンが 1 つも無ければ bones をクリアして静的扱い (無意味な階層を出さない)
    bool anySkin = false;
    for (const auto &m : r.ir.meshes) if (!m.bone_weights.empty()) { anySkin = true; break; }
    if (!anySkin) r.ir.bones.clear();

    if (r.ir.meshes.empty()) {
        r.error = "assimp: no usable mesh in scene";
        return r;
    }
    return r;
}

}
