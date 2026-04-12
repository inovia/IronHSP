;
; hspdxlib_struct.as - DxLib struct definitions for HSP
; Auto-generated from DxDLLW.cs (DxLib 3.24f)
;
; Structs are defined as buffer offset constants.
; Usage:
;   dim buf, VECTOR_SIZE / 4
;   ; or with IronHSP sdim:
;   sdim buf, VECTOR_SIZE
;   lpoke buf, VECTOR_x, 100  ; set x as float bits
;

#ifndef __HSPDXLIB_STRUCT__
#define global __HSPDXLIB_STRUCT__

; --- IPDATA_IPv6 (size=16, layout=Explicit) ---
#const global IPDATA_IPv6_SIZE 16
#const global IPDATA_IPv6_Byte00 0	; byte
#const global IPDATA_IPv6_Byte01 1	; byte
#const global IPDATA_IPv6_Byte02 2	; byte
#const global IPDATA_IPv6_Byte03 3	; byte
#const global IPDATA_IPv6_Byte04 4	; byte
#const global IPDATA_IPv6_Byte05 5	; byte
#const global IPDATA_IPv6_Byte06 6	; byte
#const global IPDATA_IPv6_Byte07 7	; byte
#const global IPDATA_IPv6_Byte08 8	; byte
#const global IPDATA_IPv6_Byte09 9	; byte
#const global IPDATA_IPv6_Byte10 10	; byte
#const global IPDATA_IPv6_Byte11 11	; byte
#const global IPDATA_IPv6_Byte12 12	; byte
#const global IPDATA_IPv6_Byte13 13	; byte
#const global IPDATA_IPv6_Byte14 14	; byte
#const global IPDATA_IPv6_Byte15 15	; byte

; --- RECT (size=16, layout=Explicit) ---
#const global RECT_SIZE 16
#const global RECT_left 0	; int
#const global RECT_top 4	; int
#const global RECT_right 8	; int
#const global RECT_bottom 12	; int

; --- MATRIX (size=64, layout=Explicit) ---
#const global MATRIX_SIZE 64
#const global MATRIX_m00 0	; float
#const global MATRIX_m01 4	; float
#const global MATRIX_m02 8	; float
#const global MATRIX_m03 12	; float
#const global MATRIX_m10 16	; float
#const global MATRIX_m11 20	; float
#const global MATRIX_m12 24	; float
#const global MATRIX_m13 28	; float
#const global MATRIX_m20 32	; float
#const global MATRIX_m21 36	; float
#const global MATRIX_m22 40	; float
#const global MATRIX_m23 44	; float
#const global MATRIX_m30 48	; float
#const global MATRIX_m31 52	; float
#const global MATRIX_m32 56	; float
#const global MATRIX_m33 60	; float

; --- MATRIX_D (size=128, layout=Explicit) ---
#const global MATRIX_D_SIZE 128
#const global MATRIX_D_m00 0	; double
#const global MATRIX_D_m01 8	; double
#const global MATRIX_D_m02 16	; double
#const global MATRIX_D_m03 24	; double
#const global MATRIX_D_m10 32	; double
#const global MATRIX_D_m11 40	; double
#const global MATRIX_D_m12 48	; double
#const global MATRIX_D_m13 56	; double
#const global MATRIX_D_m20 64	; double
#const global MATRIX_D_m21 72	; double
#const global MATRIX_D_m22 80	; double
#const global MATRIX_D_m23 88	; double
#const global MATRIX_D_m30 96	; double
#const global MATRIX_D_m31 104	; double
#const global MATRIX_D_m32 112	; double
#const global MATRIX_D_m33 120	; double

; --- COLORDATA (size=1064, layout=Explicit) ---
#const global COLORDATA_SIZE 1064
#const global COLORDATA_Format 0	; byte
#const global COLORDATA_ChannelNum 1	; byte
#const global COLORDATA_ChannelBitDepth 2	; byte
#const global COLORDATA_FloatTypeFlag 3	; byte
#const global COLORDATA_PixelByte 4	; byte
#const global COLORDATA_ColorBitDepth 5	; byte
#const global COLORDATA_NoneLoc 6	; byte
#const global COLORDATA_NoneWidth 7	; byte
#const global COLORDATA_RedWidth 8	; byte
#const global COLORDATA_GreenWidth 9	; byte
#const global COLORDATA_BlueWidth 10	; byte
#const global COLORDATA_AlphaWidth 11	; byte
#const global COLORDATA_RedLoc 12	; byte
#const global COLORDATA_GreenLoc 13	; byte
#const global COLORDATA_BlueLoc 14	; byte
#const global COLORDATA_AlphaLoc 15	; byte
#const global COLORDATA_RedMask 16	; uint
#const global COLORDATA_GreenMask 20	; uint
#const global COLORDATA_BlueMask 24	; uint
#const global COLORDATA_AlphaMask 28	; uint
#const global COLORDATA_NoneMask 32	; uint
#const global COLORDATA_MaxPaletteNo 36	; int
#const global COLORDATA_Palette0 40	; COLORPALETTEDATA
#const global COLORDATA_Palette255 1060	; COLORPALETTEDATA

