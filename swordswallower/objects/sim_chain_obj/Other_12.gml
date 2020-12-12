//fuck yes
p_cut_check = false
	var ok = instance_create_depth(rings_x[| cut],rings_y[| cut],depth,object_index)
	ok.num_rings = num_rings - cut
	//ok.pinned = false
	//ok.run = true
	var ww
	with ok {
		init = false
		event_user(1)
		pinned = false
		rings_pinned[|0] = false
		run = true
		
		for (var e=0;e<num_rings;e++) { 
			ww = other.cut+e
			rings_x[| e] = other.rings_x[| ww]
			rings_y[| e] = other.rings_y[| ww]
			rings_hsp[| e] = other.rings_hsp[| ww]
			rings_vsp[| e] = other.rings_vsp[| ww]
			rings_pinned[| e] = other.rings_pinned[| ww]
		}
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