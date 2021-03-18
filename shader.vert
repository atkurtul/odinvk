#version 450


layout(location=0) in vec2 pos;
layout(location=0) out vec3 col;
layout(location=1) out vec2 tex;

vec3 colors[4] = vec3[](
  vec3(1.0, 0.0, 0.0),
  vec3(0.0, 1.0, 0.0),
  vec3(0.0, 0.0, 1.0),
  vec3(0.5, 0.4, 0.5)
);

vec2 textures[4] = vec2[](
  vec2(0, 0),
  vec2(0, 1),
  vec2(1, 0),
  vec2(1, 1)
);

const vec2 scale = vec2(4.0/3.0, 1);

void main() {
  gl_Position = vec4(pos * scale, 0.0, 1.0);
  tex = textures[gl_VertexIndex];
  col = colors[gl_VertexIndex];
}