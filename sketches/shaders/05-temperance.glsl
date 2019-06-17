#ifdef GL_ES
precision mediump float; 
#endif

uniform vec2 u_resolution; 

#pragma glslify: coord = require(./utils/coord.glsl)
#pragma glslify: stroke = require(./utils/stroke.glsl)

#define st coord(gl_FragCoord.xy, u_resolution)
#define PI 3.141592653589793

void main() {
  vec3 color = vec3(0.0);
  float offset = cos(st.y * PI) * .15;
  color += stroke(st.x, .28 + offset, .1);
  color += stroke(st.x, .5 + offset, .1);
  color += stroke(st.x, .72 + offset, .1);
  gl_FragColor = vec4(color, 1.0);
}