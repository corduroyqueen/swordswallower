local_obj = argument0



wall_particle_tail_script(x-xpreva,y-ypreva,0.2,5,true,2,2,rubble_s1)
get_angle(local_obj)


image_angle = point_direction(player_obj.start_throw_x,player_obj.start_throw_y,x,y) - 90





if local_obj.object_index == impale_circle_obj {
	image_angle = point_direction(x,y,local_obj.x,local_obj.y) - 90
	var ange = point_direction(local_obj.x,local_obj.y,x,y)
	if point_distance(x,y,local_obj.x,local_obj.y)>50 {
		x = local_obj.x + dcos(ange) * 50
		y = local_obj.y - dsin(ange) * 50
	}
}

		
planted=true	
hilt_x = x+cos(degtorad(tail_obj.image_angle+270)) * 66
hilt_y = y-sin(degtorad(tail_obj.image_angle+270)) * 66

if !collision_line(x-(hilt_x-x),y-(hilt_y-y),hilt_x,hilt_y,all_walls_parent_obj,false,true) {
	image_angle = point_direction(x,y,local_obj.x,local_obj.y) - 90
	hilt_x = x+cos(degtorad(tail_obj.image_angle+270)) * 66
	hilt_y = y-sin(degtorad(tail_obj.image_angle+270)) * 66
}


var smoke = instance_create_depth(x,y,depth+1,dash_smoke_particle_obj)
smoke.image_angle = ang-90


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