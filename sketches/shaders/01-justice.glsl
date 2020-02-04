precision mediump float;

uniform vec2 u_resolution; 

#pragma glslify: coord = require(./utils/coord)

void main() {
  vec2 st = coord(gl_FragCoord.xy, u_resolution);
  vec3 color = vec3(0.);
  color += step(.5, st.x);
  gl_FragColor = vec4(color, 1.);
}