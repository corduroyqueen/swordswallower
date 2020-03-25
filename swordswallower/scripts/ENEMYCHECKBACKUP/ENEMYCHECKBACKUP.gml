checkx = argument0;
checky = argument1;
obj = argument2;

if(!place_meeting(checkx,checky,obj)){
	return false;
}

local_obj = instance_place(checkx, checky, obj);


if (player_obj.tail_throwing || player_obj.tail_pulling) && !local_obj.met {
	
	x = checkx;
	y = checky;
	
	if obj==fly_obj || obj==flyfree_obj {
		
		audio_play_sound(Knife_Pull_140,0,false)
		local_obj.death = true	
		player_obj.tail_planted = false
	} else if obj==green_guy_obj {
		
		audio_play_sound(Knife_Pull_140,0,false)
		local_obj.death = true	
		player_obj.tail_planted = false
		player_obj.gem_active = true
		player_obj.gem_thrown = false
	} else if obj==wooden_fly_dart_obj {
		audio_play_sound(Knife_Pull_140,0,false)
		local_obj.death = true	
		player_obj.tail_planted = false	
	} else if obj==eye_obj {
		local_obj.hp-=1	
		local_obj.image_blend = c_red
		local_obj.met = true	
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
		local_obj.met = true
		return false
	} else {
	
		
		dist_moved = 0;
		new_x = x;
		while (dist_moved < abs(hspeed)) {
			new_x -= sign(hspeed);
			dist_moved++;
			if (!place_meeting(new_x, y, local_obj)) {
				if obj==crab_obj {
					if local_obj.fallingoverride {
						local_obj.death = true
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
				
				if obj==ghost_obj {
					//if player_obj.tail_throwing {
						//sdmn()
					hspeed = 0
					vspeed = 0
					zombie_interact_script(local_obj)
					planted=true
					player_obj.tail_dest_x = x
					player_obj.tail_dest_y = y
					player_obj.tail_planted = true
					audio_manager(false,0,false,3)
					local_obj.met = true
					//}
				}
			
				
				if obj==zombie_obj {
					//if player_obj.tail_throwing {
						//sdmn()
					hspeed = 0
					vspeed = 0
					zombie_interact_script(local_obj)
					planted=true
					player_obj.tail_dest_x = x
					player_obj.tail_dest_y = y
					player_obj.tail_planted = true
					
					audio_manager(false,0,false,3)
					//}
				}
				if obj==golem_obj || obj=chair_obj {
					//if player_obj.tail_throwing {
						//sdmn()
					
						hspeed = 0
						vspeed = 0
					zombie_interact_script(local_obj)
					planted=true
					player_obj.tail_dest_x = x
					player_obj.tail_dest_y = y
					player_obj.tail_planted = true
					local_obj.met = true
					audio_manager(false,0,false,3)
					//}
				}
				if obj==diamond_obj {
					//if player_obj.tail_throwing {
						//sdmn()
					
						hspeed = 0
						vspeed = 0
					
					zombie_interact_script(local_obj)
					planted=true
					player_obj.tail_dest_x = x
					player_obj.tail_dest_y = y
					player_obj.tail_planted = true
					local_obj.met = true
					audio_manager(metal_01,0,false,0)
					//}
				}
				if obj==fly_obj {
					local_obj.death = true	
					player_obj.tail_planted = false
				}
				if obj==fatfly_obj || obj==spikyguy_obj {
					local_obj.met = true
					planted=true
					player_obj.tail_dest_x = x
					player_obj.tail_dest_y = y
					player_obj.tail_planted = true
					player_obj.tail_throwing = false
					player_obj.tail_pulling = false
					audio_manager(false,0,false,3)
				}
				
				if obj==wooden_fly_obj {
					if player_obj.fire_active  {
						local_obj.death = true
						local_obj.sword_lock = false
						player_obj.tail_planted = false
						
					} else if !local_obj.death {
						local_obj.met = true
						planted=true
						player_obj.tail_dest_x = x
						player_obj.tail_dest_y = y
						player_obj.tail_planted = true
						player_obj.tail_throwing = false
						player_obj.tail_pulling = false
						audio_manager(false,0,false,3)
					}
				}
				
			
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
				if obj==crab_obj {
					if local_obj.fallingoverride {
						local_obj.death = true
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
			
			
				if obj==ghost_obj {
					//if player_obj.tail_throwing {
						//sdmn()
					hspeed = 0
					vspeed = 0
					zombie_interact_script(local_obj)
					planted=true
					player_obj.tail_dest_x = x
					player_obj.tail_dest_y = y
					player_obj.tail_planted = true
					audio_manager(false,0,false,3)
					local_obj.met = true
					//}
				}
			
				if obj==zombie_obj {
					//if player_obj.tail_throwing {
						//sdmn()
					hspeed = 0
					vspeed = 0
					zombie_interact_script(local_obj)
					planted=true
					player_obj.tail_dest_x = x
					player_obj.tail_dest_y = y
					player_obj.tail_planted = true
					audio_manager(false,0,false,3)
					//}
				}
				if obj==golem_obj {
					//if player_obj.tail_throwing {
						//sdmn()
					
						hspeed = 0
						vspeed = 0
					
					zombie_interact_script(local_obj)
					planted=true
					player_obj.tail_dest_x = x
					player_obj.tail_dest_y = y
					player_obj.tail_planted = true
					local_obj.met = true
					audio_manager(false,0,false,3)
					//}
				}
				if obj==diamond_obj {
					//if player_obj.tail_throwing {
						//sdmn()
					
						hspeed = 0
						vspeed = 0
					
					zombie_interact_script(local_obj)
					planted=true
					player_obj.tail_dest_x = x
					player_obj.tail_dest_y = y
					player_obj.tail_planted = true
					local_obj.met = true
					audio_manager(false,0,false,3)
					//}
				}
				
				
				if obj==fly_obj {
					local_obj.death = true	
					player_obj.tail_planted = false
				}
				if obj==fatfly_obj || obj==spikyguy_obj {
					local_obj.met = true
					planted=true
					player_obj.tail_dest_x = x
					player_obj.tail_dest_y = y
					player_obj.tail_planted = true
					player_obj.tail_throwing = false
					player_obj.tail_pulling = false
					audio_manager(false,0,false,3)
				}
				
				if obj==wooden_fly_obj {
					if player_obj.fire_active {
						local_obj.death = true
						local_obj.sword_lock = false
						player_obj.tail_planted = false
					} else if !local_obj.death {
						local_obj.met = true
						planted=true
						player_obj.tail_dest_x = x
						player_obj.tail_dest_y = y
						player_obj.tail_planted = true
						player_obj.tail_throwing = false
						player_obj.tail_pulling = false
						audio_manager(false,0,false,3)
					}
				}
			
			
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
