

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

if obj==big_boi_obj {
	//if player_obj.tail_throwing {
	//sdmn()
	
	player_obj.shake_d=7
	player_obj.camera_shake_d = true
	local_obj.hspeed+=tail_obj.hspeed*0.05
	local_obj.vspeed+=tail_obj.vspeed*0.1
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

if obj==charger_obj {
	//if player_obj.tail_throwing {
	//sdmn()
	player_obj.shake_d=7
	player_obj.camera_shake_d = true
	if !local_obj.charging {
		local_obj.hspeed+=tail_obj.hspeed*0.01
	}
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
	player_obj.shake_d=5
	player_obj.camera_shake_d = true
}
if obj==fatfly_obj || obj==spikyguy_obj {
	local_obj.met = true
	planted = true
	player_obj.tail_dest_x = x
	player_obj.tail_dest_y = y
	player_obj.tail_planted = true
	player_obj.tail_throwing = false
	player_obj.tail_pulling = false
	player_obj.shake_d=5
	player_obj.camera_shake_d = true
	audio_manager(false,0,false,3)
}

if obj==crimson_soldier_obj{ 
	local_obj.met = true
	planted = true
	local_obj.sword_present = true
	player_obj.tail_dest_x = x
	player_obj.tail_dest_y = y
	player_obj.tail_planted = true
	player_obj.tail_throwing = false
	player_obj.tail_pulling = false
	player_obj.shake_d=5
	player_obj.camera_shake_d = true
	audio_manager(false,0,false,3)
}

if obj==hummingbird_obj {
	local_obj.met = true
	local_obj.sword_present = true
	planted = true
	
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
				