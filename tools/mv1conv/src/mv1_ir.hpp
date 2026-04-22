#pragma once
// MV1 中間表現 (Intermediate Representation)。
// 入力 (OBJ / assimp scene / ...) と出力 (.mv1 writer) の分離点。
// 初版は静的メッシュのみ対応 (スキン/アニメ/シェイプは未対応)。
#include <array>
#include <cstdint>
#include <string>
#include <vector>

namespace mv1conv {

struct TextureIR {
    std::string name;
    std::string color_path;  // 相対パス、空なら null
};

struct MaterialIR {
    std::string name;
    std::array<float, 4> diffuse  {0.8f, 0.8f, 0.8f, 1.0f};
    std::array<float, 4> ambient  {0.2f, 0.2f, 0.2f, 1.0f};
    std::array<float, 4> specular {0.0f, 0.0f, 0.0f, 1.0f};
    std::array<float, 4> emissive {0.0f, 0.0f, 0.0f, 0.0f};
    float power = 20.0f;
    float alpha = 0.0f;
    int diffuse_texture = -1;  // TextureIR index、なければ -1
};

// ボーン階層 (skin mesh 用)。Frame と兼用: 全 bone = 全 MV1 Frame として書き出す。
struct BoneIR {
    std::string name;
    int parent = -1;          // BoneIR index、root なら -1
    float translate[3] = {0, 0, 0};
    float quaternion[4] = {0, 0, 0, 1};  // (x, y, z, w)、恒等
    float scale[3] = {1, 1, 1};
    // 逆バインドポーズ (モデル空間 → ボーンローカル)、MATRIX_4X4CT_F 形式の 4x3
    // m[0..2] 回転+スケール 3 行、m[3] 並進
    float inv_bind[4][3] = {
        {1, 0, 0},
        {0, 1, 0},
        {0, 0, 1},
        {0, 0, 0}
    };
};

// 1 頂点につき最大 4 ボーン影響。未使用スロットは bone=-1。
struct VertexBone {
    std::int32_t bone[4] = {-1, -1, -1, -1};
    float        weight[4] = {0, 0, 0, 0};
};

struct MeshIR {
    std::string name;
    std::vector<float> positions;     // 3n
    std::vector<float> normals;       // 3n (optional、空なら MV1_FRAME_NORMAL_TYPE_NONE)
    std::vector<float> uvs;           // 2n (optional)
    std::vector<std::uint32_t> indices;  // triangle list、3 倍数
    int material = 0;                 // MaterialIR index
    std::vector<VertexBone> bone_weights; // 空 = 静的メッシュ、非空なら size == positions.size()/3
};

struct ModelIR {
    std::vector<MeshIR>     meshes;
    std::vector<MaterialIR> materials;
    std::vector<TextureIR>  textures;
    std::vector<BoneIR>     bones;        // 空 = 静的。非空なら skinned として writer 処理
    bool right_hand = false;  // RightHandType (TRUE=右手系、false=左手系)
};

}
