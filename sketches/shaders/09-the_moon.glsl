/* Main function, uniforms & utils */
#ifdef GL_ES
precision mediump float; 
#endif

uniform vec2 u_resolution; 

#pragma glslify: coord = require(./utils/coord.glsl)
#pragma glslify: circleSDF = require(./utils/circleSDF.glsl)
#pragma glslify: fill = require(./utils/fill.glsl)

void main() {
  vec3 color = vec3(0.);
  vec2 st = coord(gl_FragCoord.xy, u_resolution);

  color += fill(circleSDF(st), .65);
  vec2 offset = vec2(.1, .05);
  color -= fill(circleSDF(st - offset), .5);

  gl_FragColor = vec4(color, 1.);
}