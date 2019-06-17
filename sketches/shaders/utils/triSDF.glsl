float triSDF(vec2 st) {
  st = (st * 2. - 1.) * 2.;
  return max( abs(st.x) * 0.866025 + st.y * .5, -st.y * .5 );
}

#pragma glslify: export(triSDF)