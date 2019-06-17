float rectSDF(vec2 st, vec2 s) {
  st = st * 2. - 1.;
  return max( abs(st.x / s.x), 
              abs(st.y / s.y) );
}

#pragma glslify: export(rectSDF)