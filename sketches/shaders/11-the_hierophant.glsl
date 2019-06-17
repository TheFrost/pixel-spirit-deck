#ifdef GL_ES
precision mediump float; 
#endif

uniform vec2 u_resolution; 

#pragma glslify: coord = require(./utils/coord.glsl)
#pragma glslify: rectSDF = require(./utils/rectSDF.glsl)
#pragma glslify: crossSDF = require(./utils/crossSDF.glsl)
#pragma glslify: stroke = require(./utils/stroke.glsl)
#pragma glslify: fill = require(./utils/fill.glsl)

void main() {
  vec3 color = vec3(0.);
  vec2 st = coord(gl_FragCoord.xy, u_resolution);

  float rect = rectSDF(st, vec2(1.));
  color += fill(rect, .5);
  float cross = crossSDF(st, 1.);
  color *= step(.5, fract(cross * 4.));
  color *= step(1., cross);
  color += fill(cross, .5);
  color += stroke(rect, .65, .05);
  color += stroke(rect, .75, .025);

  gl_FragColor = vec4(color, 1.);
}