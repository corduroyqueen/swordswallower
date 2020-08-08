/// @description Insert description here
// You can write your code in this editor


if death {
	just_blood(tail_obj.hsp,tail_obj.vsp,0.2,30,false,sprite_width/4,sprite_height)
	audio_stop_sound(s_fly_buzz)
	audio_manager(false,0,false,3)
	instance_destroy()
} else {


if state=state_idle {
	
	
	image_speed = 0.7
	
	
	
	if distance_to_object(player_obj)<750 {
		//sdm(raycast(x,y,player_obj.x,player_obj.y,player_obj,false,true))
		//if raycast(x,y,player_obj.x,player_obj.y,player_obj,false,true)==player_obj.id {
			
		//}
		
		if collision_line(x,y,player_obj.x,player_obj.y,wall_obj,false,true)==noone 
		&& collision_line(x,y,player_obj.x,player_obj.y,door_obj,false,true)==noone 
		&& collision_line(x,y,player_obj.x,player_obj.y,break_wall_obj,false,true)==noone {
			state = state_chasing
			s_fly_buzz = audio_play_sound(fly_sound,0,true)
			audio_play_sound_on(fly_emitter,s_fly_buzz,true,0)
			audio_sound_set_track_position(s_fly_buzz,random_range(0,20))
		}
		
		
	}	
	
	
	
}

if state==state_chasing {
	
	
	
	
	image_speed = 1.2
	
	move_towards_point(player_obj.x,player_obj.y,h_accel)
	//temp_hs = hsp
	//temp_vs = vsp
	//hsp = temp_hs
	//vsp = temp_vs
	
}

}

audio_emitter_position(fly_emitter,x,y,0)
