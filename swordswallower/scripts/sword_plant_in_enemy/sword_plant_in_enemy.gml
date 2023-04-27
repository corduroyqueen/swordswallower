local_obj = argument0

sdm("boof begin")
dist_moved = 0;
		new_x = x;
		while (dist_moved < abs(hsp)) {
			new_x -= sign(hsp);
			dist_moved++;
			if (!place_meeting(new_x, y, local_obj)) {
				if local_obj.object_index==crab_obj || local_obj.object_index==nucrab_obj || local_obj.object_index==handbug_obj {
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
				//hsp = 0
				//vsp = 0
				
				additional_enemy_script()
			
				audio_manager(false,0,false,3)
			
				return;
			}
		}


		dist_moved = 0;
		new_y = y;
		while (dist_moved < abs(vsp)) {
			new_y -= sign(vsp);
			dist_moved++;
			if (!place_meeting(x, new_y, local_obj)) {
				if local_obj.object_index==crab_obj || local_obj.object_index==nucrab_obj || local_obj.object_index==handbug_obj {
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
				//hsp = 0
				//vsp = 0;
				player_obj.tail_dest_x = x
				player_obj.tail_dest_y = y
				player_obj.tail_planted = true
			
			
				additional_enemy_script()
			
			
				audio_manager(false,0,false,3)
			
				return;
			}
		}