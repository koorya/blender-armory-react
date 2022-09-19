#version 450
#include "compiled.inc"
in vec3 normal;
out vec4 fragColor;
void main() {
	vec3 n = normalize(normal);
	fragColor.rgb = vec3(0.4572368264198303, 0.4841877818107605, 0.5704755783081055);
	fragColor.a = 0.0;
}
