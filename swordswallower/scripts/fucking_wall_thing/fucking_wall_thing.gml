player_obj.tail_planted = false
player_obj.tail_pulling = true
//player_obj.tail_carry = true
//player_obj.bounced = false
player_obj.x = player_obj.tail_dest_x
player_obj.y = player_obj.tail_dest_y
//audio_play_sound(grab1,0,false)
			
			
reset_intangibility()

if !player_obj.k_dash
|| current_wall.object_index==impale_circle_obj
|| current_wall.object_index==impale_circle_moving_obj
|| current_wall.object_index==skyswitcher_obj 
|| place_meeting(x,y,ghost_obj) 
|| current_wall.object_index==hummingbird_obj
|| current_wall.object_index==hum_food_obj
|| current_wall.object_index==circle_friend_obj {
	player_obj.zoom_timer_bool = false
	player_obj.zoom_timer = 0
	player_obj.bounced = false
	player_obj.zoom_ctdn = 0
	player_obj.held_position_ready = false
	
	//sdm("ok")
	if place_meeting(x,y,impale_circle_obj) ||
	place_meeting(x,y,impale_circle_moving_obj) ||
	place_meeting(x,y,ghost_obj) || 
	place_meeting(x,y,hummingbird_obj)|| 
	place_meeting(x,y,hum_food_obj)|| 
	place_meeting(x,y,circle_friend_obj) {
		//sdm("lellll")
		player_obj.hspeed *= 0.65
		player_obj.vspeed *= 0.65
		out_of_dash_t=10
		player_obj.hspeed = clamp(player_obj.hspeed,-25,25)
		player_obj.vspeed = clamp(player_obj.vspeed,-25,25)
		if place_meeting(x,y,hum_food_obj) {
			current_wall.death = true
		}
		if current_wall.object_index==circle_friend_obj {
			current_wall.active = false
		}
	}
	if player_hitbox_check_obj.down_wall && abs(player_hitbox_check_obj.y-player_obj.y)<8 {
		hspeed*=0.2
	}
	
	
} 
else if current_wall.object_index!=impale_circle_obj 
&& current_wall.object_index!=impale_circle_moving_obj 
&& current_wall.object_index!=hummingbird_obj 
&& current_wall.object_index!=hum_food_obj 
&& current_wall.object_index!=door_obj
&& current_wall.object_index!=circle_friend_obj//if point_distance(player_obj.start_throw_x,player_obj.start_throw_y,player_obj.tail_dest_x,player_obj.tail_dest_y)>50 || player_obj.gem_active 
{
	held_pos_x = x
	held_pos_y = y
	held_pos_ang = image_angle
	
	player_obj.held_position_ready = true	
	player_obj.held_position = true
	player_obj.held_start_hspeed = player_obj.hspeed
	player_obj.held_start_vspeed = player_obj.vspeed
	
	player_obj.shake_d=13.5
	player_obj.camera_shake_d = true
	//duck_audio_script(0.1,100)
	
	//audio_sound_gain(swsw1,0,0)
	//audio_sound_gain(swsw1,1,200)
	
	player_obj.camera_shake_direc = true
	player_obj.cam_ang = degtorad(point_direction(0,0,player_obj.hspeed,player_obj.vspeed))
	player_obj.shake_dir = 35

	shockwave_shader.trigger = true
	shockwave_shader.strength_input = 0.1
	
	wall_particle_script(player_obj.held_start_hspeed,player_obj.held_start_vspeed,0.2,5,true,1,1,rubble_s1)
	player_obj.hspeed = 0
	player_obj.vspeed = 0
	player_obj.check_zoom_collision = true
	player_obj.held_bounce_timer=0
	
	
	
	audio_sound_pitch(hit_wall,random_range(0.9,1.1))
	audio_play_sound(hit_wall,0,false)	
	
	var k = Emergency_Sandbag_Heavy_Hitting_Rocks_02
	audio_sound_pitch(k,random_range(1.8,2.2))
	audio_sound_gain(k,0.3,0)
	audio_play_sound(k,0,false)	
	
	//audio_play_sound(sword_thud_1,0,false)	
	
	//audio_sound_pitch(rock_crunch,random_range(0.9,1.1))
	
	//audio_play_sound_at(rock_crunch,
	//	mean(player_obj.x,player_obj.x - (tail_obj.x-player_obj.x)),
	//	mean(player_obj.y,player_obj.y - (tail_obj.y-player_obj.y)),
	//	0,0,0,0,false,0)
		
	
	//audio_manager(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false,0)
	//var dwa = audio_sound_gain(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0.2,0)
	//audio_manager(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false,0)
	//audio_play_sound(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false)
	//audio_sound_pitch(Emergency_Sandbag_Heavy_Hitting_Rocks_02,random_range(0.94,1.06))
	//audio_play_sound(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false)
	
}