#pragma glslify: circleSDF = require(./circleSDF.glsl)

float versicaSDF(vec2 st, float w) {
  vec2 offset = vec2(w * .5, 0.);
  return max( circleSDF(st - offset), 
              circleSDF(st + offset) );
}

#pragma glslify: export(versicaSDF)