player_obj.tail_planted = false
player_obj.tail_pulling = true
//player_obj.tail_carry = true
//player_obj.bounced = false
player_obj.x = player_obj.tail_dest_x
player_obj.y = player_obj.tail_dest_y
//audio_play_sound(grab1,0,false)
			
			
reset_intangibility()

if !mouse_check_button(mb_right) 
|| current_wall.object_index==impale_circle_obj
|| current_wall.object_index==skyswitcher_obj 
|| place_meeting(x,y,ghost_obj) 
|| current_wall.object_index==hummingbird_obj
|| current_wall.object_index==circle_friend_obj {
	player_obj.zoom_timer_bool = false
	player_obj.zoom_timer = 0
	player_obj.bounced = false
	player_obj.zoom_ctdn = 0
	player_obj.held_position_ready = false
	
	
	if place_meeting(x,y,impale_circle_obj) || place_meeting(x,y,ghost_obj) || place_meeting(x,y,hummingbird_obj)|| place_meeting(x,y,circle_friend_obj) {
		player_obj.hspeed *= 0.6
		player_obj.vspeed *= 0.6
		player_obj.hspeed = clamp(player_obj.hspeed,-17,17)
		player_obj.vspeed = clamp(player_obj.vspeed,-17,17)
		if current_wall.object_index==circle_friend_obj {
			current_wall.active = false
		}
	}
	if player_hitbox_check_obj.down_wall && abs(player_hitbox_check_obj.y-player_obj.y)<5 {
		hspeed*=0.2
	}
	
	
} 
else if current_wall.object_index!=impale_circle_obj 
&& current_wall.object_index!=hummingbird_obj 
&& current_wall.object_index!=door_obj
&& current_wall.object_index!=circle_friend_obj//if point_distance(player_obj.start_throw_x,player_obj.start_throw_y,player_obj.tail_dest_x,player_obj.tail_dest_y)>50 || player_obj.gem_active 
{
	player_obj.held_position_ready = true	
	player_obj.held_position = true
	player_obj.held_start_hspeed = player_obj.hspeed
	player_obj.held_start_vspeed = player_obj.vspeed
	
	player_obj.shake_d=9
	player_obj.camera_shake_d = true
	
	
	player_obj.camera_shake_direc = true
	player_obj.cam_ang = degtorad(point_direction(0,0,player_obj.hspeed,player_obj.vspeed))
	player_obj.shake_dir = 35

	shockwave_shader.trigger = true
	wall_particle_script(player_obj.held_start_hspeed,player_obj.held_start_vspeed,0.2,5,true,1,1,c_gray)
	player_obj.hspeed = 0
	player_obj.vspeed = 0
	player_obj.check_zoom_collision = true
	player_obj.held_bounce_timer=0
	audio_sound_pitch(hit_wall,1)
	audio_play_sound(hit_wall,0,false)	
	
	//var dwa = audio_sound_gain(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0.2,0)
	//audio_manager(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false,0)
	//audio_play_sound(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false)
	//audio_sound_pitch(Emergency_Sandbag_Heavy_Hitting_Rocks_02,random_range(0.94,1.06))
	//audio_play_sound(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false)
	
}