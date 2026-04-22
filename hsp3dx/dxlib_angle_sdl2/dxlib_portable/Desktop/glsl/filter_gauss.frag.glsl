// DxLib Desktop 内蔵 GLSL shader — GraphFilter GAUSS (separable)
// (L4: GPU 版。現在 CPU 版は DxGraphicsFilterDesktop.cpp に実装済。
//  SSAO など shader 必須 filter の下地として使う)

#version 120

uniform sampler2D u_input ;
uniform vec2      u_pixelSize ;   // (1/w, 1/h)
uniform int       u_isHorizontal ;

void main( void )
{
    vec2 uv = gl_TexCoord[ 0 ].xy ;
    vec2 d  = u_isHorizontal == 1 ? vec2( u_pixelSize.x, 0.0 ) : vec2( 0.0, u_pixelSize.y ) ;

    // σ=1.5 相当の 9 タップ Gaussian (sym weights)
    float w0 = 0.2271f ;
    float w1 = 0.1945f ;
    float w2 = 0.1216f ;
    float w3 = 0.0540f ;
    float w4 = 0.0162f ;

    vec4 s = texture2D( u_input, uv ) * w0
           + texture2D( u_input, uv + d * 1.0 ) * w1
           + texture2D( u_input, uv - d * 1.0 ) * w1
           + texture2D( u_input, uv + d * 2.0 ) * w2
           + texture2D( u_input, uv - d * 2.0 ) * w2
           + texture2D( u_input, uv + d * 3.0 ) * w3
           + texture2D( u_input, uv - d * 3.0 ) * w3
           + texture2D( u_input, uv + d * 4.0 ) * w4
           + texture2D( u_input, uv - d * 4.0 ) * w4 ;
    gl_FragColor = s ;
}
