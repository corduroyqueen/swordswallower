if level1_master.map {
	if player_obj.k_map {
		mapout = true
		draw_sprite_ext(spr_newmap,0,960,540,1,1,0,c_white,1)
	} else {
		mapout = false
	} 
} else {
	mapout = false
}
	//if k_map_p && !death{ 
	//	hsp=0
	//	vsp=0
	//	view_visible[0] = false
	//	view_visible[1] = true
	//	if room==subtemple01 {
	//		if y>1100 {
	//			camera_set_view_pos(view_camera[1],12000,13000)
	//		} else {
	//			camera_set_view_pos(view_camera[1],22000,1500)	
	//		}
	//	}
		
		
	//	with level1_master {
	//		for (i=0;i<num_fog;i++) {
	//			if instance_exists(fogs[i]) {
	//				fogs[i].image_alpha = 1
	//			}
	//		}
	//		for (i=0;i<num_roomfog;i++) {
	//			if instance_exists(roomfogs[i]) {
	//				roomfogs[i].image_alpha = 1
	//			}
	//		}
	//	}
	//	var checkpoints = array_create(instance_number(checkpoint1))
	//	var scale_con = (camera_get_view_width(view_camera[1]) * 0.00961538461)/200
	//	for (i = 0; i < instance_number(checkpoint1); i++) {
	//		checkpoints[i] = instance_find(checkpoint1,i)
	//		lol = instance_create_depth(checkpoints[i].x,checkpoints[i].y,-700,checkpoint_marker_obj)
	//		if !checkpoints[i].setpoint {
	//			//lol.sprite_index = current_ckpt_marker
	//		}
	//		lol.image_xscale = scale_con * 10
	//		lol.image_yscale = scale_con * 10
	//		lol.yeet = 1
	//		if checkpoints[i]==checkpoint_manager.checkpoint {
	//			lol.yeet = 0	
	//		} 
	//	}
	//	hello = instance_create_depth(player_obj.x,player_obj.y,-700,checkpoint_marker_obj)
	//	hello.sprite_index = swordicon
	//	hello.image_xscale = scale_con*8.5
	//	hello.image_yscale = scale_con*8.5
	//	hello.yeet = 2
		
	
	//	//view_set_camera(view_camera[1],view_get_camera(view_camera[1]))
	//} 
	//if k_map && !death {
	//	hello.x = player_obj.x
	//	hello.y = player_obj.y
	//}
	//if k_map_r || death {
	//	view_visible[0] = true
	//	view_visible[1] = false
	//	with level1_master {
	//		for (i=0;i<num_fog;i++) {
	//			if instance_exists(fogs[i]) {
	//				fogs[i].image_alpha = 0
	//			}
	//		}
	//		for (i=0;i<num_roomfog;i++) {
	//			if instance_exists(roomfogs[i]) {
	//				roomfogs[i].image_alpha = 0
	//			}
	//		}
	//	}
	//	//view_set_camera(view_camera[0],view_get_camera(view_camera[0]))
	//}
//}

//if view_visible[1] {
//	mapout = true	
//} else {
//	mapout = false	
//}