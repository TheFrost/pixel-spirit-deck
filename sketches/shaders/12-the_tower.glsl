#ifdef GL_ES
precision mediump float; 
#endif

uniform vec2 u_resolution; 

#pragma glslify: coord = require(./utils/coord.glsl)
#pragma glslify: rectSDF = require(./utils/rectSDF.glsl)
#pragma glslify: stroke = require(./utils/stroke.glsl)
#pragma glslify: fill = require(./utils/fill.glsl)
#pragma glslify: flip = require(./utils/flip.glsl)

void main() {
  vec3 color = vec3(0.);
  vec2 st = coord(gl_FragCoord.xy, u_resolution);

  float rect = rectSDF(st, vec2(.5, 1.));
  float diag = (st.x + st.y) * .5;
  color += flip( fill(rect, .6),
                 stroke(diag, .5, .01) );

  gl_FragColor = vec4(color, 1.);
}