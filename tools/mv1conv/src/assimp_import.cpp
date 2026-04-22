#include "assimp_import.hpp"
#include <assimp/Importer.hpp>
#include <assimp/scene.h>
#include <assimp/postprocess.h>
#include <cstring>
#include <string>

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

void convert_mesh(const aiMesh *m, MeshIR &out) {
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
        r.error = std::string("assimp: ") + imp.GetErrorString();
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

    // Meshes (scene 全体の meshes[] を flat に展開。node hierarchy は無視)
    for (std::uint32_t i = 0; i < scene->mNumMeshes; ++i) {
        MeshIR mesh;
        convert_mesh(scene->mMeshes[i], mesh);
        if (mesh.positions.empty() || mesh.indices.empty()) continue;
        r.ir.meshes.push_back(std::move(mesh));
    }

    if (r.ir.meshes.empty()) {
        r.error = "assimp: no usable mesh in scene";
        return r;
    }
    return r;
}

}
