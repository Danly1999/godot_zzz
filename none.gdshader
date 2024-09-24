shader_type canvas_item;
uniform float a;
uniform sampler2D image : source_color;
varying vec2 uv;
void vertex() {
	uv = UV;
}

void fragment() {
	vec4 col  = texture(image,uv);
	COLOR = col*a;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
