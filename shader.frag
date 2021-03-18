#version 450

layout(location=0) in  vec3 pos;
layout(location=1) in vec2 tex;
layout(location=0) out vec4 col;


layout(binding=0) uniform sampler2D diffuse;

void main() {
  col = texture(diffuse,tex);
}