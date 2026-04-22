#pragma once
// DxModelFile.h / DxModel.h の関連 enum 定数
#include <cstdint>

namespace mv1conv::e {

// MV1_TRIANGLE_LIST_F1.VertexType
constexpr std::uint16_t VERTEX_TYPE_NORMAL        = 0;
constexpr std::uint16_t VERTEX_TYPE_SKIN_4BONE    = 1;
constexpr std::uint16_t VERTEX_TYPE_SKIN_8BONE    = 2;
constexpr std::uint16_t VERTEX_TYPE_SKIN_FREEBONE = 3;

// MV1_TRIANGLE_LIST_F1.Flag (MeshVertexIndex type in bit 0-1, Index type in bit 2-3)
constexpr std::uint16_t TRILIST_FLAG_MVERT_INDEX_MASK = 0x0003;
constexpr std::uint16_t TRILIST_FLAG_INDEX_MASK       = 0x000C;
constexpr std::uint16_t TRILIST_INDEX_TYPE_U8  = 0;
constexpr std::uint16_t TRILIST_INDEX_TYPE_U16 = 1;
constexpr std::uint16_t TRILIST_INDEX_TYPE_U32 = 2;

// MV1_FRAME_F1.VertFlag
constexpr std::uint16_t FRAME_VERT_FLAG_NORMAL_TYPE_MASK   = 0x0003;
constexpr std::uint16_t FRAME_VERT_FLAG_POSITION_B16       = 0x0004;
constexpr std::uint16_t FRAME_VERT_FLAG_MATRIX_WEIGHT_NONE = 0x0008;
constexpr std::uint16_t FRAME_VERT_FLAG_MATRIX_INDEX_MASK  = 0x0010;
constexpr std::uint16_t FRAME_VERT_FLAG_MATRIX_WEIGHT_MASK = 0x0020;
constexpr std::uint16_t FRAME_VERT_FLAG_NT_BINORMAL        = 0x0040; // Normal + Tangent + Binormal

constexpr std::uint16_t FRAME_NORMAL_TYPE_NONE = 0;
constexpr std::uint16_t FRAME_NORMAL_TYPE_S8   = 1;
constexpr std::uint16_t FRAME_NORMAL_TYPE_S16  = 2;
constexpr std::uint16_t FRAME_NORMAL_TYPE_F32  = 3;

// MV1_MESH_F1.VertFlag (int)
constexpr std::uint32_t MESH_VERT_FLAG_POS_IND_TYPE_MASK = 0x0003;
constexpr std::uint32_t MESH_VERT_FLAG_NRM_IND_TYPE_MASK = 0x000C;
constexpr std::uint32_t MESH_VERT_FLAG_UV_U16            = 0x0010;
constexpr std::uint32_t MESH_VERT_FLAG_COMMON_COLOR      = 0x0020;
constexpr std::uint32_t MESH_VERT_FLAG_NON_TOON_OUTLINE  = 0x0040;
constexpr std::uint32_t MESH_VERT_INDEX_TYPE_NONE = 0;
constexpr std::uint32_t MESH_VERT_INDEX_TYPE_U8   = 1;
constexpr std::uint32_t MESH_VERT_INDEX_TYPE_U16  = 2;
constexpr std::uint32_t MESH_VERT_INDEX_TYPE_U32  = 3;

}
