/// @description Insert description here
// You can write your code in this editor
if keyboard_check_pressed(ord("R")) {
	audio_stop_sound(s_fly_buzz)
}
if death {
	

	if death_timer< 1 {
		just_blood(tail_obj.hspeed,tail_obj.vspeed,0.2,30,false,sprite_width/4,sprite_height)audio_stop_sound(s_fly_buzz)
		audio_manager(false,0,false,3)
	
	
		if place_meeting(x,y,player_obj) {
			startx = player_obj.x
			starty = player_obj.y
			endx = player_obj.tail_dest_x
			endy = player_obj.tail_dest_y
		} else {
			startx = player_obj.start_throw_x
			starty = player_obj.start_throw_y
			endx = x
			endy = y
		}
	
		ang = arctan((starty-endy)/(startx-endx))
		tempx = cos(ang) * sign(endx-startx)
		tempy = sin(ang)  * sign(startx-endx)

		fly1 = instance_create_depth(x,y,depth,flyfree_obj)
		fly2 = instance_create_depth(x,y,depth,flyfree_obj)
	
		fly1.hspeed = tempy * 7
		fly1.vspeed = tempx * 7
		fly1.inv_timer=20
		fly1.state = 1
		fly1.spawn = true
	
		fly2.hspeed = -tempy * 7
		fly2.vspeed = -tempx * 7
		fly2.inv_timer=20
		fly2.state = 1
		fly2.spawn = true
		death_timer++
	}
	if instance_exists(fly1) || instance_exists(fly2) {
		x = -10000
		y = -10000
	} else {
		death_timer++
	
		x = startpx
		y = startpy
		hspeed = 0
		vspeed = 0
		if in_camera_range(x,y) && (player_obj.stinky_check || tail_obj.stinky) {
			death = false
			death_timer=0
		}
		image_blend = c_purple
		state=state_idle
	}
	mask_index = doublefly_flap
} else {
	
mask_index = noone
if player_obj.stinky_check || (tail_obj.stinky && !player_obj.tail_carry) { 
	image_blend = c_blue
} else {
	image_blend = c_white
}


if state==state_idle {
	
	sprite_index = fly_idle
	image_speed = 0.7
	
	
	
	if distance_to_object(player_obj)<detect_range && bound_conditional(within_bound)  {
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
	
	
	
	sprite_index = doublefly_flap
	image_speed = 1.2
	
	
	fly_target_code(2)
	image_xscale = sign(x-target.x)
	//temp_hs = hspeed
	//temp_vs = vspeed
	//hspeed = temp_hs
	//vspeed = temp_vs
	
}

}

audio_emitter_position(fly_emitter,x,y,0)