; --- MV1_COLL_RESULT_POLY (size=100, layout=Explicit) ---
#const global MV1_COLL_RESULT_POLY_SIZE 100
#const global MV1_COLL_RESULT_POLY_HitFlag 0	; int
#const global MV1_COLL_RESULT_POLY_HitPosition 4	; VECTOR
#const global MV1_COLL_RESULT_POLY_FrameIndex 16	; int
#const global MV1_COLL_RESULT_POLY_PolyIndex 20	; int
#const global MV1_COLL_RESULT_POLY_MaterialIndex 24	; int
#const global MV1_COLL_RESULT_POLY_Position0 28	; VECTOR
#const global MV1_COLL_RESULT_POLY_Position1 40	; VECTOR
#const global MV1_COLL_RESULT_POLY_Position2 52	; VECTOR
#const global MV1_COLL_RESULT_POLY_Normal 64	; VECTOR
#const global MV1_COLL_RESULT_POLY_PositionWeight0 76	; float
#const global MV1_COLL_RESULT_POLY_PositionWeight1 80	; float
#const global MV1_COLL_RESULT_POLY_PositionWeight2 84	; float
#const global MV1_COLL_RESULT_POLY_PosMaxWeightFrameIndex0 88	; int
#const global MV1_COLL_RESULT_POLY_PosMaxWeightFrameIndex1 92	; int
#const global MV1_COLL_RESULT_POLY_PosMaxWeightFrameIndex2 96	; int

; --- MV1_REF_POLYGON (size=36, layout=Explicit) ---
#const global MV1_REF_POLYGON_SIZE 36
#const global MV1_REF_POLYGON_FrameIndex 0	; ushort
#const global MV1_REF_POLYGON_MeshIndex 2	; ushort
#const global MV1_REF_POLYGON_MaterialIndex 4	; ushort
#const global MV1_REF_POLYGON_VIndexTarget 6	; ushort
#const global MV1_REF_POLYGON_VIndex0 8	; int
#const global MV1_REF_POLYGON_VIndex1 12	; int
#const global MV1_REF_POLYGON_VIndex2 16	; int
#const global MV1_REF_POLYGON_MinPosition 20	; VECTOR
#const global MV1_REF_POLYGON_MaxPosition 32	; VECTOR

; --- MV1_REF_VERTEX (size=52, layout=Explicit) ---
#const global MV1_REF_VERTEX_SIZE 52
#const global MV1_REF_VERTEX_Position 0	; VECTOR
#const global MV1_REF_VERTEX_Normal 12	; VECTOR
#const global MV1_REF_VERTEX_TexCoord0 24	; FLOAT2
#const global MV1_REF_VERTEX_TexCoord1 32	; FLOAT2
#const global MV1_REF_VERTEX_DiffuseColor 40	; COLOR_U8
#const global MV1_REF_VERTEX_SpecularColor 44	; COLOR_U8
#const global MV1_REF_VERTEX_MaxWeightFrameIndex 48	; int

; --- MV1_REF_POLYGONLIST_NT (size=16, layout=Sequential) ---
#const global MV1_REF_POLYGONLIST_NT_SIZE 16
#const global MV1_REF_POLYGONLIST_NT_PolygonNum 0	; int
#const global MV1_REF_POLYGONLIST_NT_VertexNum 4	; int
#const global MV1_REF_POLYGONLIST_NT_MinPosition 8	; VECTOR
#const global MV1_REF_POLYGONLIST_NT_MaxPosition 12	; VECTOR

