checkx = argument0;
checky = argument1;
obj = argument2;

if(!place_meeting(checkx,checky,obj)){
	return false;
}

local_obj = instance_place(checkx, checky, obj);


if (player_obj.tail_throwing || player_obj.tail_pulling) && !local_obj.met {
	oldx = x
	oldy = y
	x = checkx;
	y = checky;
	
	
	

	if obj==nucrab_obj {
		
		if local_obj.pickedup {
			x = oldx
			y = oldy
			player_obj.shake_d=5
			player_obj.camera_shake_d = true
			return false
		}
	}
	
	if obj==fly_obj || obj==flyfree_obj || obj==doublefly_obj {
		if local_obj.inv_timer>0 || local_obj.death {
			player_obj.tail_planted = false
			x = oldx
			y = oldy
			
			return false	
		}
		player_obj.shake_d=3
		player_obj.camera_shake_d = true
		audio_play_sound(Knife_Pull_140,0,false)
		local_obj.death = true	
		player_obj.tail_planted = false
		x = xpreva
		y = ypreva
		//hitpause = true
	} else if obj==fatfly2_obj {
		player_obj.shake_d=3
		player_obj.camera_shake_d = true
		audio_play_sound(Knife_Pull_140,0,false)
		
		local_obj.hp--
		if local_obj.hp>0 {
			with local_obj {
				just_blood(tail_obj.hspeed,tail_obj.vspeed,0.2,30,false,sprite_width/4,sprite_height)	
			}
		}
		player_obj.tail_planted = false
		x = xpreva
		y = ypreva
		local_obj.met = true
		hitpause = true
		
	} else if obj==kill_back_obj {
		
		audio_play_sound(Knife_Pull_140,0,false)
		local_obj.death = true	
		player_obj.tail_planted = false
		hitpause = true
		
	} else if obj==snakeheart_obj || obj==fly_pod_obj {
		local_obj.death = true
		x = xpreva
		y = ypreva
		player_obj.shake_d=5
		player_obj.camera_shake_d = true
		hitpause = true
	} else if obj==green_guy_obj {
		
		audio_play_sound(Knife_Pull_140,0,false)
		local_obj.death = true	
		x = oldx
		y = oldy
		player_obj.tail_planted = false
		player_obj.gem_active = true
		player_obj.gem_thrown = false
		hitpause = true
	} else if obj==wooden_fly_dart_obj {
		audio_play_sound(Knife_Pull_140,0,false)
		local_obj.death = true	
		x = oldx
		y = oldy
		player_obj.tail_planted = false	
		hitpause = true
	} else if obj==eye_obj {
		local_obj.hp-=1	
		local_obj.image_blend = c_red
		local_obj.met = true
		player_obj.shake_d=7
		player_obj.camera_shake_d = true
		hitpause = true
		
	} else if obj==cryptkeeper_obj || obj==cryptkeeper_ceiling_obj {
		x = oldx
		y = oldy
		audio_play_sound(Knife_Pull_140,0,false)
		local_obj.death = true	
		player_obj.tail_planted = false
		player_obj.shake_d=5
		player_obj.camera_shake_d = true
		audio_manager(false,0,false,3)
		hitpause = true
		
	} else if obj==dash_guy_obj {
		if local_obj.sprite_index == follow_guy_angry {
			local_obj.death = true
			
		} else {
			local_obj.sword_lock = true
			local_obj.swordx = x - local_obj.x
			local_obj.swordy = y - local_obj.y
			
			current_obj = local_obj	
			
			hspeed = 0
			vspeed = 0
			planted=true
			player_obj.tail_dest_x = local_obj.x
			player_obj.tail_dest_y = local_obj.y
			player_obj.tail_planted = true
			player_obj.tail_throwing = false
			audio_manager(false,0,false,3)
			inside_flier = true
			image_angle = point_direction(player_obj.start_throw_x,player_obj.start_throw_y,x,y) - 90
			audio_manager(false,0,false,3)
		} 
		hitpause = true
		local_obj.met = true
		return false
	} else if obj==charger_obj {
		hitpause = true
		if local_obj.hp-10<0 && local_obj.state==local_obj.state_knockback {
			audio_play_sound(Knife_Pull_140,0,false)
			local_obj.death = true	
			player_obj.tail_planted = false	
			
			audio_manager(false,0,false,3)
			
			var bruh = lettuce_chop
			audio_sound_pitch(bruh,random_range(0.75,1.25))
			audio_play_sound(bruh,0,false)
				
			
		} else {
			player_obj.tail_pulling = true
			player_obj.tail_throwing = false
		} 
		
		x = xpreva
		y = ypreva
		player_obj.shake_d=5
		player_obj.camera_shake_d = true
		local_obj.met = true
		tail_obj.charger_bool = true
		if local_obj.state==local_obj.state_knockback {
			with local_obj {
				hp-=10	
				ang = point_direction(x,y,player_obj.x,player_obj.y)
		
				var bruh = lettuce_chop
				audio_sound_pitch(bruh,random_range(0.75,1.25))
				audio_play_sound(bruh,0,false)
				
				audio_manager(0,false,0,3)
				just_blood(cos(degtorad(ang))*30,-sin(degtorad(ang))*30,0.2,80,true,sprite_width/4,sprite_height/4)
		
				state = state_chasing
				charge_timer=0
				charging = false	
			}
		}
		
		return false
		
		
	} else {
		
		
		dist_moved = 0;
		new_x = x;
		while (dist_moved < abs(hspeed)) {
			new_x -= sign(hspeed);
			dist_moved++;
			if (!place_meeting(new_x, y, local_obj)) {
				if obj==crab_obj || obj==nucrab_obj {
					if local_obj.fallingoverride {
						local_obj.death = true
						player_obj.shake_d=3
						player_obj.camera_shake_d = true
					} else {
						player_obj.shake_d=7
						player_obj.camera_shake_d = true
						local_obj.h_max_speed=0.2
					}
					return
				}
				
				
				local_obj.sword_lock = true
				local_obj.swordx = x - local_obj.x
				local_obj.swordy = y - local_obj.y
			
				current_obj = local_obj
				
				x = new_x
				
				image_angle = point_direction(player_obj.start_throw_x,player_obj.start_throw_y,x,y) - 90
				//hspeed = 0
				//vspeed = 0
				
				additional_enemy_script()
			
				audio_manager(false,0,false,3)
			
				return;
			}
		}


		dist_moved = 0;
		new_y = y;
		while (dist_moved < abs(vspeed)) {
			new_y -= sign(vspeed);
			dist_moved++;
			if (!place_meeting(x, new_y, local_obj)) {
				if obj==crab_obj || obj==nucrab_obj {
					if local_obj.fallingoverride {
						local_obj.death = true
						player_obj.shake_d=3
						player_obj.camera_shake_d = true
					} else {
						player_obj.shake_d=7
						player_obj.camera_shake_d = true
						local_obj.h_max_speed=0.2
					}
					return
				}
				
				local_obj.sword_lock = true
				local_obj.swordx = x - local_obj.x
				local_obj.swordy = y - local_obj.y
			
				current_obj = local_obj
			
				y = new_y;
				
				image_angle = point_direction(player_obj.start_throw_x,player_obj.start_throw_y,x,y) - 90
				//hspeed = 0
				//vspeed = 0;
				player_obj.tail_dest_x = x
				player_obj.tail_dest_y = y
				player_obj.tail_planted = true
			
			
				additional_enemy_script()
			
			
				audio_manager(false,0,false,3)
			
				return;
			}
		}
	}
}
//} else {
	
//	dist_moved = 0;
//	new_x = x;
//	while (dist_moved < abs(hspeed)) {
//		new_x -= sign(hspeed);
//		dist_moved++;
//		if (!place_meeting(new_x, y, local_obj)) {
//			x = new_x
//			hspeed = 0
//			return;
//		}
//	}


//	dist_moved = 0;
//	new_y = y;
//	while (dist_moved < abs(vspeed)) {
//		new_y -= sign(vspeed);
//		dist_moved++;
//		if (!place_meeting(x, new_y, local_obj)) {
//			y = new_y;
//			vspeed = -1;
//			return;
//		}
//	}
	
//}

return true;
