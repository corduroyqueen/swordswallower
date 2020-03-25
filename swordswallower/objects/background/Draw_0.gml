/// @description Insert description here
// You can write your code in this editor

x = vBaseX + (camera_get_view_x(view_camera[0])/10);
//draw_sprite_ext(sprite43,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

if !player_obj.intro {
	var uTime = shader_get_uniform(shader1,"Time");
		shader_set(shader1)
	    shader_set_uniform_f(uTime,current_time/8000)
		
	draw_sprite_tiled(rock_bkgrd2,image_index,x,y)
	
	shader_reset()
}