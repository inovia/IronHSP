// DxLib Desktop 内蔵 GLSL shader — MV1 basic vertex shader (L4 Phase 2)
//
// 入力: gl_Vertex (skinned world 位置), gl_Normal (skinned world 法線),
//       gl_MultiTexCoord0 (UV), gl_Color (マテリアル diffuse)
// 出力: varying v_uv0 / v_normal / v_color / v_eyePos (per-fragment lighting 用)
//
// DxLib skinning (4/8/FREE-bone) は CPU 側で適用済で、glVertex3f に skinned
// world 位置を送る設計を踏襲する。shader 側 skinning は L4 Phase 3 で追加予定。

#version 120

varying vec2 v_uv0 ;
varying vec3 v_normal ;
varying vec4 v_color ;
varying vec3 v_eyePos ;

void main( void )
{
    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex ;
    v_uv0       = gl_MultiTexCoord0.xy ;
    v_normal    = normalize( gl_NormalMatrix * gl_Normal ) ;
    v_color     = gl_Color ;
    v_eyePos    = ( gl_ModelViewMatrix * gl_Vertex ).xyz ;
}
