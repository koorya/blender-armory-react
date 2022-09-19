#version 450
uniform sampler2DShadow shadowMap;
#include "compiled.inc"
#include "std/light.glsl"
#include "std/shadows.glsl"
in vec3 wnormal;
in vec3 eyeDir;
in vec3 wposition;
out vec4 fragColor[2];
uniform float envmapStrength;
uniform vec3 sunCol;
uniform vec3 sunDir;
uniform bool receiveShadow;
uniform float shadowsBias;
uniform vec3 eye;
void main() {
	vec3 n = normalize(wnormal);
	vec3 vVec = normalize(eyeDir);
	float dotNV = max(dot(n, vVec), 0.0);
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
	if (opacity == 1.0) discard;
	vec3 albedo = surfaceAlbedo(basecol, metallic);
	vec3 f0 = surfaceF0(basecol, metallic);
	vec3 indirect = albedo;
	indirect *= occlusion;
	indirect *= envmapStrength;
	vec3 direct = vec3(0.0);
	float svisibility = 1.0;
	vec3 sh = normalize(vVec + sunDir);
	float sdotNL = dot(n, sunDir);
	float sdotNH = dot(n, sh);
	float sdotVH = dot(vVec, sh);
	if (receiveShadow) {
	svisibility = shadowTestCascade(shadowMap, eye, wposition + n * shadowsBias * 10, shadowsBias);
	}
	direct += (lambertDiffuseBRDF(albedo, sdotNL) + specularBRDF(f0, roughness, sdotNL, sdotNH, dotNV, sdotVH) * specular) * sunCol * svisibility;
	if (emission > 0.0) {
	    direct = vec3(0.0);
	    indirect += basecol * emission;
	}	

	vec4 premultipliedReflect = vec4(vec3(direct + indirect * 0.5) * opacity, opacity);
	float w = clamp(pow(min(1.0, premultipliedReflect.a * 10.0) + 0.01, 3.0) * 1e8 * pow(1.0 - (gl_FragCoord.z) * 0.9, 3.0), 1e-2, 3e3);
	fragColor[0] = vec4(premultipliedReflect.rgb * w, premultipliedReflect.a);
	fragColor[1] = vec4(premultipliedReflect.a * w, 0.0, 0.0, 1.0);
}
