/* Main function, uniforms & utils */
#ifdef GL_ES
precision mediump float; 
#endif

uniform vec2 u_resolution; 

#pragma glslify: coord = require(./utils/coord)

#define PI 3.141592653589793

void main() {
  vec2 st = coord(gl_FragCoord.xy, u_resolution);
  vec3 color = vec3(0.0);
  color += step(0.5 + cos(st.y * PI) * 0.25, st.x);
  gl_FragColor = vec4(color, 1.0);
}