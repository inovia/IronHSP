#pragma once
// DxLib 3.24f .mv1 の *_F1 構造体定義 (DxModelFile.h 準拠)
// 直接シリアライズされているため #pragma pack(push, 4) で DxLib 側と align を合わせる
#include <cstdint>

namespace mv1conv::f1 {

using DWORD = std::uint32_t;
using BYTE  = std::uint8_t;
using WORD  = std::uint16_t;

struct VECTOR  { float x, y, z; };
struct FLOAT4  { float x, y, z, w; };
struct COLOR_F { float r, g, b, a; };
struct COLOR_U8{ BYTE b, g, r, a; };  // 注: BGRA バイト順

// MATRIX_4X4CT_F: 行優先 4x3 (4 行目暗黙 0,0,0,1、合計 48 byte)
struct MATRIX_4X4CT_F {
    float m[4][3];  // m[0..2] = 回転+スケール行、m[3] = 並進
};

#pragma pack(push, 4)

struct MV1_TEXTURE_F1 {
    DWORD DimPrev, DimNext;
    DWORD Name;
    std::int32_t Index;
    DWORD ColorFilePath;
    DWORD AlphaFilePath;
    std::int32_t BumpImageFlag;
    float BumpImageNextPixelLength;
    std::int32_t AddressModeU, AddressModeV, FilterMode;
    DWORD UserData[2];
    BYTE Flag;
    BYTE Padding1[3];
    float ScaleU, ScaleV;
    DWORD Padding[1];
};
static_assert(sizeof(MV1_TEXTURE_F1) == 68, "MV1_TEXTURE_F1 size should be 68 bytes");

struct MV1_MATERIAL_LAYER_F1 {
    std::int32_t Texture;
    std::int32_t BlendType;
    DWORD Padding[4];
};
static_assert(sizeof(MV1_MATERIAL_LAYER_F1) == 0x18, "MV1_MATERIAL_LAYER_F1 size should be 24 bytes");

struct MV1_MATERIAL_TOON_F1 {
    std::int32_t Type;
    std::int32_t DiffuseGradTexture, SpecularGradTexture;
    std::int32_t DiffuseGradBlendType, SpecularGradBlendType;
    float OutLineWidth;
    COLOR_F OutLineColor;
    float OutLineDotWidth;
    BYTE EnableSphereMap, SphereMapBlendType;
    std::int16_t SphereMapTexture;
    DWORD Padding[2];
};

struct MV1_MATERIAL_F1 {
    DWORD DimPrev, DimNext;
    DWORD Name;
    std::int32_t Index;
    COLOR_F Diffuse, Ambient, Specular, Emissive;
    float Power, Alpha;
    std::int32_t DiffuseLayerNum;
    MV1_MATERIAL_LAYER_F1 DiffuseLayer[8];
    std::int32_t SpecularLayerNum;
    MV1_MATERIAL_LAYER_F1 SpecularLayer[8];
    std::int32_t NormalLayerNum;
    MV1_MATERIAL_LAYER_F1 NormalLayer[8];
    std::int32_t UseAlphaTest, AlphaFunc, AlphaRef;
    std::int32_t DrawBlendMode, DrawBlendParam;
    DWORD UserData[4];
    DWORD ToonInfo;
    DWORD Padding[3];
};

struct MV1_LIGHT_F1 {
    DWORD DimPrev, DimNext;
    DWORD Name;
    std::int32_t Index;
    std::int32_t FrameIndex, Type;
    COLOR_F Diffuse, Specular, Ambient;
    float Range, Falloff;
    float Attenuation0, Attenuation1, Attenuation2;
    float Theta, Phi;
    DWORD UserData[2];
};

struct MV1_TRIANGLE_LIST_F1 {
    DWORD DimPrev, DimNext;
    std::int32_t Index;
    DWORD Container;
    WORD VertexType, Flag, VertexNum, IndexNum;
    DWORD MeshVertexIndexAndIndexData;
    DWORD Padding[2];
};
static_assert(sizeof(MV1_TRIANGLE_LIST_F1) == 0x24, "MV1_TRIANGLE_LIST_F1 size should be 36 bytes");

struct MV1_CHANGE_F1 {
    DWORD Target;
    DWORD Fill;
    DWORD CheckBit;
    DWORD Size;
};

struct MV1_SKIN_BONE_USE_FRAME_F1 {
    std::int32_t Index;
    std::int32_t MatrixIndex;
};

struct MV1_SKIN_BONE_F1 {
    DWORD DimPrev, DimNext;
    std::int32_t Index;
    std::int32_t BoneFrame;
    MATRIX_4X4CT_F ModelLocalMatrix;
    std::int32_t ModelLocalMatrixIsTranslateOnly;
    std::int32_t UseFrameNum;
    DWORD UseFrame;
    DWORD Padding[2];
};

struct MV1_MESH_F1 {
    DWORD DimPrev, DimNext;
    std::int32_t Index;
    DWORD Container;
    DWORD Material;
    MV1_CHANGE_F1 ChangeInfo;
    std::int32_t UseVertexDiffuseColor, UseVertexSpecularColor;
    BYTE NotOneDiffuseAlpha, Shape, Padding2[2];
    std::int32_t TriangleListNum;
    DWORD TriangleList;
    BYTE Visible, BackCulling, UVSetUnitNum, UVUnitNum;
    std::int32_t VertFlag;
    std::int32_t VertexNum, FaceNum;
    DWORD VertexData;
    DWORD UserData[4];
    DWORD Padding[4];
};

struct MV1_FRAME_F1 {
    DWORD DimPrev, DimNext;
    DWORD Name;
    std::int32_t Index;
    MV1_CHANGE_F1 ChangeDrawMaterialInfo;
    MV1_CHANGE_F1 ChangeMatrixInfo;
    std::int32_t TotalMeshNum, TotalChildNum;
    DWORD Parent, FirstChild, LastChild, Prev, Next;
    VECTOR Translate, Scale, Rotate;
    std::int32_t RotateOrder;
    FLOAT4 Quaternion;
    DWORD Flag;
    std::int32_t IsSkinMesh, TriangleNum, VertexNum, MeshNum;
    DWORD Mesh;
    std::int32_t SkinBoneNum;
    DWORD SkinBone;
    std::int32_t UseSkinBoneNum;
    DWORD UseSkinBone;
    DWORD Light;
    WORD VertFlag, MaxBoneBlendNum;
    float SmoothingAngle;
    std::int32_t AutoCreateNormal;
    std::int32_t PositionNum, NormalNum;
    DWORD PositionAndNormalData;
    DWORD UserData[4];
    DWORD FrameShape;
    VECTOR PreRotate, PostRotate;
    DWORD Padding[8];
};

struct MV1_ANIM_KEYSET_F1 {
    std::int8_t Type;
    std::int8_t DataType;
    WORD Flag;
    DWORD KeyData;
    DWORD UserData[1];
    DWORD Padding[2];
};
static_assert(sizeof(MV1_ANIM_KEYSET_F1) == 20, "MV1_ANIM_KEYSET_F1 size should be 20 bytes (matches header AnimKeySetUnitSize)");

struct MV1_ANIM_F1 {
    std::int32_t Index;
    DWORD Container;
    std::int32_t TargetFrameIndex;
    float MaxTime;
    std::int32_t RotateOrder;
    std::int32_t KeySetNum;
    DWORD KeySet;
    DWORD UserData[2];
    DWORD Padding[2];
};
static_assert(sizeof(MV1_ANIM_F1) == 44, "MV1_ANIM_F1 size should be 44 bytes (matches header AnimUnitSize)");

struct MV1_ANIMSET_F1 {
    DWORD DimPrev, DimNext;
    DWORD Name;
    std::int32_t Index;
    float MaxTime;
    std::int32_t AnimNum;
    DWORD Anim;
    DWORD UserData[4];
    DWORD Flag;
    DWORD Padding[3];
};

struct MV1_FRAME_SHAPE_F1 {
    std::int32_t ShapeNum;
    DWORD Shape;
};

struct MV1_SHAPE_VERTEX_F1 {
    std::int32_t TargetMeshVertex;
    VECTOR       Position;
    VECTOR       Normal;
};
static_assert(sizeof(MV1_SHAPE_VERTEX_F1) == 28, "MV1_SHAPE_VERTEX_F1 = 28 bytes");

struct MV1_SHAPE_MESH_F1 {
    DWORD DimPrev, DimNext;
    std::int32_t Index;
    DWORD TargetMesh;
    WORD  IsVertexPress;
    WORD  VertexPressParam;
    DWORD VertexNum;
    DWORD Vertex;
    DWORD UserData[4];
    DWORD Padding[4];
};

struct MV1_SHAPE_F1 {
    DWORD DimPrev, DimNext;
    DWORD Name;
    std::int32_t Index;
    DWORD Container;
    std::int32_t MeshNum;
    DWORD Mesh;
    DWORD UserData[4];
    DWORD Padding[4];
};

// Physics (PMX 物理演算)
struct MV1_PHYSICS_RIGIDBODY_F1 {
    DWORD DimPrev, DimNext;
    DWORD Name;
    std::int32_t Index;
    DWORD TargetFrame;
    std::int32_t RigidBodyGroupIndex;
    DWORD RigidBodyGroupTarget;
    std::int32_t ShapeType;  // 0:sphere / 1:box / 2:capsule
    float ShapeW, ShapeH, ShapeD;
    VECTOR Position;
    VECTOR Rotation;
    float RigidBodyWeight;
    float RigidBodyPosDim;    // 移動減衰
    float RigidBodyRotDim;    // 回転減衰
    float RigidBodyRecoil;    // 反発力
    float RigidBodyFriction;  // 摩擦力
    std::int32_t RigidBodyType;  // 0:Bone追従 / 1:物理 / 2:物理(Bone位置合わせ)
    DWORD UserData[4];
    DWORD Padding[4];
};

struct MV1_PHYSICS_JOINT_F1 {
    DWORD DimPrev, DimNext;
    DWORD Name;
    std::int32_t Index;
    DWORD RigidBodyA, RigidBodyB;
    VECTOR Position;
    VECTOR Rotation;
    VECTOR ConstrainPosition1, ConstrainPosition2;
    VECTOR ConstrainRotation1, ConstrainRotation2;
    VECTOR SpringPosition, SpringRotation;
    DWORD UserData[4];
    DWORD Padding[4];
};

struct MV1_FILEHEAD_PHYSICS_F1 {
    float WorldGravity;
    std::int32_t RigidBodyNum;
    DWORD RigidBody;
    std::int32_t JointNum;
    DWORD Joint;
    DWORD UserData[4];
    DWORD Padding[4];
};

struct MV1_FILEHEAD_SHAPE_F1 {
    std::int32_t FrameNum;
    DWORD Frame;
    std::int32_t DataNum;
    DWORD Data;
    std::int32_t MeshNum;
    DWORD Mesh;
    std::int32_t VertexNum;
    DWORD Vertex;
    std::int32_t PressVertexDataSize;
    DWORD PressVertexData;
    std::int32_t TargetMeshVertexNum;
    std::int32_t ShapeVertexUnitSize;
    std::int32_t NormalPositionNum;
    std::int32_t SkinPosition4BNum;
    std::int32_t SkinPosition8BNum;
    std::int32_t SkinPositionFREEBSize;
    DWORD UserData[4];
    DWORD Padding[4];
};

struct MV1MODEL_FILEHEADER_F1 {
    BYTE  CheckID[4];
    DWORD Version;
    std::int32_t RightHandType;
    std::int32_t AutoCreateNormal;
    std::int32_t ChangeDrawMaterialTableSize;
    std::int32_t ChangeMatrixTableSize;
    DWORD ChangeDrawMaterialTable;
    DWORD ChangeMatrixTable;
    std::int32_t FrameNum;
    DWORD Frame;
    std::int32_t TopFrameNum;
    DWORD FirstTopFrame, LastTopFrame;
    std::int32_t FrameUseSkinBoneNum;
    DWORD FrameUseSkinBone;
    std::int32_t MaterialNum;
    DWORD Material;
    std::int32_t TextureNum;
    DWORD Texture;
    std::int32_t MeshNum;
    DWORD Mesh;
    std::int32_t LightNum;
    DWORD Light;
    std::int32_t SkinBoneNum;
    DWORD SkinBone;
    std::int32_t SkinBoneUseFrameNum;
    DWORD SkinBoneUseFrame;
    std::int32_t TriangleListNum;
    DWORD TriangleList;
    DWORD VertexData;
    DWORD VertexDataSize;
    std::int32_t TriangleListNormalPositionNum;
    std::int32_t TriangleListSkinPosition4BNum;
    std::int32_t TriangleListSkinPosition8BNum;
    std::int32_t TriangleListSkinPositionFREEBSize;
    std::int32_t MeshPositionSize;
    std::int32_t MeshNormalNum;
    std::int32_t MeshVertexSize;
    std::int32_t MeshFaceNum;
    std::int32_t MeshVertexIndexNum;
    std::int32_t TriangleListIndexNum;
    std::int32_t TriangleNum;
    std::int32_t TriangleListVertexNum;
    std::int32_t StringSize;
    DWORD StringBuffer;
    std::int32_t OriginalAnimKeyDataSize;
    std::int32_t AnimKeyDataSize;
    DWORD AnimKeyData;
    std::int32_t AnimKeySetNum;
    std::int32_t AnimKeySetUnitSize;
    DWORD AnimKeySet;
    std::int32_t AnimNum;
    std::int32_t AnimUnitSize;
    DWORD Anim;
    std::int32_t AnimSetNum;
    DWORD AnimSet;
    DWORD UserData[4];
    DWORD Shape;
    DWORD Physics;
    BYTE MaterialNumberOrderDraw;
    BYTE IsStringUTF8;
    BYTE Padding1[2];
    DWORD Padding2[13];
};
static_assert(sizeof(MV1MODEL_FILEHEADER_F1) == 304,
              "MV1MODEL_FILEHEADER_F1 size should be 304 bytes (0x130)");

#pragma pack(pop)

}