; --- DINPUT_JOYSTATE (size=80, layout=Explicit) ---
#const global DINPUT_JOYSTATE_SIZE 80
#const global DINPUT_JOYSTATE_X 0	; int
#const global DINPUT_JOYSTATE_Y 4	; int
#const global DINPUT_JOYSTATE_Z 8	; int
#const global DINPUT_JOYSTATE_Rx 12	; int
#const global DINPUT_JOYSTATE_Ry 16	; int
#const global DINPUT_JOYSTATE_Rz 20	; int
#const global DINPUT_JOYSTATE_Slider0 24	; int
#const global DINPUT_JOYSTATE_Slider1 28	; int
#const global DINPUT_JOYSTATE_POV0 32	; uint
#const global DINPUT_JOYSTATE_POV1 36	; uint
#const global DINPUT_JOYSTATE_POV2 40	; uint
#const global DINPUT_JOYSTATE_POV3 44	; uint
#const global DINPUT_JOYSTATE_Buttons0 48	; byte
#const global DINPUT_JOYSTATE_Buttons1 49	; byte
#const global DINPUT_JOYSTATE_Buttons2 50	; byte
#const global DINPUT_JOYSTATE_Buttons3 51	; byte
#const global DINPUT_JOYSTATE_Buttons4 52	; byte
#const global DINPUT_JOYSTATE_Buttons5 53	; byte
#const global DINPUT_JOYSTATE_Buttons6 54	; byte
#const global DINPUT_JOYSTATE_Buttons7 55	; byte
#const global DINPUT_JOYSTATE_Buttons8 56	; byte
#const global DINPUT_JOYSTATE_Buttons9 57	; byte
#const global DINPUT_JOYSTATE_Buttons10 58	; byte
#const global DINPUT_JOYSTATE_Buttons11 59	; byte
#const global DINPUT_JOYSTATE_Buttons12 60	; byte
#const global DINPUT_JOYSTATE_Buttons13 61	; byte
#const global DINPUT_JOYSTATE_Buttons14 62	; byte
#const global DINPUT_JOYSTATE_Buttons15 63	; byte
#const global DINPUT_JOYSTATE_Buttons16 64	; byte
#const global DINPUT_JOYSTATE_Buttons17 65	; byte
#const global DINPUT_JOYSTATE_Buttons18 66	; byte
#const global DINPUT_JOYSTATE_Buttons19 67	; byte
#const global DINPUT_JOYSTATE_Buttons20 68	; byte
#const global DINPUT_JOYSTATE_Buttons21 69	; byte
#const global DINPUT_JOYSTATE_Buttons22 70	; byte
#const global DINPUT_JOYSTATE_Buttons23 71	; byte
#const global DINPUT_JOYSTATE_Buttons24 72	; byte
#const global DINPUT_JOYSTATE_Buttons25 73	; byte
#const global DINPUT_JOYSTATE_Buttons26 74	; byte
#const global DINPUT_JOYSTATE_Buttons27 75	; byte
#const global DINPUT_JOYSTATE_Buttons28 76	; byte
#const global DINPUT_JOYSTATE_Buttons29 77	; byte
#const global DINPUT_JOYSTATE_Buttons30 78	; byte
#const global DINPUT_JOYSTATE_Buttons31 79	; byte

; --- XINPUT_STATE (size=26, layout=Explicit) ---
#const global XINPUT_STATE_SIZE 26
#const global XINPUT_STATE_Buttons0 0	; byte
#const global XINPUT_STATE_Buttons1 1	; byte
#const global XINPUT_STATE_Buttons2 2	; byte
#const global XINPUT_STATE_Buttons3 3	; byte
#const global XINPUT_STATE_Buttons4 4	; byte
#const global XINPUT_STATE_Buttons5 5	; byte
#const global XINPUT_STATE_Buttons6 6	; byte
#const global XINPUT_STATE_Buttons7 7	; byte
#const global XINPUT_STATE_Buttons8 8	; byte
#const global XINPUT_STATE_Buttons9 9	; byte
#const global XINPUT_STATE_Buttons10 10	; byte
#const global XINPUT_STATE_Buttons11 11	; byte
#const global XINPUT_STATE_Buttons12 12	; byte
#const global XINPUT_STATE_Buttons13 13	; byte
#const global XINPUT_STATE_Buttons14 14	; byte
#const global XINPUT_STATE_Buttons15 15	; byte
#const global XINPUT_STATE_LeftTrigger 16	; byte
#const global XINPUT_STATE_RightTrigger 17	; byte
#const global XINPUT_STATE_ThumbLX 18	; short
#const global XINPUT_STATE_ThumbLY 20	; short
#const global XINPUT_STATE_ThumbRX 22	; short
#const global XINPUT_STATE_ThumbRY 24	; short

; --- TOUCHINPUTDATA (size=252, layout=Explicit) ---
#const global TOUCHINPUTDATA_SIZE 252
#const global TOUCHINPUTDATA_Time 0	; int
#const global TOUCHINPUTDATA_PointNum 4	; int
#const global TOUCHINPUTDATA_Point0 8	; TOUCHINPUTPOINT
#const global TOUCHINPUTDATA_Point1 24	; TOUCHINPUTPOINT
#const global TOUCHINPUTDATA_Point2 40	; TOUCHINPUTPOINT
#const global TOUCHINPUTDATA_Point3 56	; TOUCHINPUTPOINT
#const global TOUCHINPUTDATA_Point4 72	; TOUCHINPUTPOINT
#const global TOUCHINPUTDATA_Point5 88	; TOUCHINPUTPOINT
#const global TOUCHINPUTDATA_Point6 104	; TOUCHINPUTPOINT
#const global TOUCHINPUTDATA_Point7 120	; TOUCHINPUTPOINT
#const global TOUCHINPUTDATA_Point8 136	; TOUCHINPUTPOINT
#const global TOUCHINPUTDATA_Point9 152	; TOUCHINPUTPOINT
#const global TOUCHINPUTDATA_Point10 168	; TOUCHINPUTPOINT
#const global TOUCHINPUTDATA_Point11 184	; TOUCHINPUTPOINT
#const global TOUCHINPUTDATA_Point12 200	; TOUCHINPUTPOINT
#const global TOUCHINPUTDATA_Point13 216	; TOUCHINPUTPOINT
#const global TOUCHINPUTDATA_Point14 232	; TOUCHINPUTPOINT
#const global TOUCHINPUTDATA_Point15 248	; TOUCHINPUTPOINT

