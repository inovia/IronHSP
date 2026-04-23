#include "assimp_export.hpp"
#include <assimp/Exporter.hpp>
#include <assimp/scene.h>
#include <assimp/mesh.h>
#include <cstring>
#include <memory>

namespace mv1conv {

namespace {

// IR → aiScene: 静的 + マテリアル + テクスチャのみ (bones/anim は未対応)。
// assimp Exporter は FBX / GLTF / Collada に書き出せるが、ボーン + アニメの移植は複雑。
// まず geometry + material + texture の書き出しを確立。
std::unique_ptr<aiScene> build_scene(const ModelIR &ir) {
    auto scene = std::make_unique<aiScene>();
    scene->mFlags = AI_SCENE_FLAGS_ALLOW_SHARED;

    // Root node
    scene->mRootNode = new aiNode();
    scene->mRootNode->mName = "root";

    // Meshes
    scene->mNumMeshes = static_cast<unsigned>(ir.meshes.size());
    scene->mMeshes = new aiMesh*[scene->mNumMeshes];
    std::vector<unsigned> meshIdxArr(scene->mNumMeshes);
    for (unsigned mi = 0; mi < scene->mNumMeshes; ++mi) {
        const auto &src = ir.meshes[mi];
        auto *m = new aiMesh();
        m->mName = src.name.empty() ? ("mesh" + std::to_string(mi)).c_str() : src.name.c_str();
        m->mMaterialIndex = src.material >= 0 ? static_cast<unsigned>(src.material) : 0u;
        unsigned vn = static_cast<unsigned>(src.positions.size() / 3);
        m->mNumVertices = vn;
        m->mVertices = new aiVector3D[vn];
        for (unsigned i = 0; i < vn; ++i) {
            m->mVertices[i] = { src.positions[i*3+0], src.positions[i*3+1], src.positions[i*3+2] };
        }
        if (!src.normals.empty() && src.normals.size() >= vn * 3) {
            m->mNormals = new aiVector3D[vn];
            for (unsigned i = 0; i < vn; ++i) {
                m->mNormals[i] = { src.normals[i*3+0], src.normals[i*3+1], src.normals[i*3+2] };
            }
        }
        if (!src.uvs.empty() && src.uvs.size() >= vn * 2) {
            m->mNumUVComponents[0] = 2;
            m->mTextureCoords[0] = new aiVector3D[vn];
            for (unsigned i = 0; i < vn; ++i) {
                m->mTextureCoords[0][i] = { src.uvs[i*2+0], src.uvs[i*2+1], 0.0f };
            }
        }
        unsigned fn = static_cast<unsigned>(src.indices.size() / 3);
        m->mNumFaces = fn;
        m->mFaces = new aiFace[fn];
        for (unsigned i = 0; i < fn; ++i) {
            m->mFaces[i].mNumIndices = 3;
            m->mFaces[i].mIndices = new unsigned[3];
            m->mFaces[i].mIndices[0] = src.indices[i*3+0];
            m->mFaces[i].mIndices[1] = src.indices[i*3+1];
            m->mFaces[i].mIndices[2] = src.indices[i*3+2];
        }
        m->mPrimitiveTypes = aiPrimitiveType_TRIANGLE;
        scene->mMeshes[mi] = m;
        meshIdxArr[mi] = mi;
    }
    // Node の mMeshes を root に紐付け
    scene->mRootNode->mNumMeshes = scene->mNumMeshes;
    scene->mRootNode->mMeshes = new unsigned[scene->mNumMeshes];
    for (unsigned i = 0; i < scene->mNumMeshes; ++i)
        scene->mRootNode->mMeshes[i] = meshIdxArr[i];

    // Materials
    unsigned matN = std::max<unsigned>(1u, static_cast<unsigned>(ir.materials.size()));
    scene->mNumMaterials = matN;
    scene->mMaterials = new aiMaterial*[matN];
    for (unsigned i = 0; i < matN; ++i) {
        auto *mat = new aiMaterial();
        if (i < ir.materials.size()) {
            const auto &m = ir.materials[i];
            aiString name(m.name.empty() ? "material" : m.name.c_str());
            mat->AddProperty(&name, AI_MATKEY_NAME);
            aiColor3D d(m.diffuse[0], m.diffuse[1], m.diffuse[2]);
            mat->AddProperty(&d, 1, AI_MATKEY_COLOR_DIFFUSE);
            aiColor3D a(m.ambient[0], m.ambient[1], m.ambient[2]);
            mat->AddProperty(&a, 1, AI_MATKEY_COLOR_AMBIENT);
            aiColor3D s(m.specular[0], m.specular[1], m.specular[2]);
            mat->AddProperty(&s, 1, AI_MATKEY_COLOR_SPECULAR);
            aiColor3D e(m.emissive[0], m.emissive[1], m.emissive[2]);
            mat->AddProperty(&e, 1, AI_MATKEY_COLOR_EMISSIVE);
            mat->AddProperty(&m.power, 1, AI_MATKEY_SHININESS);
            float op = 1.0f - m.alpha;
            mat->AddProperty(&op, 1, AI_MATKEY_OPACITY);
            if (m.diffuse_texture >= 0 && m.diffuse_texture < static_cast<int>(ir.textures.size())) {
                aiString path(ir.textures[m.diffuse_texture].color_path.c_str());
                mat->AddProperty(&path, AI_MATKEY_TEXTURE_DIFFUSE(0));
            }
        }
        scene->mMaterials[i] = mat;
    }

    return scene;
}

}  // anon

std::string export_via_assimp(const ModelIR &ir, const std::string &path,
                              const std::string &fmt_hint) {
    // assimp の Export 書式 ID 決定
    std::string fmt = fmt_hint;
    if (fmt.empty()) {
        auto pos = path.find_last_of('.');
        std::string ext = (pos == std::string::npos) ? "" : path.substr(pos + 1);
        for (auto &c : ext) c = static_cast<char>(std::tolower(c));
        if (ext == "obj") fmt = "obj";
        else if (ext == "gltf") fmt = "gltf2";
        else if (ext == "glb")  fmt = "glb2";
        else if (ext == "dae")  fmt = "collada";
        else if (ext == "ply")  fmt = "ply";
        else if (ext == "stl")  fmt = "stl";
        else if (ext == "fbx")  fmt = "fbx";
        else return "unknown output extension: " + ext;
    }

    auto scene = build_scene(ir);
    Assimp::Exporter exp;
    aiReturn rc = exp.Export(scene.get(), fmt, path);
    if (rc != AI_SUCCESS) {
        return std::string("assimp export failed (fmt=") + fmt + "): " + exp.GetErrorString();
    }
    return {};
}

}
