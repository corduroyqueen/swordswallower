/// @description Insert description here
// You can write your code in this editor

if on {
	var uTime = shader_get_uniform(shader1,"Time");

    shader_set(shader1)
    shader_set_uniform_f(uTime,current_time/10)
	
	draw_set_color(c_white)
	draw_self()
	
	shader_reset()
	
	
	
	mask_index = wall_spr
} else {
	mask_index=noone
}