; --- IMEINPUTCLAUSEDATA (size=8, layout=Explicit) ---
#const global IMEINPUTCLAUSEDATA_SIZE 8
#const global IMEINPUTCLAUSEDATA_Position 0	; int
#const global IMEINPUTCLAUSEDATA_Length 4	; int

; --- IMEINPUTDATA (size=36, layout=Explicit) ---
#const global IMEINPUTDATA_SIZE 36
#const global IMEINPUTDATA_InputString 0	; uint
#const global IMEINPUTDATA_CursorPosition 4	; int
#const global IMEINPUTDATA_ClauseData 8	; uint
#const global IMEINPUTDATA_ClauseNum 12	; int
#const global IMEINPUTDATA_SelectClause 16	; int
#const global IMEINPUTDATA_CandidateNum 20	; int
#const global IMEINPUTDATA_CandidateList 24	; uint
#const global IMEINPUTDATA_SelectCandidate 28	; int
#const global IMEINPUTDATA_ConvertFlag 32	; int

; --- DISPLAYMODEDATA (size=16, layout=Explicit) ---
#const global DISPLAYMODEDATA_SIZE 16
#const global DISPLAYMODEDATA_Width 0	; int
#const global DISPLAYMODEDATA_Height 4	; int
#const global DISPLAYMODEDATA_ColorBitDepth 8	; int
#const global DISPLAYMODEDATA_RefreshRate 12	; int

; --- DATEDATA (size=24, layout=Explicit) ---
#const global DATEDATA_SIZE 24
#const global DATEDATA_Year 0	; int
#const global DATEDATA_Mon 4	; int
#const global DATEDATA_Day 8	; int
#const global DATEDATA_Hour 12	; int
#const global DATEDATA_Min 16	; int
#const global DATEDATA_Sec 20	; int

; --- VECTOR (size=12, layout=Explicit) ---
#const global VECTOR_SIZE 12
#const global VECTOR_x 0	; float
#const global VECTOR_y 4	; float
#const global VECTOR_z 8	; float

; --- VECTOR_D (size=24, layout=Explicit) ---
#const global VECTOR_D_SIZE 24
#const global VECTOR_D_x 0	; double
#const global VECTOR_D_y 8	; double
#const global VECTOR_D_z 16	; double

; --- FLOAT2 (size=8, layout=Explicit) ---
#const global FLOAT2_SIZE 8
#const global FLOAT2_u 0	; float
#const global FLOAT2_v 4	; float

; --- COLOR_F (size=16, layout=Explicit) ---
#const global COLOR_F_SIZE 16
#const global COLOR_F_r 0	; float
#const global COLOR_F_g 4	; float
#const global COLOR_F_b 8	; float
#const global COLOR_F_a 12	; float

; --- COLOR_U8 (size=4, layout=Explicit) ---
#const global COLOR_U8_SIZE 4
#const global COLOR_U8_b 0	; byte
#const global COLOR_U8_g 1	; byte
#const global COLOR_U8_r 2	; byte
#const global COLOR_U8_a 3	; byte

; --- FLOAT4 (size=16, layout=Explicit) ---
#const global FLOAT4_SIZE 16
#const global FLOAT4_x 0	; float
#const global FLOAT4_y 4	; float
#const global FLOAT4_z 8	; float
#const global FLOAT4_w 12	; float

; --- DOUBLE4 (size=32, layout=Explicit) ---
#const global DOUBLE4_SIZE 32
#const global DOUBLE4_x 0	; double
#const global DOUBLE4_y 8	; double
#const global DOUBLE4_z 16	; double
#const global DOUBLE4_w 24	; double

; --- INT4 (size=16, layout=Explicit) ---
#const global INT4_SIZE 16
#const global INT4_x 0	; int
#const global INT4_y 4	; int
#const global INT4_z 8	; int
#const global INT4_w 12	; int

