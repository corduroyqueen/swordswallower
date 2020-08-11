/// @description Insert description here
// You can write your code in this editor
if !other.intangible {
		
	
	if other!=tail_obj.current_wall {
		held_position_ready = false	
		held_position = false
		
	}
	
	tail_obj.current_obj = false
	
	if zoom_timer_bool {
		
	}
	
	
	if point_distance(x,y,start_throw_x,start_throw_y) > 10 {
		//if bounce_buff_timer>0 && 
		
		if !bounced && !other.intangible && (tail_pulling || tail_carry) && !grounded {
			default_collision_nospeed(other)
			audio_sound_pitch(hit_wall,5)
	audio_play_sound(hit_wall,0,false)	
			bounce()
			check_zoom_collision = true
			
		} else if boosting_collision_check == true && mouse_check_button(mb_right) && !check_zoom_collision && held_position_ready && point_distance(start_throw_x,start_throw_y,tail_dest_x,tail_dest_y)>50 {
			
		
			default_collision_nospeed(other)
			held_start_hspeed = hsp
			held_start_vspeed = vsp
			held_position = true
			check_zoom_collision = true
			held_bounce_timer=6
			x = player_hitbox_check_obj.x
			y = player_hitbox_check_obj.y
		} 
	
	}
	
	bounce_buff_timer = 0
	boosting_collision_check = false
	
	
	
	if !check_zoom_collision {
		default_collision(other)
	}
	
	check_zoom_collision = false
	
} else {
	
	
	
}
	
//sdm(other.intangible)