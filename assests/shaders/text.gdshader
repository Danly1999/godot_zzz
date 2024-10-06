shader_type canvas_item;
uniform sampler2D _MaskTex : repeat_enable;
varying vec4 v_color;
void vertex() {
	v_color = COLOR;
}

void fragment() {
	vec2 main_uv = fract(floor((UV*2.0+fract(floor(TIME*3.0)/3.0))*100.0)/100.0);
	float noise = pow(texture(_MaskTex,main_uv).r,6.0);
	vec4 col = texture(TEXTURE,UV+noise*0.003)*v_color;
	COLOR = col;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
