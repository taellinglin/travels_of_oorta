shader_type canvas_item;
uniform float scroll_speed;
void fragment(){
	vec2 newuv = UV;
	newuv.x += TIME*scroll_speed;
	vec4 c = texture(TEXTURE, newuv);
	COLOR = c;
}