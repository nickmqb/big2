#version 330 core

layout(location = 0) in vec2 vi_pos;
layout(location = 1) in vec4 vi_color;

uniform mat4 transform;

out vec4 fi_color;

void main() {
	gl_Position = transform * vec4(vi_pos, 0, 1);	
	float d = min(length(gl_Position.xy), 1);
	float t = cos(d * 3.1415) * -.5 + .5;
	//t = 1;
	vec3 bc = vi_color.rgb * (1.35 - t * 0.35);
	fi_color = vec4(bc, 1);
}
