float fill(float x, float size) {
  return 1. - step(size, x);
}

#pragma glslify: export(fill)