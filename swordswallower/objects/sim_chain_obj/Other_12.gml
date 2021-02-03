//fuck yes
p_cut_check = false

one_cut_per_frame_check = true
	var ok = instance_create_depth(rings_x[| cut],rings_y[| cut],depth,object_index)
	ok.num_rings = num_rings - cut
	//ok.pinned = false
	//ok.run = true
	
	var s = sword_reject_1
	audio_sound_pitch(s,random_range(0.95,1.05))

	var cx = player_obj.cam_midx
	var cy = player_obj.cam_midy

	
	audio_play_sound_at(s,
	mean(cx,cx,cx,cx,cx,cx,tail_obj.x),
	mean(cy,cy,cy,cy,cy,cy,tail_obj.y),0,0,0,0,false,0)
	
	var ww
	with ok {
		init = false
		event_user(1)
		pinned = false
		
		run = true
		
		for (var e=0;e<num_rings;e++) { 
			ww = other.cut+e
			rings_x[| e] = other.rings_x[| ww]
			rings_y[| e] = other.rings_y[| ww]
			rings_hsp[| e] = other.rings_hsp[| ww]
			rings_vsp[| e] = other.rings_vsp[| ww]
			rings_pinned[| e] = other.rings_pinned[| ww]
		}
		rings_pinned[|0] = false
	}
	pinned = false
	for (var lot=0; lot<num_rings;lot++) {
		if rings_pinned[|lot] {
			pinned = true
			break
		}
	}
	var spark = instance_create_depth(ok.x,ok.y,depth+1,spark_particle_effect_obj)
	spark.angle = point_direction(0,0,-tail_obj.hsp,-tail_obj.vsp)
	
	num_rings = cut+1
	force_cut = false