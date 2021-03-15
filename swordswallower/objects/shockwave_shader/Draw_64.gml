

//var brightness	= 1 * 2;
//var contrast	= 1 * 5;
//var saturation	= 1 * 5;
var brightness	= 2
var contrast	= 1.2
var saturation	= 1.1
brightness = 1.55
contrast = 1.25
saturation = 1.15
//saturation = 1


// DRAW:
//-----------------------------------------------------------------------------
shader_set(shader_brightness);
	shader_set_uniform_f(u_brightness,	brightness);
	shader_set_uniform_f(u_contrast,	contrast);
	shader_set_uniform_f(u_saturation,	saturation);
	draw_surface(final_surface,0,0)
shader_reset();


with art_surface_setter {
	//if level1_master.in_void && void_black_rect_a<0.03 {
	if other.white_flash_screen {
		draw_rectangle(0,0,1920,1080,false)
		other.white_flash_screen = false
	}
}
//surface_reset_target()
//draw_surface(gif_surface,0,0)