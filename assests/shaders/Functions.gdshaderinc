float lerp_float(float a, float b, float t)
{
	return ((1.0-t)*a) + (t*b);
}
vec2 lerp_vec2(vec2 a, vec2 b, float t)
{
	return ((1.0-t)*a) + (t*b);
}
vec3 lerp_vec3(vec3 a, vec3 b, float t)
{
	return ((1.0-t)*a) + (t*b);
}
vec4 lerp_vec4(vec4 a, vec4 b, vec4 t)
{
	return ((1.0-t)*a) + (t*b);
}