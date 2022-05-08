#if defined(OPENGL_ES) || defined(GL_ES)
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
#endif

///////////////////////////////////////////////////////////
// Uniforms
uniform sampler2D u_texture;
uniform float u_width;
uniform float u_height;

///////////////////////////////////////////////////////////
// Varyings
varying vec2 v_texCoord;
varying vec4 v_color;


void main()
{
      float w = 1.0 / u_width;
      float h = 1.0 / u_height;
     
      vec4 n[9];
      n[0] = texture2D(u_texture, v_texCoord + vec2( -w, -h));
      n[1] = texture2D(u_texture, v_texCoord + vec2(0.0, -h));
      n[2] = texture2D(u_texture, v_texCoord + vec2(  w, -h));
      n[3] = texture2D(u_texture, v_texCoord + vec2( -w, 0.0));
      n[4] = texture2D(u_texture, v_texCoord);
      n[5] = texture2D(u_texture, v_texCoord + vec2(  w, 0.0));
      n[6] = texture2D(u_texture, v_texCoord + vec2( -w, h));
      n[7] = texture2D(u_texture, v_texCoord + vec2(0.0, h));
      n[8] = texture2D(u_texture, v_texCoord + vec2(  w, h));
      
      // Sobel Edge
      vec4 sobel_horizEdge = n[2] + (2.0*n[5]) + n[8] - (n[0] + (2.0*n[3]) + n[6]);
      vec4 sobel_vertEdge  = n[0] + (2.0*n[1]) + n[2] - (n[6] + (2.0*n[7]) + n[8]);
      vec3 sobel = sqrt((sobel_horizEdge.rgb * sobel_horizEdge.rgb) + (sobel_vertEdge.rgb * sobel_vertEdge.rgb));
      
      gl_FragColor = vec4( sobel, 1.0 );
}

