/* Main function, uniforms & utils */
#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

#pragma glslify: coord = require('./utils/coord')
#pragma glslify: circleSDF = require('./utils/circleSDF')
#pragma glslify: fill = require('./utils/fill')

void main() {
  vec2 st = coord(gl_FragCoord.xy, u_resolution);
  vec3 color = vec3(0.0);
  color += fill(circleSDF(st), 0.65);
  vec2 offset = vec2(.1, .05);
  color -= fill(circleSDF(st - offset), 0.5);
  gl_FragColor = vec4(color, 1.0);
}