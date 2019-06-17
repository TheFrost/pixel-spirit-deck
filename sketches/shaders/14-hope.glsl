#ifdef GL_ES
precision mediump float; 
#endif

uniform vec2 u_resolution; 

#pragma glslify: coord = require(./utils/coord.glsl)
#pragma glslify: flip = require(./utils/flip.glsl)
#pragma glslify: fill = require(./utils/fill.glsl)
#pragma glslify: versicaSDF = require(./utils/versicaSDF.glsl)

void main() {
  vec3 color = vec3(0.);
  vec2 st = coord(gl_FragCoord.xy, u_resolution);

  float sdf = versicaSDF(st, .2);
  color += flip( fill(sdf, .5), step((st.x + st.y) * .5, .5) );

  gl_FragColor = vec4(color, 1.);
}