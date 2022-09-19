#version 450
#include "compiled.inc"
#include "std/gbuffer.glsl"
in vec3 wnormal;
out vec4 fragColor[2];
void main() {
	vec3 n = normalize(wnormal);
	vec3 basecol;
	float roughness;
	float metallic;
	float occlusion;
	float specular;
	float emission;
	float opacity;
	basecol = ((vec3(0.0, 1.0, 0.002472929423674941) * 5.0) + vec3(0.0, 0.0, 0.0));
	roughness = (0.0 * 0.5 + 0.5 * 0.5);
	metallic = (0.0 * 0.5 + 0.0 * 0.5);
	occlusion = (1.0 * 0.5 + 1.0 * 0.5);
	specular = (1.0 * 0.5 + 0.5 * 0.5);
	emission = (1.0 * 0.5 + 0.0 * 0.5);
	opacity = (1.0 * 0.5 + 9.999999747378752e-05 * 0.5) - 0.0002;
	if (opacity < 0.9999) discard;
	n /= (abs(n.x) + abs(n.y) + abs(n.z));
	n.xy = n.z >= 0.0 ? n.xy : octahedronWrap(n.xy);
	uint matid = 0;
	if (emission > 0) { basecol *= emission; matid = 1; }
	fragColor[0] = vec4(n.xy, roughness, packFloatInt16(metallic, matid));
	fragColor[1] = vec4(basecol, packFloat2(occlusion, specular));
}
