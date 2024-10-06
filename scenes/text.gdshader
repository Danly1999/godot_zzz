shader_type canvas_item;
uniform sampler2D _MaskTex : repeat_enable;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float noise = pow(texture(_MaskTex,UV*2.0+fract(floor(TIME*3.0)/3.0)).r,6.0);
	vec4 col = texture(TEXTURE,UV+noise*0.005);
	COLOR = col;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
