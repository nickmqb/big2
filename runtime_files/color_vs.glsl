#version 330 core

layout(location = 0) in vec2 vi_pos;
layout(location = 1) in vec4 vi_color;

uniform mat4 transform;

out vec4 fi_color;

void main() {
	gl_Position = transform * vec4(vi_pos, 0, 1);
	fi_color = vi_color;
}
