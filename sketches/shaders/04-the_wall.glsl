#ifdef GL_ES
precision mediump float; 
#endif

uniform vec2 u_resolution; 

#pragma glslify: coord = require(./utils/coord)
#pragma glslify: stroke = require(./utils/stroke)

void main() {
  vec2 st = coord(gl_FragCoord.xy, u_resolution);
  vec3 color = vec3(0.0);
  color += stroke(st.x, .5, .15);
  gl_FragColor = vec4(color, 1.0);
}