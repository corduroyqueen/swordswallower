if !other.intangible {
	
	if other!=tail_obj.current_wall && !tail_obj.moving_platform_bool {
		held_position_ready = false	
		held_position = false
		
	}
	
	tail_obj.current_obj = false
	
	
	boosting_collision_check = false
	
	var th = hspeed
	var tv = vspeed
	if tv>15 {
		if place_meeting(x-hspeed,y+2,other) {
			h_accel_reduc = max(0,(100-tv)/100)+0.25
			player_obj.shake_d=tv/4.5
			player_obj.camera_shake_d = true
		}
	}
	if tv<-5 {
		if place_meeting(x,y-2,other) {
			h_accel_reduc = max(0,(100-tv)/100)+0.1
			player_obj.shake_d=abs(tv)/3
			player_obj.camera_shake_d = true
			held_release_timer=10
			//vspeed
		}
	}
	if !check_zoom_collision {
		
		ang = tail_obj.ang
		dist_moved = 0;
		new_x = x;
		while (dist_moved < abs(hspeed)) {
			new_x -= sign(hspeed);
			dist_moved++;
			if (!place_meeting(new_x, y, other)) {
				x = new_x
				hspeed=0
				return;
			}
		}
		dist_moved = 0;
		new_y = y;
		while (dist_moved < abs(vspeed)) {
			new_y -= sign(vspeed);
			dist_moved++;
			if (!place_meeting(x, new_y, other)) {
				y = new_y;
				if floor(abs(other.image_angle)) % 90 != 0 && vspeed<0 {
					wall_collision_yaxis_up()
				} else if 
				floor(abs(other.image_angle)) % 90 != 0 
				&& vspeed>0
				&& (!place_meeting(x-20,y+20,other) || !place_meeting(x+20,y+20,other) ){
					wall_collision_yaxis_down()
				} else {
					vspeed = 0;
				}
				return;
			}
		}
		if hspeed!=0 && vspeed!=0 {
	
			if point_distance(x,y,player_hitbox_check_obj.x,player_hitbox_check_obj.y)<50 {
				x = player_hitbox_check_obj.x
				y = player_hitbox_check_obj.y
			}
			hspeed = 0
			vspeed = 0
		}
	}
	
	if wall_checker(x,y) {
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