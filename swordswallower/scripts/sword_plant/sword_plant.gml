local_obj = argument0


get_angle(local_obj)

wall_particle_tail_script(hsp/2,vsp/2,0.2,5,true,2,2,rubble_s1)
		
planted=true	
hilt_x = x+cos(degtorad(tail_obj.image_angle+270)) * 66
hilt_y = y-sin(degtorad(tail_obj.image_angle+270)) * 66

with player_hitbox_check_obj {
	event_user(1)
}
		
player_obj.shake_d=10
player_obj.camera_shake_d = true

player_obj.tail_dest_x = player_hitbox_check_obj.x
player_obj.tail_dest_y = player_hitbox_check_obj.y
		
current_obj = local_obj
current_objx = local_obj.x
current_objy = local_obj.y
		
		
player_obj.tail_throwing = false
player_obj.tail_planted = true
player_obj.left_click_buffer = 0
//ang = 0
		
image_angle = point_direction(player_obj.start_throw_x,player_obj.start_throw_y,x,y) - 90

audio_sound_pitch(gsound.s_sword_hit_metal_wall,random_range(0.9,1.1))
//audio_manager(gsound.s_sword_hit_metal_wall,0,false,0)
var cx = player_obj.camx + player_obj.cam_width_h
var cy = player_obj.camy + player_obj.cam_height_h
audio_play_sound_at(gsound.s_sword_hit_metal_wall,
	mean(cx,cx,cx,cx,cx,cx,tail_obj.x),
	mean(cy,cy,cy,cy,cy,cy,tail_obj.y),
	10,100,300,1,false,0)
//mean(cx,cx + cx - tail_obj.x),
//mean(cy,cy + cy - tail_obj.y),
		
audio_sound_pitch(Emergency_Sandbag_Heavy_Hitting_Rocks_02,random_range(0.9,1.1))
//audio_manager(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false,0)
audio_play_sound_at(Emergency_Sandbag_Heavy_Hitting_Rocks_02,
	mean(cx,cx,cx,cx,cx,cx,tail_obj.x),
	mean(cy,cy,cy,cy,cy,cy,tail_obj.y),
	10,100,300,1,false,0)
	
	
var ello = impact_1
audio_sound_gain(ello,0.5,0)
audio_sound_pitch(ello,random_range(0.9,1.1))
//audio_manager(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false,0)
audio_play_sound_at(ello,
	mean(cx,cx,cx,cx,cx,cx,tail_obj.x),
	mean(cy,cy,cy,cy,cy,cy,tail_obj.y),
	10,100,300,1,false,0)
	
ello = sword_strike_1
audio_sound_gain(ello,0.3,0)
audio_sound_pitch(ello,random_range(0.9,1.1))
//audio_manager(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false,0)
audio_play_sound_at(ello,
	mean(cx,cx,cx,cx,cx,cx,tail_obj.x),
	mean(cy,cy,cy,cy,cy,cy,tail_obj.y),
	10,100,300,1,false,0)
		
		
		
audio_manager(clink1mp332,0,false,0)