#ifndef _COMPILED_GLSL_
#define _COMPILED_GLSL_
#define _Deferred
#define _ShadowMap
#define _CSM
#define _Sun
#define _SMAA
#define _SSAO
#define _Emission
#define _CToneFilmic
#if defined(HLSL) || defined(METAL)
#define _InvY
#endif
#define _FlipY
const float PI = 3.1415926535;
const float PI2 = PI * 2.0;
const vec2 shadowmapSize = vec2(1024, 1024);
const float shadowmapCubePcfSize = 0.001;
const int shadowmapCascades = 4;
const float ssaoRadius = 1.0;
const float ssaoStrength = 1.0;
const float ssaoScale = 20.0;
const float bloomThreshold = 0.8;
const float bloomStrength = 4.3;
const float bloomRadius = 4.0;
const int skinMaxBones = 8;

#endif // _COMPILED_GLSL_
