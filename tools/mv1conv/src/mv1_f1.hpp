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
