/// @description Insert description here
// You can write your code in this editor
if inv_timer>0 {
	inv_timer--	
}
if keyboard_check_pressed(ord("R")) {
	//audio_stop_sound(s_fly_buzz)
}

if death {
	if death_timer< 1 {
		if player_obj.zoom_timer_bool {
			just_blood(player_obj.hsp,player_obj.vsp*2,0.3,10,false,sprite_width/4,sprite_height)
		} else {
			just_blood(tail_obj.hsp,tail_obj.vsp,0.2,10,false,sprite_width/4,sprite_height)	
		}
		audio_stop_sound(s_fly_buzz)
		
		audio_sound_pitch(eye_scream,random_range(0.6,2))
		audio_play_sound_at(eye_scream,x,y,0,0,0,0,false,0)
		
		audio_manager(false,0,false,3)
	}
	if spawn {
		instance_destroy(id)
	} else {
		death_timer++
		x = startx
		y = starty
		hsp = 0
		vsp = 0
		if in_camera_range(x,y) && (player_obj.stinky_check || tail_obj.stinky) {
			death = false
			death_timer=0
		}
		state=state_idle
		sprite_index = noone
		mask_index = eyeidle
	}
	mask_index = fly_idle
} else {
	
mask_index = noone
if player_obj.stinky_check || (tail_obj.stinky && !player_obj.tail_carry) { 
	image_blend = c_blue
} else {
	image_blend = c_white
}

mask_index = fly_idle
if state==state_idle {
	
	//sprite_index = fly_idle
	
	
	
	if distance_to_object(player_obj)<1250 && bound_conditional(within_bound) && in_camera_range(x,y) {
		//sdm(raycast(x,y,player_obj.x,player_obj.y,player_obj,false,true))
		//if raycast(x,y,player_obj.x,player_obj.y,player_obj,false,true)==player_obj.id {
			
		//}
		
		if wall_raycast_checker(player_obj) {
			shriek_bool = true
			
		
			//s_fly_buzz = audio_play_sound(fly_sound,0,true)
			//audio_play_sound_on(fly_emitter,s_fly_buzz,true,0)
			//audio_sound_set_track_position(s_fly_buzz,random_range(0,20))
		}
		
		if shriek_bool {
			shriek_timer++
			if shriek_timer>shriek_timer_m {
				state = state_chasing
				shriek_timer = 0
			
				audio_sound_pitch(chirp,random_range(0.8,1.2))
				audio_play_sound(chirp,0,false)
				chirp = choose(eye_chirp1,eye_chirp2,eye_chirp3)
				targetx = player_obj.x
				targety = player_obj.y
			}
		}
		
		if tail_obj.stinky {
			if wall_raycast_checker(tail_obj) {
				state = state_chasing
				s_fly_buzz = audio_play_sound(fly_sound,0,true)
				//audio_play_sound_on(fly_emitter,s_fly_buzz,true,0)
				//audio_sound_set_track_position(s_fly_buzz,random_range(0,20))
			}
		}
		
		
	}	
	
	
	
}

if state==state_chasing {
	
	
	chirp_timer++
	
	if chirp_timer>chirp_timer_m {
		
		audio_sound_pitch(chirp,random_range(0.7,1.3))
		audio_play_sound_at(
			chirp,
			x,y,0,0,0,0,false,0)
		chirp = choose(eye_chirp1,eye_chirp2,eye_chirp3)
		
		chirp_timer = 0
		chirp_timer_m = random_range(50,100)
		
	}
	
	
	
	
	if !tail_obj.stinky {
		if point_distance(x,y,targetx,targety)<100 {
			hsp = lerp(hsp,0,0.1)
			vsp = lerp(vsp,0,0.1)
			shriek_timer++
			if shriek_timer>shriek_timer_m {
				shriek_timer = 0
			
				audio_sound_pitch(chirp,random_range(0.8,1.2))
				audio_play_sound(chirp,0,false)
				chirp = choose(eye_chirp1,eye_chirp2,eye_chirp3)
				targetx = player_obj.x
				targety = player_obj.y
			}
		} else {
			fly_target_code(1)		
		}
	} else {
		shriek_timer = 0
		fly_target_code(1)	
	}
	
	//move_towards_point(player_obj.x,player_obj.y,h_accel)
	//temp_hs = hsp
	//temp_vs = vsp
	//hsp = temp_hs
	//vsp = temp_vs
	
}

}

if audio_is_playing(s_fly_buzz) {
	audio_stop_sound(s_fly_buzz) 
}	



//audio_emitter_position(fly_emitter,x,y,0)
