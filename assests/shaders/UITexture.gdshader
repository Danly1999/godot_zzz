shader_type canvas_item;
uniform sampler2D tex: source_color;
uniform vec4 color: source_color = vec4(1,1,1,1);
varying vec2 uv;
void vertex() {
	// Called for every vertex the material is visible on.
	uv = UV;
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 col = texture(tex,uv);
	col.rgb += clamp(fwidth(col.a)*sin(uv.y*15.0+TIME*5.0)*10.0,0,1);
	COLOR = col;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