; --- VERTEX2D (size=28, layout=Explicit) ---
#const global VERTEX2D_SIZE 28
#const global VERTEX2D_pos 0	; VECTOR
#const global VERTEX2D_rhw 12	; float
#const global VERTEX2D_dif 16	; COLOR_U8
#const global VERTEX2D_u 20	; float
#const global VERTEX2D_v 24	; float

; --- VERTEX2DSHADER (size=40, layout=Explicit) ---
#const global VERTEX2DSHADER_SIZE 40
#const global VERTEX2DSHADER_pos 0	; VECTOR
#const global VERTEX2DSHADER_rhw 12	; float
#const global VERTEX2DSHADER_dif 16	; COLOR_U8
#const global VERTEX2DSHADER_spc 20	; COLOR_U8
#const global VERTEX2DSHADER_u 24	; float
#const global VERTEX2DSHADER_v 28	; float
#const global VERTEX2DSHADER_su 32	; float
#const global VERTEX2DSHADER_sv 36	; float

; --- VERTEX (size=20, layout=Explicit) ---
#const global VERTEX_SIZE 20
#const global VERTEX_x 0	; float
#const global VERTEX_y 4	; float
#const global VERTEX_u 8	; float
#const global VERTEX_v 12	; float
#const global VERTEX_b 16	; byte
#const global VERTEX_g 17	; byte
#const global VERTEX_r 18	; byte
#const global VERTEX_a 19	; byte

; --- VERTEX_3D (size=24, layout=Explicit) ---
#const global VERTEX_3D_SIZE 24
#const global VERTEX_3D_pos 0	; VECTOR
#const global VERTEX_3D_b 12	; byte
#const global VERTEX_3D_g 13	; byte
#const global VERTEX_3D_r 14	; byte
#const global VERTEX_3D_a 15	; byte
#const global VERTEX_3D_u 16	; float
#const global VERTEX_3D_v 20	; float

; --- VERTEX3D (size=48, layout=Explicit) ---
#const global VERTEX3D_SIZE 48
#const global VERTEX3D_pos 0	; VECTOR
#const global VERTEX3D_norm 12	; VECTOR
#const global VERTEX3D_dif 24	; COLOR_U8
#const global VERTEX3D_spc 28	; COLOR_U8
#const global VERTEX3D_u 32	; float
#const global VERTEX3D_v 36	; float
#const global VERTEX3D_su 40	; float
#const global VERTEX3D_sv 44	; float

; --- VERTEX3DSHADER (size=88, layout=Explicit) ---
#const global VERTEX3DSHADER_SIZE 88
#const global VERTEX3DSHADER_pos 0	; VECTOR
#const global VERTEX3DSHADER_spos 12	; FLOAT4
#const global VERTEX3DSHADER_norm 28	; VECTOR
#const global VERTEX3DSHADER_tan 40	; VECTOR
#const global VERTEX3DSHADER_binorm 52	; VECTOR
#const global VERTEX3DSHADER_dif 64	; COLOR_U8
#const global VERTEX3DSHADER_spc 68	; COLOR_U8
#const global VERTEX3DSHADER_u 72	; float
#const global VERTEX3DSHADER_v 76	; float
#const global VERTEX3DSHADER_su 80	; float
#const global VERTEX3DSHADER_sv 84	; float

; --- LIGHTPARAM (size=104, layout=Explicit) ---
#const global LIGHTPARAM_SIZE 104
#const global LIGHTPARAM_LightType 0	; int
#const global LIGHTPARAM_Diffuse 4	; COLOR_F
#const global LIGHTPARAM_Specular 20	; COLOR_F
#const global LIGHTPARAM_Ambient 36	; COLOR_F
#const global LIGHTPARAM_Position 52	; VECTOR
#const global LIGHTPARAM_Direction 64	; VECTOR
#const global LIGHTPARAM_Range 76	; float
#const global LIGHTPARAM_Falloff 80	; float
#const global LIGHTPARAM_Attenuation0 84	; float
#const global LIGHTPARAM_Attenuation1 88	; float
#const global LIGHTPARAM_Attenuation2 92	; float
#const global LIGHTPARAM_Theta 96	; float
#const global LIGHTPARAM_Phi 100	; float

; --- MATERIALPARAM (size=68, layout=Explicit) ---
#const global MATERIALPARAM_SIZE 68
#const global MATERIALPARAM_Diffuse 0	; COLOR_F
#const global MATERIALPARAM_Ambient 16	; COLOR_F
#const global MATERIALPARAM_Specular 32	; COLOR_F
#const global MATERIALPARAM_Emissive 48	; COLOR_F
#const global MATERIALPARAM_Power 64	; float

; --- HITRESULT_LINE (size=8, layout=Explicit) ---
#const global HITRESULT_LINE_SIZE 8
#const global HITRESULT_LINE_HitFlag 0	; int
#const global HITRESULT_LINE_Position 4	; VECTOR

