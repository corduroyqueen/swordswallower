/// @description Insert description here
// You can write your code in this editor
timer++
if timer<8000 {
	alpha+=0.001
}


var uTime = shader_get_uniform(shader1,"Time");

shader_set(shader1)
shader_set_uniform_f(uTime,current_time/10000)
	
draw_sprite_ext(titlescreenline,0,0,0,1,1,0,c_white,alpha)

shader_reset()



draw_sprite_ext(titlescreentitle,0,0,0,1,1,0,c_white,alpha*2)





if timer>800 {

	var uTime = shader_get_uniform(shader1,"Time");

	if point_distance(x,y,mouse_x,mouse_y)<100 {
		shader_set(shader1)
		shader_set_uniform_f(uTime,current_time/2)
		draw_sprite_ext(titlescreenplay,0,0,0,1,1,0,c_red,1)
		
		if mouse_check_button_pressed(mb_left) {
			audio_stop_sound(she_loves_us)
			room_goto_next()
		}
	} else {
		shader_set(shader1)
		shader_set_uniform_f(uTime,current_time/1)
		draw_sprite_ext(titlescreenplay,0,0,0,1,1,0,c_white,1)	
	}

	shader_reset()
}