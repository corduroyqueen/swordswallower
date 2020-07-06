if !other.intangible {
	
	if other!=tail_obj.current_wall && !tail_obj.moving_platform_bool {
		held_position_ready = false	
		held_position = false
		
	}
	
	tail_obj.current_obj = false
	
	
	boosting_collision_check = false
	
	var th = hspeed
	var tv = vspeed
	
	if !check_zoom_collision {
		default_collision(other)
	}
	
	if place_meeting(x,y,wall_obj) {
		x-=th
		y-=tv
	}
	
	//if !grounded && !place_meeting(x,y+2,other) && !place_meeting(x,y-2,other)
	//&& !wall_kicked {
	//	hspeed=-th*1.5
	//	hspeed = clamp(hspeed,-7,7)
		
	//	if hspeed>0 && player_obj.k_left {
	//		hspeed=0
			
	//	} else if hspeed<0 && player_obj.k_right {
	//		hspeed=0
	//	} else {
	//		wall_kicked = true
	//		vspeed-=4	
	//	}
	//}
	
	check_zoom_collision = false
	
} else {
	
	
	
}

	
//sdm(other.intangible)