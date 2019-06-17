/* Main function, uniforms & utils */
#ifdef GL_ES
precision mediump float; 
#endif

uniform vec2 u_resolution; 

#pragma glslify: coord = require(./utils/coord.glsl)
#pragma glslify: rectSDF = require(./utils/rectSDF.glsl)
#pragma glslify: stroke = require(./utils/stroke.glsl)
#pragma glslify: fill = require(./utils/fill.glsl)

void main() {
  vec3 color = vec3(0.);
  vec2 st = coord(gl_FragCoord.xy, u_resolution);

  float sdf = rectSDF(st, vec2(1.));
  color += stroke(sdf, .5, .125);
  color += fill(sdf, .1);

  gl_FragColor = vec4(color, 1.);
}