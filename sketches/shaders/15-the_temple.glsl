#ifdef GL_ES
precision mediump float; 
#endif

uniform vec2 u_resolution; 

#pragma glslify: coord = require(./utils/coord.glsl)
#pragma glslify: fill = require(./utils/fill.glsl)
#pragma glslify: triSDF = require(./utils/triSDF.glsl)

void main() {
  vec3 color = vec3(0.);
  vec2 st = coord(gl_FragCoord.xy, u_resolution);

  st.y = 1. - st.y;
  vec2 ts = vec2(st.x, .82 - st.y);
  color += fill(triSDF(st), .7);
  color -= fill(triSDF(ts), .36);

  gl_FragColor = vec4(color, 1.);
}