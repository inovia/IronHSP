#include "assimp_export.hpp"
#include <assimp/Exporter.hpp>
#include <assimp/scene.h>
#include <assimp/mesh.h>
#include <assimp/anim.h>
#include <algorithm>
#include <cstring>
#include <memory>
#include <string>
#include <unordered_map>
#include <vector>

namespace mv1conv {

namespace {

// VECTOR * MATRIX (DxLib の 4x3 inv_bind → 4x4 に拡張して aiMatrix4x4 で表現)
aiMatrix4x4 mat_from_invbind(const float m[4][3]) {
    // MV1 の MATRIX_4X4CT_F は 4 行 × 3 列 (回転行列 3x3 + 並進 row 4)
    // assimp の aiMatrix4x4 は row-major 4x4。
    aiMatrix4x4 r;
    r.a1 = m[0][0]; r.b1 = m[0][1]; r.c1 = m[0][2]; r.d1 = 0;
    r.a2 = m[1][0]; r.b2 = m[1][1]; r.c2 = m[1][2]; r.d2 = 0;
    r.a3 = m[2][0]; r.b3 = m[2][1]; r.c3 = m[2][2]; r.d3 = 0;
    r.a4 = m[3][0]; r.b4 = m[3][1]; r.c4 = m[3][2]; r.d4 = 1;
    return r;
}

// 1 つの bone に対する aiNode を作成 (再帰)。parent chain を辿って hierarchy を構築。
aiNode *build_bone_node(const ModelIR &ir, int boneIdx,
                       std::vector<aiNode *> &boneNodes)
{
    const auto &b = ir.bones[boneIdx];
    auto *n = new aiNode();
    n->mName = b.name.empty() ? ("bone" + std::to_string(boneIdx)) : b.name;

    // transform: 親相対の translate + quaternion + scale
    aiVector3D t(b.translate[0], b.translate[1], b.translate[2]);
    aiQuaternion q(b.quaternion[3], b.quaternion[0], b.quaternion[1], b.quaternion[2]);
    aiVector3D s(b.scale[0], b.scale[1], b.scale[2]);
    aiMatrix4x4 tf;
    aiMatrix4x4::Translation(t, tf);
    aiMatrix4x4 rot(q.GetMatrix());
    aiMatrix4x4 scl;
    aiMatrix4x4::Scaling(s, scl);
    n->mTransformation = tf * rot * scl;

    boneNodes[boneIdx] = n;
    return n;
}

// 全 bone の aiNode を作って parent 階層をリンク。返すのは最上位 bone のリスト (parent=-1)。
std::vector<aiNode *> build_all_bone_nodes(const ModelIR &ir,
                                           std::vector<aiNode *> &boneNodes)
{
    boneNodes.assign(ir.bones.size(), nullptr);
    std::vector<aiNode *> topBones;
    // まず全 node 作成
    for (std::size_t i = 0; i < ir.bones.size(); ++i) {
        (void)build_bone_node(ir, static_cast<int>(i), boneNodes);
    }
    // 親子リンク
    std::vector<std::vector<int>> children(ir.bones.size());
    for (std::size_t i = 0; i < ir.bones.size(); ++i) {
        int p = ir.bones[i].parent;
        if (p >= 0 && p < static_cast<int>(ir.bones.size())) {
            children[p].push_back(static_cast<int>(i));
        } else {
            topBones.push_back(boneNodes[i]);
        }
    }
    for (std::size_t i = 0; i < ir.bones.size(); ++i) {
        auto &cv = children[i];
        auto *n = boneNodes[i];
        if (cv.empty()) continue;
        n->mNumChildren = static_cast<unsigned>(cv.size());
        n->mChildren = new aiNode*[n->mNumChildren];
        for (std::size_t k = 0; k < cv.size(); ++k) {
            n->mChildren[k] = boneNodes[cv[k]];
            n->mChildren[k]->mParent = n;
        }
    }
    return topBones;
}

// Mesh → aiMesh 変換 + bone weights + blend shapes
aiMesh *build_mesh(const ModelIR &ir, std::size_t mi,
                   const std::vector<aiNode *> &boneNodes)
{
    const auto &src = ir.meshes[mi];
    auto *m = new aiMesh();
    m->mName = src.name.empty() ? aiString(("mesh" + std::to_string(mi)).c_str()) : aiString(src.name);
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

    // Skin bones: bone_weights[] = per-unique-vertex {bone[4], weight[4]}
    if (!src.bone_weights.empty() && !ir.bones.empty()) {
        // bone -> vertex weights マップ
        std::vector<std::vector<aiVertexWeight>> bwList(ir.bones.size());
        for (unsigned i = 0; i < vn && i < src.bone_weights.size(); ++i) {
            const auto &vb = src.bone_weights[i];
            for (int s = 0; s < 4; ++s) {
                if (vb.bone[s] < 0 || vb.bone[s] >= static_cast<int>(ir.bones.size())) continue;
                if (vb.weight[s] <= 0.0f) continue;
                bwList[vb.bone[s]].push_back({i, vb.weight[s]});
            }
        }
        // 非ゼロ bone を aiBone として追加
        std::vector<aiBone *> activeBones;
        for (std::size_t bi = 0; bi < ir.bones.size(); ++bi) {
            if (bwList[bi].empty()) continue;
            auto *ab = new aiBone();
            ab->mName = boneNodes[bi]->mName;
            ab->mNumWeights = static_cast<unsigned>(bwList[bi].size());
            ab->mWeights = new aiVertexWeight[ab->mNumWeights];
            for (unsigned k = 0; k < ab->mNumWeights; ++k) ab->mWeights[k] = bwList[bi][k];
            ab->mOffsetMatrix = mat_from_invbind(ir.bones[bi].inv_bind);
            activeBones.push_back(ab);
        }
        if (!activeBones.empty()) {
            m->mNumBones = static_cast<unsigned>(activeBones.size());
            m->mBones = new aiBone*[m->mNumBones];
            for (unsigned k = 0; k < m->mNumBones; ++k) m->mBones[k] = activeBones[k];
        }
    }

    // Blend shapes (mAnimMeshes)
    // ir.shapes[].meshes[].target_mesh == mi の vertices を適用
    std::vector<std::pair<const ShapeIR*, const ShapeMeshIR*>> shapesForMesh;
    for (const auto &sh : ir.shapes) {
        for (const auto &sm : sh.meshes) {
            if (sm.target_mesh == mi) shapesForMesh.emplace_back(&sh, &sm);
        }
    }
    if (!shapesForMesh.empty()) {
        m->mNumAnimMeshes = static_cast<unsigned>(shapesForMesh.size());
        m->mAnimMeshes = new aiAnimMesh*[m->mNumAnimMeshes];
        for (unsigned s = 0; s < shapesForMesh.size(); ++s) {
            auto *am = new aiAnimMesh();
            am->mName = aiString(shapesForMesh[s].first->name);
            am->mNumVertices = vn;
            // vertices: base + delta (absolute)
            am->mVertices = new aiVector3D[vn];
            std::memcpy(am->mVertices, m->mVertices, sizeof(aiVector3D) * vn);
            if (m->mNormals) {
                am->mNormals = new aiVector3D[vn];
                std::memcpy(am->mNormals, m->mNormals, sizeof(aiVector3D) * vn);
            }
            for (const auto &sv : shapesForMesh[s].second->vertices) {
                if (sv.target_mesh_vertex >= vn) continue;
                am->mVertices[sv.target_mesh_vertex].x += sv.dp[0];
                am->mVertices[sv.target_mesh_vertex].y += sv.dp[1];
                am->mVertices[sv.target_mesh_vertex].z += sv.dp[2];
                if (am->mNormals) {
                    am->mNormals[sv.target_mesh_vertex].x += sv.dn[0];
                    am->mNormals[sv.target_mesh_vertex].y += sv.dn[1];
                    am->mNormals[sv.target_mesh_vertex].z += sv.dn[2];
                }
            }
            am->mWeight = 0.0f;  // default animation weight
            m->mAnimMeshes[s] = am;
        }
    }

    return m;
}

// Animations: ir.anim_sets / anims / anim_keysets → aiAnimation[]
// 簡易: 各 AnimSet を 1 aiAnimation、各 Anim を 1 aiNodeAnim (node=bone name)。
// 同じ bone に TRANSLATE + ROTATE + SCALE 3 keyset を mNumPositionKeys /
// mNumRotationKeys / mNumScalingKeys に分配。
// MORPH anim (SHAPE datatype) は aiMeshMorphAnim で出すが glTF/FBX 出力は
// ファイル形式次第。今回は bone anim のみ。
std::vector<aiAnimation *> build_animations(const ModelIR &ir,
                                            const std::vector<aiNode *> &boneNodes)
{
    std::vector<aiAnimation *> out;
    if (ir.anim_sets.empty() || ir.anims.empty() || ir.anim_keysets.empty()) return out;

    auto get_keyset = [&](std::size_t idx) -> const AnimKeySetIR * {
        return (idx < ir.anim_keysets.size()) ? &ir.anim_keysets[idx] : nullptr;
    };

    for (const auto &aset : ir.anim_sets) {
        auto *anim = new aiAnimation();
        anim->mName = aiString(aset.name);
        anim->mDuration = aset.max_time;
        anim->mTicksPerSecond = 1.0;

        // per-bone: keyset を TRANSLATE / ROTATE / SCALE に分類
        struct BoneAnim {
            std::vector<std::pair<float, aiVector3D>> pos;
            std::vector<std::pair<float, aiQuaternion>> rot;
            std::vector<std::pair<float, aiVector3D>> scl;
        };
        std::unordered_map<int, BoneAnim> byBone;

        for (std::size_t ai : aset.anim_indices) {
            if (ai >= ir.anims.size()) continue;
            const auto &an = ir.anims[ai];
            int tfi = an.target_frame_index;  // writer 側: 1 + meshes + bone_idx
            // bone index を逆算: boneNodes と対応する bone 0..N-1
            // target_frame_index が non-skin 時は mesh frame 自身、skin 時は bone frame
            // 単純化: mesh_count は ir.meshes.size()、skin 時は bone_idx = tfi - (1+meshes)
            int boneIdx = -1;
            if (!ir.bones.empty()) {
                int expected = 1 + static_cast<int>(ir.meshes.size());
                if (tfi >= expected && tfi - expected < static_cast<int>(ir.bones.size())) {
                    boneIdx = tfi - expected;
                }
            }
            if (boneIdx < 0) continue;
            auto &ba = byBone[boneIdx];
            for (std::size_t ksi : an.keyset_indices) {
                const auto *ks = get_keyset(ksi);
                if (!ks) continue;
                // raw_blob でしか持っていない場合は decode 不能 → skip
                if (!ks->raw_blob.empty()) continue;
                std::size_t n = ks->key_times.size();
                switch (ks->data_type) {
                case AnimKeySetIR::DT_TRANSLATE:
                    if (ks->key_type == AnimKeySetIR::KT_VECTOR && ks->key_values.size() >= n*3) {
                        for (std::size_t k = 0; k < n; ++k) {
                            ba.pos.emplace_back(ks->key_times[k],
                                aiVector3D(ks->key_values[k*3], ks->key_values[k*3+1], ks->key_values[k*3+2]));
                        }
                    }
                    break;
                case AnimKeySetIR::DT_SCALE:
                    if (ks->key_type == AnimKeySetIR::KT_VECTOR && ks->key_values.size() >= n*3) {
                        for (std::size_t k = 0; k < n; ++k) {
                            ba.scl.emplace_back(ks->key_times[k],
                                aiVector3D(ks->key_values[k*3], ks->key_values[k*3+1], ks->key_values[k*3+2]));
                        }
                    }
                    break;
                case AnimKeySetIR::DT_ROTATE:
                    if (ks->key_type == AnimKeySetIR::KT_QUATERNION_X && ks->key_values.size() >= n*4) {
                        for (std::size_t k = 0; k < n; ++k) {
                            // {x,y,z,w} → assimp {w,x,y,z}
                            ba.rot.emplace_back(ks->key_times[k],
                                aiQuaternion(ks->key_values[k*4+3],
                                             ks->key_values[k*4+0],
                                             ks->key_values[k*4+1],
                                             ks->key_values[k*4+2]));
                        }
                    }
                    break;
                }
            }
        }

        // 0 channel anim は exporter (特に gltf) を crash させるので skip
        if (byBone.empty()) {
            delete anim;
            continue;
        }
        // byBone → aiNodeAnim[]
        anim->mNumChannels = static_cast<unsigned>(byBone.size());
        if (anim->mNumChannels > 0) {
            anim->mChannels = new aiNodeAnim*[anim->mNumChannels];
            unsigned ci = 0;
            for (auto &[bi, ba] : byBone) {
                auto *ch = new aiNodeAnim();
                if (bi < static_cast<int>(boneNodes.size()) && boneNodes[bi]) {
                    ch->mNodeName = boneNodes[bi]->mName;
                }
                std::sort(ba.pos.begin(), ba.pos.end(), [](auto &a, auto &b){ return a.first < b.first; });
                std::sort(ba.rot.begin(), ba.rot.end(), [](auto &a, auto &b){ return a.first < b.first; });
                std::sort(ba.scl.begin(), ba.scl.end(), [](auto &a, auto &b){ return a.first < b.first; });
                ch->mNumPositionKeys = static_cast<unsigned>(ba.pos.size());
                if (ch->mNumPositionKeys) {
                    ch->mPositionKeys = new aiVectorKey[ch->mNumPositionKeys];
                    for (unsigned k = 0; k < ch->mNumPositionKeys; ++k)
                        ch->mPositionKeys[k] = { ba.pos[k].first, ba.pos[k].second };
                }
                ch->mNumRotationKeys = static_cast<unsigned>(ba.rot.size());
                if (ch->mNumRotationKeys) {
                    ch->mRotationKeys = new aiQuatKey[ch->mNumRotationKeys];
                    for (unsigned k = 0; k < ch->mNumRotationKeys; ++k)
                        ch->mRotationKeys[k] = { ba.rot[k].first, ba.rot[k].second };
                }
                ch->mNumScalingKeys = static_cast<unsigned>(ba.scl.size());
                if (ch->mNumScalingKeys) {
                    ch->mScalingKeys = new aiVectorKey[ch->mNumScalingKeys];
                    for (unsigned k = 0; k < ch->mNumScalingKeys; ++k)
                        ch->mScalingKeys[k] = { ba.scl[k].first, ba.scl[k].second };
                }
                anim->mChannels[ci++] = ch;
            }
        }

        out.push_back(anim);
    }
    return out;
}

std::unique_ptr<aiScene> build_scene(const ModelIR &ir) {
    auto scene = std::make_unique<aiScene>();
    scene->mFlags = AI_SCENE_FLAGS_ALLOW_SHARED;

    scene->mRootNode = new aiNode();
    scene->mRootNode->mName = "root";

    // Bones: 階層を aiNode ツリーとして構築
    std::vector<aiNode *> boneNodes;
    std::vector<aiNode *> topBones = build_all_bone_nodes(ir, boneNodes);

    // Mesh node (1つ): すべての mesh を保持
    auto *meshNode = new aiNode();
    meshNode->mName = "mesh_group";

    // Meshes
    scene->mNumMeshes = static_cast<unsigned>(ir.meshes.size());
    scene->mMeshes = new aiMesh*[scene->mNumMeshes];
    for (unsigned mi = 0; mi < scene->mNumMeshes; ++mi) {
        scene->mMeshes[mi] = build_mesh(ir, mi, boneNodes);
    }
    meshNode->mNumMeshes = scene->mNumMeshes;
    meshNode->mMeshes = new unsigned[scene->mNumMeshes];
    for (unsigned i = 0; i < scene->mNumMeshes; ++i) meshNode->mMeshes[i] = i;

    // Root children: mesh_group + top bones
    std::vector<aiNode *> rootChildren;
    rootChildren.push_back(meshNode);
    for (auto *tb : topBones) rootChildren.push_back(tb);
    scene->mRootNode->mNumChildren = static_cast<unsigned>(rootChildren.size());
    scene->mRootNode->mChildren = new aiNode*[rootChildren.size()];
    for (std::size_t i = 0; i < rootChildren.size(); ++i) {
        scene->mRootNode->mChildren[i] = rootChildren[i];
        rootChildren[i]->mParent = scene->mRootNode;
    }

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
            if (m.specular_texture >= 0 && m.specular_texture < static_cast<int>(ir.textures.size())) {
                aiString path(ir.textures[m.specular_texture].color_path.c_str());
                mat->AddProperty(&path, AI_MATKEY_TEXTURE_SPECULAR(0));
            }
            if (m.normal_texture >= 0 && m.normal_texture < static_cast<int>(ir.textures.size())) {
                aiString path(ir.textures[m.normal_texture].color_path.c_str());
                mat->AddProperty(&path, AI_MATKEY_TEXTURE_NORMALS(0));
            }
            if (m.emissive_texture >= 0 && m.emissive_texture < static_cast<int>(ir.textures.size())) {
                aiString path(ir.textures[m.emissive_texture].color_path.c_str());
                mat->AddProperty(&path, AI_MATKEY_TEXTURE_EMISSIVE(0));
            }
        }
        scene->mMaterials[i] = mat;
    }

    // Animations (MV1CONV_EXPORT_NO_ANIM=1 で無効化)
    if (!std::getenv("MV1CONV_EXPORT_NO_ANIM")) {
        auto anims = build_animations(ir, boneNodes);
        if (!anims.empty()) {
            scene->mNumAnimations = static_cast<unsigned>(anims.size());
            scene->mAnimations = new aiAnimation*[scene->mNumAnimations];
            for (unsigned i = 0; i < anims.size(); ++i) scene->mAnimations[i] = anims[i];
        }
    }

    return scene;
}

}  // anon

std::string export_via_assimp(const ModelIR &ir, const std::string &path,
                              const std::string &fmt_hint) {
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