; --- HITRESULT_LINE_D (size=8, layout=Explicit) ---
#const global HITRESULT_LINE_D_SIZE 8
#const global HITRESULT_LINE_D_HitFlag 0	; int
#const global HITRESULT_LINE_D_Position 4	; VECTOR_D

; --- SEGMENT_SEGMENT_RESULT (size=28, layout=Explicit) ---
#const global SEGMENT_SEGMENT_RESULT_SIZE 28
#const global SEGMENT_SEGMENT_RESULT_SegA_SegB_MinDist_Square 0	; float
#const global SEGMENT_SEGMENT_RESULT_SegA_MinDist_Pos1_Pos2_t 4	; float
#const global SEGMENT_SEGMENT_RESULT_SegB_MinDist_Pos1_Pos2_t 8	; float
#const global SEGMENT_SEGMENT_RESULT_SegA_MinDist_Pos 12	; VECTOR
#const global SEGMENT_SEGMENT_RESULT_SegB_MinDist_Pos 24	; VECTOR

; --- SEGMENT_SEGMENT_RESULT_D (size=52, layout=Explicit) ---
#const global SEGMENT_SEGMENT_RESULT_D_SIZE 52
#const global SEGMENT_SEGMENT_RESULT_D_SegA_SegB_MinDist_Square 0	; double
#const global SEGMENT_SEGMENT_RESULT_D_SegA_MinDist_Pos1_Pos2_t 8	; double
#const global SEGMENT_SEGMENT_RESULT_D_SegB_MinDist_Pos1_Pos2_t 16	; double
#const global SEGMENT_SEGMENT_RESULT_D_SegA_MinDist_Pos 24	; VECTOR_D
#const global SEGMENT_SEGMENT_RESULT_D_SegB_MinDist_Pos 48	; VECTOR_D

; --- SEGMENT_POINT_RESULT (size=12, layout=Explicit) ---
#const global SEGMENT_POINT_RESULT_SIZE 12
#const global SEGMENT_POINT_RESULT_Seg_Point_MinDist_Square 0	; float
#const global SEGMENT_POINT_RESULT_Seg_MinDist_Pos1_Pos2_t 4	; float
#const global SEGMENT_POINT_RESULT_Seg_MinDist_Pos 8	; VECTOR

; --- SEGMENT_POINT_RESULT_D (size=20, layout=Explicit) ---
#const global SEGMENT_POINT_RESULT_D_SIZE 20
#const global SEGMENT_POINT_RESULT_D_Seg_Point_MinDist_Square 0	; double
#const global SEGMENT_POINT_RESULT_D_Seg_MinDist_Pos1_Pos2_t 8	; double
#const global SEGMENT_POINT_RESULT_D_Seg_MinDist_Pos 16	; VECTOR_D

; --- SEGMENT_TRIANGLE_RESULT (size=36, layout=Explicit) ---
#const global SEGMENT_TRIANGLE_RESULT_SIZE 36
#const global SEGMENT_TRIANGLE_RESULT_Seg_Tri_MinDist_Square 0	; float
#const global SEGMENT_TRIANGLE_RESULT_Seg_MinDist_Pos1_Pos2_t 4	; float
#const global SEGMENT_TRIANGLE_RESULT_Seg_MinDist_Pos 8	; VECTOR
#const global SEGMENT_TRIANGLE_RESULT_Tri_MinDist_Pos1_w 20	; float
#const global SEGMENT_TRIANGLE_RESULT_Tri_MinDist_Pos2_w 24	; float
#const global SEGMENT_TRIANGLE_RESULT_Tri_MinDist_Pos3_w 28	; float
#const global SEGMENT_TRIANGLE_RESULT_Tri_MinDist_Pos 32	; VECTOR

; --- SEGMENT_TRIANGLE_RESULT_D (size=68, layout=Explicit) ---
#const global SEGMENT_TRIANGLE_RESULT_D_SIZE 68
#const global SEGMENT_TRIANGLE_RESULT_D_Seg_Tri_MinDist_Square 0	; double
#const global SEGMENT_TRIANGLE_RESULT_D_Seg_MinDist_Pos1_Pos2_t 8	; double
#const global SEGMENT_TRIANGLE_RESULT_D_Seg_MinDist_Pos 16	; VECTOR_D
#const global SEGMENT_TRIANGLE_RESULT_D_Tri_MinDist_Pos1_w 40	; double
#const global SEGMENT_TRIANGLE_RESULT_D_Tri_MinDist_Pos2_w 48	; double
#const global SEGMENT_TRIANGLE_RESULT_D_Tri_MinDist_Pos3_w 56	; double
#const global SEGMENT_TRIANGLE_RESULT_D_Tri_MinDist_Pos 64	; VECTOR_D

