// DxLib Desktop 内蔵 GLSL shader — MV1 basic fragment shader (L4 Phase 2)
//
// - diffuse tex × 頂点色
// - per-fragment Blinn-Phong (GL_LIGHT0 単一 directional、gl_LightSource[0] 参照)
// - optional shadow map 乗算 (sampler2DShadow / TMU 4)
// - alpha test (discard)

#version 120

uniform sampler2D       u_diffuse0 ;
uniform int             u_useTexture ;
uniform int             u_useLighting ;
uniform int             u_useShadow ;
uniform sampler2DShadow u_shadowMap ;
uniform float           u_alphaThreshold ;   // UseAlphaTest 用 (0 なら無効)

varying vec2 v_uv0 ;
varying vec3 v_normal ;
varying vec4 v_color ;
varying vec3 v_eyePos ;

void main( void )
{
    vec4 base = ( u_useTexture == 1 )
                ? texture2D( u_diffuse0, v_uv0 ) * v_color
                :                                 v_color ;

    if ( u_alphaThreshold > 0.0 && base.a < u_alphaThreshold ) discard ;

    if ( u_useLighting == 1 ) {
        // gl_LightSource[0] は fixed-function の light state を引き継ぐ (GL 2.1 compat)
        vec3 L   = normalize( gl_LightSource[ 0 ].position.xyz - v_eyePos ) ;
        vec3 V   = normalize( -v_eyePos ) ;
        vec3 H   = normalize( L + V ) ;
        vec3 N   = normalize( v_normal ) ;
        float ndl = max( dot( N, L ), 0.0 ) ;
        float ndh = max( dot( N, H ), 0.0 ) ;

        vec3 diffuse  = base.rgb * ( gl_LightSource[ 0 ].diffuse.rgb * ndl ) ;
        vec3 ambient  = base.rgb *   gl_LightModel.ambient.rgb ;
        float shininess = gl_FrontMaterial.shininess ;
        float spec = ( shininess > 0.0 ) ? pow( ndh, max( shininess, 1.0 ) ) : 0.0 ;
        vec3 specular = gl_FrontMaterial.specular.rgb * spec ;

        base.rgb = ambient + diffuse + specular ;
    }

    // Shadow 乗算 (TMU 4 に sampler2DShadow、texcoord は gl_TexCoord[4])
    if ( u_useShadow == 1 ) {
        float lit = shadow2DProj( u_shadowMap, gl_TexCoord[ 4 ] ).r ;
        // 陰影で暗くする (0 = 影、1 = 日向) → 0.3 + 0.7 * lit で minimum ambient 確保
        base.rgb *= ( 0.3 + 0.7 * lit ) ;
    }

    gl_FragColor = base ;
}
