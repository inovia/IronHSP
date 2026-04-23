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
    int diffuse_texture  = -1;  // TextureIR index、なければ -1
    int specular_texture = -1;
    int normal_texture   = -1;
    int emissive_texture = -1;

    // Toon (MV1_MATERIAL_TOON_F1)。is_toon=true なら writer が ToonInfo を出力。
    bool is_toon = false;
    int toon_diffuse_grad_texture  = -1;  // トゥーン陰影グラデーション (主)
    int toon_specular_grad_texture = -1;
    int toon_sphere_map_texture    = -1;
    std::uint8_t toon_enable_sphere_map   = 0;
    std::uint8_t toon_sphere_map_blend    = 0;  // 0=NORMAL,1=ADD,2=SUB...(DxLib BLENDTYPE)
    int toon_diffuse_grad_blend    = 0;
    int toon_specular_grad_blend   = 0;
    float toon_outline_width = 0.0f;
    float toon_outline_dot_width = 0.0f;
    std::array<float, 4> toon_outline_color {0.0f, 0.0f, 0.0f, 1.0f};
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

// ================================================================
// アニメーション関係
// ================================================================

// 1 つの AnimKeySet = 「1 bone の translate/rotate/scale 何れか」の時系列。
// MV1 の AnimKeySet は全局共通の配列に積まれ、Anim が KeySet 連続区間を参照する。
struct AnimKeySetIR {
    enum DataType : std::int8_t {
        DT_ROTATE    = 0,   // 回転 (quaternion または 3-vec)
        DT_SCALE     = 5,   // スケール (3-vec)
        DT_TRANSLATE = 10,  // 並進 (3-vec)
        DT_SHAPE     = 15,  // シェイプ (表情) weight
    };
    enum KeyType : std::int8_t {
        KT_QUATERNION_X = 0,  // FLOAT4 per key
        KT_VECTOR       = 1,  // VECTOR (3f) per key
        KT_LINEAR       = 5,  // float per key
    };
    std::int8_t data_type;
    std::int8_t key_type;
    // DataType == DT_SHAPE 時、KeyData 先頭に WORD TargetShapeIndex を書く。
    std::int32_t target_shape_index = -1;
    std::vector<float> key_times;   // N 個 (seconds)
    // key values: key_type に応じて N*1 / N*3 / N*4 の float 配列
    std::vector<float> key_values;

    // ----- round-trip 用 raw blob (readers が decode 不能な flag/compression を
    //       そのままパススルーするためのエスケープ) -----
    // raw_blob が非空の場合 writer はこの blob を Flag と共にそのまま出力し、
    // key_times / key_values は無視する。
    std::uint16_t raw_flag = 0;
    std::vector<std::uint8_t> raw_blob;
    std::uint32_t raw_runtime_size = 0;  // DxLib runtime 側の割当バイト数
};

// 1 Anim = 1 bone 1 AnimSet の「同じ frame を対象とする AnimKeySet 群」。
// FBX では通常 translate + rotate + scale の 3 track が同じ TargetFrame に対して載る。
struct AnimIR {
    std::int32_t target_frame_index;   // BoneIR の index (= writer 側 Frame index と対応)
    float max_time;
    std::vector<std::size_t> keyset_indices;  // ModelIR::anim_keysets[] の index 群
};

// AnimSet = 「1 つの動作」 (歩行 / ジャンプ等)。複数の Anim をまとめる。
struct AnimSetIR {
    std::string name;
    float max_time;           // セット内で最も長い Anim の MaxTime
    std::uint32_t flag = 0;   // bit0:add bit1:matrix-linear-blend bit2:loop
    std::vector<std::size_t> anim_indices;  // ModelIR::anims[] の index 群
};

// ================================================================
// シェイプ (モーフ、表情) 関係
// ================================================================

// 1 頂点分の shape 差分
struct ShapeVertexIR {
    std::uint32_t target_mesh_vertex;  // MeshIR.indices[] 内 unique pos の index
    float dp[3];  // Position delta
    float dn[3];  // Normal delta (未使用なら 0)
};

// 1 mesh に対する shape 差分
struct ShapeMeshIR {
    std::uint32_t target_mesh;  // MeshIR index
    std::vector<ShapeVertexIR> vertices;
};

// 1 shape = 複数 mesh の差分セット (「笑顔」「怒」等 1 モーフ相当)
struct ShapeIR {
    std::string name;
    std::uint32_t container_bone = 0;  // 所属 bone の BoneIR index (non-skin なら 0 = root 的扱い)
    std::vector<ShapeMeshIR> meshes;
};

struct ModelIR {
    std::vector<MeshIR>     meshes;
    std::vector<MaterialIR> materials;
    std::vector<TextureIR>  textures;
    std::vector<BoneIR>     bones;        // 空 = 静的。非空なら skinned として writer 処理
    bool right_hand = false;  // RightHandType (TRUE=右手系、false=左手系)

    // Shapes (blend shapes / morph targets)
    std::vector<ShapeIR> shapes;

    // Physics (PMX 物理演算)
    struct PhysicsRigidBodyIR {
        std::string name;
        int target_bone = -1;   // BoneIR index、なければ -1
        int group_index = 0;
        std::uint32_t group_target = 0xFFFF;
        int shape_type = 1;  // 0:sphere 1:box 2:capsule
        float shape_w = 0, shape_h = 0, shape_d = 0;
        float position[3] = {0, 0, 0};
        float rotation[3] = {0, 0, 0};
        float weight = 1.0f;
        float pos_dim = 0.0f;
        float rot_dim = 0.0f;
        float recoil = 0.0f;
        float friction = 0.5f;
        int body_type = 0;  // 0:Bone追従 1:物理 2:物理(Bone位置合わせ)
    };
    struct PhysicsJointIR {
        std::string name;
        int rigid_a = -1;
        int rigid_b = -1;
        float position[3] = {0, 0, 0};
        float rotation[3] = {0, 0, 0};
        float constrain_pos_1[3] = {0, 0, 0};
        float constrain_pos_2[3] = {0, 0, 0};
        float constrain_rot_1[3] = {0, 0, 0};
        float constrain_rot_2[3] = {0, 0, 0};
        float spring_pos[3] = {0, 0, 0};
        float spring_rot[3] = {0, 0, 0};
    };
    float physics_gravity = -9.8f;
    std::vector<PhysicsRigidBodyIR> physics_rigid_bodies;
    std::vector<PhysicsJointIR>     physics_joints;

    // Animations (空なら writer は anim セクション省略、スキン無しでも可)
    std::vector<AnimKeySetIR> anim_keysets;
    std::vector<AnimIR>       anims;
    std::vector<AnimSetIR>    anim_sets;
    // MV1 → IR 経路では、元ファイルの OriginalAnimKeyDataSize をそのまま次の出力に
    // 流用するため保持 (0 なら writer が再計算)。
    std::uint32_t anim_original_keydata_size = 0;
};

}