; --- TRIANGLE_POINT_RESULT (size=20, layout=Explicit) ---
#const global TRIANGLE_POINT_RESULT_SIZE 20
#const global TRIANGLE_POINT_RESULT_Tri_Pnt_MinDist_Square 0	; float
#const global TRIANGLE_POINT_RESULT_Tri_MinDist_Pos1_w 4	; float
#const global TRIANGLE_POINT_RESULT_Tri_MinDist_Pos2_w 8	; float
#const global TRIANGLE_POINT_RESULT_Tri_MinDist_Pos3_w 12	; float
#const global TRIANGLE_POINT_RESULT_Tri_MinDist_Pos 16	; VECTOR

; --- TRIANGLE_POINT_RESULT_D (size=36, layout=Explicit) ---
#const global TRIANGLE_POINT_RESULT_D_SIZE 36
#const global TRIANGLE_POINT_RESULT_D_Tri_Pnt_MinDist_Square 0	; double
#const global TRIANGLE_POINT_RESULT_D_Tri_MinDist_Pos1_w 8	; double
#const global TRIANGLE_POINT_RESULT_D_Tri_MinDist_Pos2_w 16	; double
#const global TRIANGLE_POINT_RESULT_D_Tri_MinDist_Pos3_w 24	; double
#const global TRIANGLE_POINT_RESULT_D_Tri_MinDist_Pos 32	; VECTOR_D

; --- PLANE_POINT_RESULT (size=12, layout=Explicit) ---
#const global PLANE_POINT_RESULT_SIZE 12
#const global PLANE_POINT_RESULT_Pnt_Plane_Normal_Side 0	; int
#const global PLANE_POINT_RESULT_Plane_Pnt_MinDist_Square 4	; float
#const global PLANE_POINT_RESULT_Plane_MinDist_Pos 8	; VECTOR

; --- PLANE_POINT_RESULT_D (size=16, layout=Explicit) ---
#const global PLANE_POINT_RESULT_D_SIZE 16
#const global PLANE_POINT_RESULT_D_Pnt_Plane_Normal_Side 0	; int
#const global PLANE_POINT_RESULT_D_Plane_Pnt_MinDist_Square 4	; double
#const global PLANE_POINT_RESULT_D_Plane_MinDist_Pos 12	; VECTOR_D

; --- MV1_COLL_RESULT_POLY_DIM (size=8, layout=Explicit) ---
#const global MV1_COLL_RESULT_POLY_DIM_SIZE 8
#const global MV1_COLL_RESULT_POLY_DIM_HitNum 0	; int
#const global MV1_COLL_RESULT_POLY_DIM_Dim 4	; uint

; --- SOUND3D_REVERB_PARAM (size=52, layout=Explicit) ---
#const global SOUND3D_REVERB_PARAM_SIZE 52
#const global SOUND3D_REVERB_PARAM_WetDryMix 0	; float
#const global SOUND3D_REVERB_PARAM_ReflectionsDelay 4	; uint
#const global SOUND3D_REVERB_PARAM_ReverbDelay 8	; byte
#const global SOUND3D_REVERB_PARAM_RearDelay 9	; byte
#const global SOUND3D_REVERB_PARAM_PositionLeft 10	; byte
#const global SOUND3D_REVERB_PARAM_PositionRight 11	; byte
#const global SOUND3D_REVERB_PARAM_PositionMatrixLeft 12	; byte
#const global SOUND3D_REVERB_PARAM_PositionMatrixRight 13	; byte
#const global SOUND3D_REVERB_PARAM_EarlyDiffusion 14	; byte
#const global SOUND3D_REVERB_PARAM_LateDiffusion 15	; byte
#const global SOUND3D_REVERB_PARAM_LowEQGain 16	; byte
#const global SOUND3D_REVERB_PARAM_LowEQCutoff 17	; byte
#const global SOUND3D_REVERB_PARAM_HighEQGain 18	; byte
#const global SOUND3D_REVERB_PARAM_HighEQCutoff 19	; byte
#const global SOUND3D_REVERB_PARAM_RoomFilterFreq 20	; float
#const global SOUND3D_REVERB_PARAM_RoomFilterMain 24	; float
#const global SOUND3D_REVERB_PARAM_RoomFilterHF 28	; float
#const global SOUND3D_REVERB_PARAM_ReflectionsGain 32	; float
#const global SOUND3D_REVERB_PARAM_ReverbGain 36	; float
#const global SOUND3D_REVERB_PARAM_DecayTime 40	; float
#const global SOUND3D_REVERB_PARAM_Density 44	; float
#const global SOUND3D_REVERB_PARAM_RoomSize 48	; float

