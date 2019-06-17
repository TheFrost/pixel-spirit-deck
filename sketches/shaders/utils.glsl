/* Coordinate and unit utils */
vec2 coord(in vec2 p, in vec2 u_resolution) {
  p = p / u_resolution.xy;
  // correct aspect ratio
  if (u_resolution.x > u_resolution.y) {
    p.x *= u_resolution.x / u_resolution.y;
    p.x += (u_resolution.y - u_resolution.x) / u_resolution.y / 2.0;
  } else {
    p.y *= u_resolution.y / u_resolution.x;
    p.y += (u_resolution.x - u_resolution.y) / u_resolution.x / 2.0;
  }
  return p;
}

float stroke(float x, float s, float w) {
  float d = step(s, x + w * .5) - step(s, x - w * .5);
  return clamp(d, 0., 1.);
}

float circleSDF(vec2 st) {
  return length(st - .5) * 2.;
}

#pragma glslify: export(coord)
#pragma glslify: export(circleSDF)
#pragma glslify: export(stroke)