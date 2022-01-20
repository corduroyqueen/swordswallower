sword_pull_check()
//player_obj.tail_carry = true
//player_obj.bounced = false
player_obj.x = player_obj.tail_dest_x
player_obj.y = player_obj.tail_dest_y
//audio_play_sound(grab1,0,false)
			
			//sdm("hall")
//reset_intangibility()

if !player_obj.k_dash
|| current_obj.object_index==impale_circle_obj
|| current_obj.object_index==impale_circle_moving_obj
|| current_obj.object_index==skyswitcher_obj 
|| place_meeting(x,y,ghost_obj) 
|| current_obj.object_index==hummingbird_obj
|| current_obj.object_index==hum_food_obj
|| current_obj.object_index==circle_friend_obj {
	player_obj.zoom_timer_bool = false
	player_obj.zoom_timer = 0
	player_obj.bounced = false
	player_obj.zoom_ctdn = 0
	player_obj.held_position_ready = false
	
	//sdm("ok")
	player_obj.hsp *= 0.9
	player_obj.vsp *= 0.9
	out_of_dash_t=10
	player_obj.hsp = clamp(player_obj.hsp,-25,25)
	player_obj.vsp = clamp(player_obj.vsp,-25,25)
	player_sprite_obj.sword_ang = point_direction(0,0,player_obj.hsp,player_obj.vsp)+90
	if place_meeting(x,y,hum_food_obj) {
		current_obj.death = true
	}
	if current_obj.object_index==circle_friend_obj {
		current_obj.active = false
	}
	if player_hitbox_check_obj.down_wall && abs(player_hitbox_check_obj.y-player_obj.y)<8 {
		hsp*=0.2
	}
	
	
} 
else if current_obj.object_index!=impale_circle_obj 
&& current_obj.object_index!=impale_circle_moving_obj 
&& current_obj.object_index!=hummingbird_obj 
&& current_obj.object_index!=hum_food_obj 
&& current_obj.object_index!=door_obj
&& current_obj.object_index!=circle_friend_obj//if point_distance(player_obj.start_throw_x,player_obj.start_throw_y,player_obj.tail_dest_x,player_obj.tail_dest_y)>50 || player_obj.gem_active 
{
	held_pos_x = player_obj.x-x
	held_pos_y = player_obj.y-y
	
	held_pos_ang = image_angle
	
	player_obj.held_position_ready = true	
	player_obj.held_position = true
	player_obj.held_start_hsp = player_obj.hsp
	player_obj.held_start_vsp = player_obj.vsp
	player_obj.held_position_start= true
	
	player_obj.shake_d=13.5
	player_obj.camera_shake_d = true
	//duck_audio_script(0.1,100)
	
	//audio_sound_gain(swsw1,0,0)
	//audio_sound_gain(swsw1,1,200)
	
	player_obj.camera_shake_direc = true
	player_obj.cam_ang = degtorad(point_direction(0,0,player_obj.hsp,player_obj.vsp))
	player_obj.shake_dir = 55

	shockwave_shader.trigger = true
	shockwave_shader.strength_input = 0.1
	
	wall_particle_tail_script(player_obj.held_start_hsp,player_obj.held_start_vsp,0.2,5,true,1,1,rubble_s1)
	player_obj.hsp = 0
	player_obj.vsp = 0
	player_obj.check_zoom_collision = true
	player_obj.held_bounce_timer=0
	
	//var okd = swsw_dash_impact
	audio_play_sound(swsw_dash_impact,0,false)
	audio_sound_gain(swsw_dash_impact,0.4,0)
	
	
	audio_sound_pitch(hit_wall,random_range(1.2,1.4))
	audio_play_sound(hit_wall,0,false)	
	
	//var k = Emergency_Sandbag_Heavy_Hitting_Rocks_02
	//audio_sound_pitch(k,random_range(1.8,2.2))
	//audio_sound_gain(k,0.3,0)
	//audio_play_sound(k,0,false)	
	
	
	//audio_manager(gsound.s_sword_hit_metal_wall,0,false,0)
	var cx = player_obj.camx + player_obj.cam_width_h
	var cy = player_obj.camy + player_obj.cam_height_h
	
	//mean(cx,cx + cx - tail_obj.x),
	//mean(cy,cy + cy - tail_obj.y),
		
	audio_sound_pitch(Emergency_Sandbag_Heavy_Hitting_Rocks_02,random_range(0.9,1.1))
	//audio_manager(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false,0)
	audio_play_sound_at(Emergency_Sandbag_Heavy_Hitting_Rocks_02,
		mean(cx,cx,cx,cx,cx,cx,tail_obj.x),
		mean(cy,cy,cy,cy,cy,cy,tail_obj.y),
		10,100,300,1,false,0)
	
	var ello = impact_3
	audio_sound_gain(ello,0.5,0)
	audio_sound_pitch(ello,random_range(0.9,1.1))
	//audio_manager(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false,0)
	audio_play_sound(ello,0,false)
		
	audio_manager(clink1mp332,0,false,0)
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