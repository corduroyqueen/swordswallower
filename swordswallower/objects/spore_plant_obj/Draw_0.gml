/// @description Insert description here
// You can write your code in this editor
if state==state_preparing {
	//image_blend = c_blue
	
	if shoot_timer_t>shoot_timer_t_m-50 {
		if shoot_timer_t<=shoot_timer_t_m-49 {
			bounce_vel = 0.1
		}
		if floor(shoot_timer_t)==shoot_timer_t_m-25 {
			bounce_vel = 0.3
		}
		if floor(shoot_timer_t)==shoot_timer_t_m-10 {
			bounce_vel = 0.6
		}
		
		
		bounce_vel += (rval-sprite_scale_x)
		bounce_vel *= 0.9

		sprite_scale_x += bounce_vel
		sprite_scale_y = rval+(rval-sprite_scale_x)
	
	} else {
		sprite_scale_x = lerp(sprite_scale_x,1,0.1)	
		sprite_scale_y = lerp(sprite_scale_y,1,0.1)	
	}
	
} else {
	image_blend = c_white	
}


draw_sprite_ext(sprite_index,0,x,y,sprite_scale_x,sprite_scale_y,image_angle,c_white,1)