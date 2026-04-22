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

struct MeshIR {
    std::string name;
    std::vector<float> positions;     // 3n
    std::vector<float> normals;       // 3n (optional、空なら MV1_FRAME_NORMAL_TYPE_NONE)
    std::vector<float> uvs;           // 2n (optional)
    std::vector<std::uint32_t> indices;  // triangle list、3 倍数
    int material = 0;                 // MaterialIR index
};

struct ModelIR {
    std::vector<MeshIR>     meshes;
    std::vector<MaterialIR> materials;
    std::vector<TextureIR>  textures;
    bool right_hand = false;  // RightHandType (TRUE=右手系、false=左手系)
};

}
