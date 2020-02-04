float circleSDF(vec2 st) { return length(st - .5) * 2.; }

#pragma glslify: export(circleSDF)