; --- COLORPALETTEDATA (size=4, layout=Explicit) ---
#const global COLORPALETTEDATA_SIZE 4
#const global COLORPALETTEDATA_Blue 0	; byte
#const global COLORPALETTEDATA_Green 1	; byte
#const global COLORPALETTEDATA_Red 2	; byte
#const global COLORPALETTEDATA_Alpha 3	; byte

; --- BASEIMAGE (size=1088, layout=Explicit) ---
#const global BASEIMAGE_SIZE 1088
#const global BASEIMAGE_ColorData 0	; COLORDATA
#const global BASEIMAGE_Width 1064	; int
#const global BASEIMAGE_Height 1068	; int
#const global BASEIMAGE_Pitch 1072	; int
#const global BASEIMAGE_GraphData 1076	; uint
#const global BASEIMAGE_MipMapCount 1080	; int
#const global BASEIMAGE_GraphDataCount 1084	; int

; --- RECTDATA (size=24, layout=Explicit) ---
#const global RECTDATA_SIZE 24
#const global RECTDATA_x1 0	; int
#const global RECTDATA_y1 4	; int
#const global RECTDATA_x2 8	; int
#const global RECTDATA_y2 12	; int
#const global RECTDATA_color 16	; uint
#const global RECTDATA_pal 20	; int

; --- LINEDATA (size=24, layout=Explicit) ---
#const global LINEDATA_SIZE 24
#const global LINEDATA_x1 0	; int
#const global LINEDATA_y1 4	; int
#const global LINEDATA_x2 8	; int
#const global LINEDATA_y2 12	; int
#const global LINEDATA_color 16	; uint
#const global LINEDATA_pal 20	; int

; --- POINTDATA (size=16, layout=Explicit) ---
#const global POINTDATA_SIZE 16
#const global POINTDATA_x 0	; int
#const global POINTDATA_y 4	; int
#const global POINTDATA_color 8	; uint
#const global POINTDATA_pal 12	; int

; --- CUBEDATA (size=32, layout=Explicit) ---
#const global CUBEDATA_SIZE 32
#const global CUBEDATA_Pos1 0	; VECTOR
#const global CUBEDATA_Pos2 12	; VECTOR
#const global CUBEDATA_DifColor 24	; COLOR_U8
#const global CUBEDATA_SpcColor 28	; COLOR_U8

; --- IMAGEFORMATDESC (size=19, layout=Explicit) ---
#const global IMAGEFORMATDESC_SIZE 19
#const global IMAGEFORMATDESC_TextureFlag 0	; byte
#const global IMAGEFORMATDESC_CubeMapTextureFlag 1	; byte
#const global IMAGEFORMATDESC_AlphaChFlag 2	; byte
#const global IMAGEFORMATDESC_DrawValidFlag 3	; byte
#const global IMAGEFORMATDESC_SystemMemFlag 4	; byte
#const global IMAGEFORMATDESC_UseManagedTextureFlag 5	; byte
#const global IMAGEFORMATDESC_UseLinearMapTextureFlag 6	; byte
#const global IMAGEFORMATDESC_PlatformTextureFormat 7	; byte
#const global IMAGEFORMATDESC_BaseFormat 8	; byte
#const global IMAGEFORMATDESC_MipMapCount 9	; byte
#const global IMAGEFORMATDESC_AlphaTestFlag 10	; byte
#const global IMAGEFORMATDESC_FloatTypeFlag 11	; byte
#const global IMAGEFORMATDESC_ColorBitDepth 12	; byte
#const global IMAGEFORMATDESC_ChannelNum 13	; byte
#const global IMAGEFORMATDESC_ChannelBitDepth 14	; byte
#const global IMAGEFORMATDESC_BlendGraphFlag 15	; byte
#const global IMAGEFORMATDESC_UsePaletteFlag 16	; byte
#const global IMAGEFORMATDESC_MSSamples 17	; byte
#const global IMAGEFORMATDESC_MSQuality 18	; byte

; --- TOUCHINPUTPOINT (size=32, layout=Explicit) ---
#const global TOUCHINPUTPOINT_SIZE 32
#const global TOUCHINPUTPOINT_Device 0	; uint
#const global TOUCHINPUTPOINT_ID 4	; uint
#const global TOUCHINPUTPOINT_PositionX 8	; int
#const global TOUCHINPUTPOINT_PositionY 12	; int
#const global TOUCHINPUTPOINT_Pressure 16	; float
#const global TOUCHINPUTPOINT_Orientation 20	; float
#const global TOUCHINPUTPOINT_Tilt 24	; float
#const global TOUCHINPUTPOINT_ToolType 28	; int

; --- IPDATA (size=4, layout=Explicit) ---
#const global IPDATA_SIZE 4
#const global IPDATA_d1 0	; byte
#const global IPDATA_d2 1	; byte
#const global IPDATA_d3 2	; byte
#const global IPDATA_d4 3	; byte

#endif ; __HSPDXLIB_STRUCT__
