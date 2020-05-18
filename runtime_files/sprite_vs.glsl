#version 330 core

layout(location = 0) in vec2 vi_pos;
layout(location = 1) in vec2 vi_tex;
layout(location = 2) in vec4 vi_color;

uniform mat4 transform;

out vec4 fi_color;
out vec2 fi_tex;

void main() {
	gl_Position = transform * vec4(vi_pos, 0, 1);
	fi_tex = vi_tex;
	fi_color = vi_color;
}
