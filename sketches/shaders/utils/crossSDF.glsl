#pragma glslify: rectSDF = require(./rectSDF.glsl)

float crossSDF(vec2 st, float s) {
  vec2 size = vec2(.25, s);
  return min( rectSDF(st, size.xy), 
              rectSDF(st, size.yx) );
}

#pragma glslify: export(crossSDF)