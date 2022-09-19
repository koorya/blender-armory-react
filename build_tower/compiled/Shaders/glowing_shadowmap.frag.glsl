#version 450
void main() {
	float opacity;
	opacity = (1.0 * 0.5 + 9.999999747378752e-05 * 0.5) - 0.0002;
	if (opacity < 1.0) discard;
}
