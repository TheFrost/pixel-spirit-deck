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

#pragma glslify: export(coord)