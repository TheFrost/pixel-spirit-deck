#ifdef GL_ES
precision mediump float; 
#endif

uniform vec2 u_resolution; 

#pragma glslify: coord = require(./utils/coord.glsl)
#pragma glslify: stroke = require(./utils/stroke.glsl)
#pragma glslify: circleSDF = require(./utils/circleSDF.glsl)

void main() {
  vec3 color = vec3(0.);
  vec2 st = coord(gl_FragCoord.xy, u_resolution);
  color += stroke(circleSDF(st), .5, .05);
  gl_FragColor = vec4(color, 1.);
}