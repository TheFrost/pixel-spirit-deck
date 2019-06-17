#ifdef GL_ES
precision mediump float; 
#endif

uniform vec2 u_resolution; 

#pragma glslify: coord = require(./utils/coord.glsl)
#pragma glslify: circleSDF = require(./utils/circleSDF.glsl)
#pragma glslify: flip = require(./utils/flip.glsl)
#pragma glslify: stroke = require(./utils/stroke.glsl)
#pragma glslify: fill = require(./utils/fill.glsl)

void main() {
  vec3 color = vec3(0.);
  vec2 st = coord(gl_FragCoord.xy, u_resolution);

  vec2 offset = vec2(.15, .0);
  float left = circleSDF(st + offset);
  float right = circleSDF(st - offset);
  color += flip( stroke(left, .5, .05),
                 fill(right, .525) );

  gl_FragColor = vec4(color, 1.);
}