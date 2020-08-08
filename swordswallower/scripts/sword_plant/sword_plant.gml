local_obj = argument0


get_angle(local_obj)
insert_hs = hsp
insert_vs = vsp
		
wall_particle_tail_script(hsp/2,vsp/2,0.2,5,true,2,2,rubble_s1)
		
hsp = 0
vsp = 0
planted=true
		
player_hitbox_check_obj.go = true
		
		
//player_obj.tail_dest_x = player_hitbox_check_obj.x
//player_obj.tail_dest_y = player_hitbox_check_obj.y
		
current_wall = local_obj
current_wallx = local_obj.x
current_wally = local_obj.y
		
		
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
		
		
audio_manager(clink1mp332,0,false,0)