/* Main function, uniforms & utils */
#ifdef GL_ES
precision mediump float; 
#endif

uniform vec2 u_resolution; 

#pragma glslify: coord = require(./utils.glsl)
#pragma glslify: stroke = require(./utils.glsl)

#define st coord(gl_FragCoord.xy, u_resolution)

void main() {
  vec3 color = vec3(0.0);
  float sdf = .5 + (st.x - st.y) * .5;
  color += stroke(sdf, .5, .1);
  float sdf_inv = (st.x + st.y) * .5;
  color += stroke(sdf_inv, .5, .1);
  gl_FragColor = vec4(color, 1.0);
}