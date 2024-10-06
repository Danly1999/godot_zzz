shader_type canvas_item;
#include "res://assests/shaders/Functions.gdshaderinc"
uniform sampler2D _MaskTex : repeat_enable;
uniform float _Lerp = 0;
uniform vec4 _OutlineColor : source_color;
varying vec4 vertex_color;   
void vertex() {
	vertex_color = COLOR;
	
}
void fragment() {
	vec2 sceensize = 1.0 / SCREEN_PIXEL_SIZE;
	float iResolution = SCREEN_PIXEL_SIZE.r/SCREEN_PIXEL_SIZE.g;
	vec2 uv = vec2(UV.x,UV.y*iResolution);
	
	vec2 pixel_uv = fract(floor(uv*200.0)/200.0); 
	float mask = texture(_MaskTex,pixel_uv*0.6+vec2(0,TIME*0.05)).r;
	float a = step(length(pixel_uv-0.5)*3.0+_Lerp,mask);
	float b = (step(length(pixel_uv-0.5)*2.8+_Lerp-0.05,mask));
	vec3 outline = (b-a)*_OutlineColor.rgb;

	COLOR = vec4(vertex_color.rgb+outline,b);
	//COLOR = col*vertex_color;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
