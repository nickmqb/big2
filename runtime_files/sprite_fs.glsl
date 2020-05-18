#version 330 core

in vec4 fi_color;
in vec2 fi_tex;
out vec4 color;

uniform sampler2D sampler;

void main() {
	color = texture(sampler, fi_tex) * fi_color;
}
