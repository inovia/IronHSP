// DxLib Desktop 内蔵 GLSL shader — MV1 basic vertex shader
// (L4: DxLib 本家 HLSL shader の GLSL 版 — Phase 1 準備)
//
// 機能 (予定):
//  - 頂点位置/法線をワールド空間へ変換
//  - Diffuse texture の UV を fragment shader へ渡す
//  - directional light 0..3 を per-vertex で評価、diffuse/specular 結果を varying で渡す
//  - 4-bone skinning (bone matrix をuniform 配列で受ける)
//  - Shadow map の light-space position 計算 (future)
//
// 現状: fixed-function の model-view-projection を踏襲した最小実装。
// 実 DxLib model 描画 path (DxShader_VS_*) と互換性を取るには次の作業が必要:
//  - bone matrix palette uniform (MATRIX bone_mat[ 128 ])
//  - skinning index/weight vertex attributes
//  - DiffuseLayer N 段階 UV 出力
//  - 法線変換 (TRS 合成 → inv-transpose)

#version 120

varying vec2 v_uv0 ;
varying vec3 v_normal ;
varying vec4 v_color ;

void main( void )
{
    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex ;
    v_uv0       = gl_MultiTexCoord0.xy ;
    v_normal    = gl_NormalMatrix * gl_Normal ;
    v_color     = gl_Color ;
}
