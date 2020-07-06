/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(ord("T")) {
	audio_stop_sound(s_fly_buzz)
}
if death {
	if death_timer< 1 {
		just_blood(tail_obj.hspeed,tail_obj.vspeed,0.2,30,false,sprite_width/4,sprite_height)
		audio_stop_sound(s_fly_buzz)
		audio_manager(false,0,false,3)
	}
	death_timer++
	x = startx
	y = starty
	hspeed = 0
		vspeed = 0
	if in_camera_range(x,y) && (player_obj.stinky_check || tail_obj.stinky) {
		death = false
		death_timer=0
	}
	state=state_idle
	//image_blend = c_purple
	sprite_index = noone
	mask_index = fly_idle
} else {
	
mask_index = noone
	
if player_obj.stinky_check || (tail_obj.stinky && !player_obj.tail_carry) { 
	image_blend = c_blue
} else {
	image_blend = c_white
}


//audio_emitter_position(fly_emitter,x,y,0)
if state==state_idle {
	
	sprite_index = fly_idle
	image_speed = 0.7
	
	
	
	if distance_to_object(player_obj)<750 && bound_conditional(within_bound) {
		//sdm(raycast(x,y,player_obj.x,player_obj.y,player_obj,false,true))
		//if raycast(x,y,player_obj.x,player_obj.y,player_obj,false,true)==player_obj.id {
			
		//}
		
		if wall_raycast_checker(player_obj) {
			state = state_chasing
			s_fly_buzz = audio_play_sound(fly_sound,0,true)
			audio_play_sound_on(fly_emitter,s_fly_buzz,true,0)
			audio_sound_set_track_position(s_fly_buzz,random_range(0,20))
		}
		if tail_obj.stinky {
			if wall_raycast_checker(tail_obj) {
				state = state_chasing
				s_fly_buzz = audio_play_sound(fly_sound,0,true)
				audio_play_sound_on(fly_emitter,s_fly_buzz,true,0)
				audio_sound_set_track_position(s_fly_buzz,random_range(0,20))
			}
		}
	}	
	
	
	
}

if state==state_chasing {
	
	
	
	sprite_index = fly_flap
	image_speed = 1.2
	
	//if tail_obj.stinky {
	//	if tail_obj.planted {
	//		move_towards_point(player_obj.x,player_obj.y,h_accel*4)
	//	} else {
	//		move_towards_point(player_obj.x,player_obj.y,h_accel*0.8)
	//	}
	//} else {
	//	move_towards_point(player_obj.x,player_obj.y,h_accel)
	//}
	
	fly_target_code(1)
	image_xscale = sign(x-target.x)
	
	
	
	//temp_hs = hspeed
	//temp_vs = vspeed
	//hspeed = temp_hs
	//vspeed = temp_vs
	
}



}

if audio_is_playing(s_fly_buzz) {
	audio_stop_sound(s_fly_buzz) 
}	


