/// @description Insert description here
// You can write your code in this editor
if sword_bool {
	if wall_sword_detect(x+hsp,y+vsp) && !done {
		image_angle = point_direction(x,y,x+hsp,y+vsp)-90
		x+=hsp*1.3
		y+=vsp*1.3
		hsp=0
		vsp=0
		done = true
		
		
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
		
		
	}
} else {
	blood_timer++
	blood_timer_m += 0.05
	if blood_timer>blood_timer_m && instance_number(blood_splat_obj)<300 {
		blood_spurt_script(image_angle+90,30,20,5,x+cos(degtorad(image_angle+90))*20,y-sin(degtorad(image_angle+90))*20	)
		blood_timer=0
	}
}

if !wall_detect(x,y+1) && !done {
	vsp+=0.6
} else {
	vsp=0
	if(abs(hsp) < h_decel){
		hsp=0;	
	} else {
		hsp-=sign(hsp) * h_decel;	
	}
	
}
if abs(spinspeed)>2 && !done {
	image_angle+=spinspeed
	spinspeed-=sign(spinspeed)
	if wall_detect(x+1,y) || wall_detect(x-1,y) {
		spinspeed=0	
	}
}

