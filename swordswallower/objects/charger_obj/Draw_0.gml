/// @description Insert description here
// You can write your code in this editor
depth = -500
if state==state_knockback {
	
	sprite_index = cow2_knockback
	draw_sprite_ext(sprite_index,image_index,x+random_range(-5,5),y+random_range(-2,2),image_xscale,1,0,c_white,1)
	loltimer++
	if loltimer>1 {
		loltimer=0	
	}
	image_alpha = 1
	return
} 


var uTime = shader_get_uniform(shader_cow,"Time");

shader_set(shader_cow)
shader_set_uniform_f(uTime,current_time/400)

var ta
if state==state_idle {
	ta = fade_in_a
} else {
	ta = alpha_spr	
}


if charging && state==state_chasing {
	sprite_index = cow2_charging
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,1,0,c_white,ta)
} else if !charging && state==state_chasing {
	sprite_index = cow2_revving
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,1,0,c_white,ta)
} else { 
	sprite_index = cow2_idle
	image_alpha = ta
	draw_self()
	loltimer=0
}



shader_reset()