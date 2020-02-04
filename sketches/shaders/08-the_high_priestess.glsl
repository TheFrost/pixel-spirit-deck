/* Main function, uniforms & utils */
#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

#pragma glslify: coord = require('./utils/coord')
#pragma glslify: stroke = require('./utils/stroke')
#pragma glslify: circleSDF = require('./utils/circleSDF')

void main() {
  vec2 st = coord(gl_FragCoord.xy, u_resolution);
  vec3 color = vec3(0.0);
  color += stroke(circleSDF(st), .5, .05);
  gl_FragColor = vec4(color, 1.0);
}