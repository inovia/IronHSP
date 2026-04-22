// DxLib Desktop 内蔵 GLSL shader — MV1 basic fragment shader
// (L4: Phase 1 準備)
//
// 現状: diffuse texture × 頂点色の単純出力。
// 実運用に必要な追加:
//  - per-fragment lighting (lambert / blinn-phong)
//  - SpecularLayer / NormalLayer sampling
//  - Toon gradation (DiffuseGradTexture 1D lookup)
//  - Shadow map projection + PCF
//  - Alpha test / discard for MV1_MATERIAL.UseAlphaTest

#version 120

uniform sampler2D u_diffuse0 ;
uniform int       u_useTexture ;

varying vec2 v_uv0 ;
varying vec3 v_normal ;
varying vec4 v_color ;

void main( void )
{
    vec4 base ;
    if ( u_useTexture == 1 ) {
        base = texture2D( u_diffuse0, v_uv0 ) * v_color ;
    } else {
        base = v_color ;
    }
    gl_FragColor = base ;
}
