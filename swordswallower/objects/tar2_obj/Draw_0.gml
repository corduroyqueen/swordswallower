/// @description Insert description here
// You can write your code in this editor



var uTime = shader_get_uniform(shader_12combine,"Time");
var uxScale = shader_get_uniform(shader_12combine,"xScale")
var uyScale = shader_get_uniform(shader_12combine,"yScale")
shader_set(shader_12combine)
shader_set_uniform_f(uTime,current_time/1000)
shader_set_uniform_f(uxScale,image_xscale)
shader_set_uniform_f(uyScale,image_yscale)
	
draw_sprite_ext(water_spr,0,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)

shader_reset()
//