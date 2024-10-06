shader_type canvas_item;
#include "res://assests/shaders/Functions.gdshaderinc"
uniform vec4 _outline_color : source_color = vec4(1,1,1,1);
uniform float fov : hint_range(0.0, 179.0) = 90;
uniform float _rot_x : hint_range(-360.0, 360.0) = 0.0;
uniform float _rot_y : hint_range(-360.0, 360.0) = 0.0;
uniform sampler2D _MaskTex : repeat_enable;
varying vec4 vertex_color;  
varying vec3 camera_pos;  
varying vec2 offset;  
void vertex() {
	// Called for every vertex the material is visible on.
	vertex_color = COLOR;
	float sin_b = sin(_rot_x/180.0*PI);
	float cos_b = cos(_rot_x/180.0*PI);
	float sin_c = sin(_rot_y/180.0*PI);
	float cos_c = cos(_rot_y/180.0*PI);
	mat3 inv_rot_mat = mat3(
		vec3(cos_b,0.0,-sin_b),
		vec3(sin_b*sin_c,cos_c,cos_b*sin_c),
		vec3(sin_b*cos_c,-sin_c,cos_b*cos_c)
	);
	float t = tan(fov/360.0*PI);
	camera_pos = inv_rot_mat * vec3(UV-0.5,0.5/t);
	float v = (0.5/t)+0.5;
	camera_pos.xy *= v * inv_rot_mat[2].z;
	offset = v * inv_rot_mat[2].xy;
	
}
void fragment() {

	vec2 uv = (camera_pos.xy / camera_pos.z).xy-offset;
	vec4 col = texture(TEXTURE,uv+0.5);
	float mask = texture(_MaskTex,UV*vec2(1,(TEXTURE_PIXEL_SIZE.r/TEXTURE_PIXEL_SIZE.g))*0.5+vec2(0,TIME*0.1)).r;
	float mask_outlight = texture(_MaskTex,uv+0.5).g*0.3;
	float sphere_mask = smoothstep(mask+0.1,mask,max((1.0-length(UV-0.5))*1.6,pow(1.0-UV.y,0.4)*1.5));
	col.rgb = lerp_vec3(col.rgb,_outline_color.rgb,sphere_mask*_outline_color.a)+mask_outlight;
	col.a = step(max(abs(uv.x),abs(uv.y)),0.5);
	COLOR = col;
	//COLOR = col*vertex_color;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
