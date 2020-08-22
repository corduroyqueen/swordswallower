/// @description Insert description here
// You can write your code in this editor

if get_deaths {
	
	get_deaths = false
	initialize = true
	shielded = player_obj.shielded
	walls_visible = wall_obj.visible
	black_walls_visible = black_wall_obj.visible
	spikes_visible = spike.visible
	thin_floor_visible = thin_floor_obj.visible
	if instance_exists(big_boi_time) {
		big_boi_bool = big_boi_time.special_guy
	}
	p_cgems = player_obj.gems
	for(i=0;i<num_shields;i++) {
		shields_b[i] = shields[i].active
	}
	for(i=0;i<num_cgems;i++) {
		cgems_b[i] = cgems[i].pickedup
	}	
		
	if room==subtemple01 {
		for(i=0;i<num_die_blocks;i++) {
			die_blocks_b[i] = instance_exists(die_blocks[i])
		}	
		for(i=0;i<num_fog;i++) {
			fogs_b[i] = instance_exists(fogs[i])
		}
		for(i=0;i<num_keydoors;i++) {
			keydoors_b[i] = keydoors[i].closed
		}
		for(i=0;i<num_keys;i++) {
			keys_b2[i] = instance_exists(keys[i])
			if keys_b2[i] {
				keys_b[i] = keys[i].following
			}
			
		}
		for(i=0;i<num_roomfog;i++) {
			roomfogs_b[i] = instance_exists(roomfogs[i])
		}	
	}
	if room==subtemple02 {
		for(i=0;i<num_fog;i++) {
			fogs_b[i] = instance_exists(fogs[i])
		}	
		for(i=0;i<num_die_blocks;i++) {
			die_blocks_b[i] = instance_exists(die_blocks[i])
		}	
	}
	if room==drycity01 {
		
		for(i=0;i<num_die_blocks;i++) {
			die_blocks_b[i] = instance_exists(die_blocks[i])
		}	
		for(i=0;i<num_wooden_walls;i++) {
			wooden_walls_b[i] = instance_exists(wooden_walls[i])
		}	
		for(i=0;i<num_fog;i++) {
			fogs_b[i] = instance_exists(fogs[i])
		}
		for(i=0;i<num_keydoors;i++) {
			keydoors_b[i] = keydoors[i].closed
		}
		for(i=0;i<num_keys;i++) {
			keys_b2[i] = instance_exists(keys[i])
			if keys_b2[i] {
				keys_b[i] = keys[i].following
			}
			
		}
		for(i=0;i<num_roomfog;i++) {
			roomfogs_b[i] = instance_exists(roomfogs[i])
		}	
		for(i=0;i<num_switches;i++) {
			switches_b[i] = switches[i].enabled
		}	
		
	}
	if room==illusionforest01 {
		
		for(i=0;i<num_die_blocks;i++) {
			die_blocks_b[i] = instance_exists(die_blocks[i])
		}	
		for(i=0;i<num_burn_walls;i++) {
			burn_walls_b[i] = instance_exists(burn_walls[i])
		}	
		for(i=0;i<num_fog;i++) {
			fogs_b[i] = instance_exists(fogs[i])
		}
		for(i=0;i<num_keydoors;i++) {
			keydoors_b[i] = keydoors[i].closed
		}
		for(i=0;i<num_ghosts;i++) {
			ghosts_b[i] = ghosts[i].alive
		}
		for(i=0;i<num_keys;i++) {
			keys_b2[i] = instance_exists(keys[i])
			if keys_b2[i] {
				keys_b[i] = keys[i].following
			}
			
		}
		for(i=0;i<num_roomfog;i++) {
			roomfogs_b[i] = instance_exists(roomfogs[i])
		}	
		for(i=0;i<num_switches;i++) {
			switches_b[i] = switches[i].enabled
		}	
		
	}
	if room==subtemple03 {
		for(i=0;i<num_die_blocks;i++) {
			die_blocks_b[i] = instance_exists(die_blocks[i])
		}	
		for(i=0;i<num_fog;i++) {
			fogs_b[i] = instance_exists(fogs[i])
		}
		for(i=0;i<num_roomfog;i++) {
			roomfogs_b[i] = instance_exists(roomfogs[i])
		}		
	}
	if room==airtemple01 {
		for(i=0;i<num_die_blocks;i++) {
			die_blocks_b[i] = instance_exists(die_blocks[i])
		}	
		for(i=0;i<num_fog;i++) {
			fogs_b[i] = instance_exists(fogs[i])
		}
		for(i=0;i<num_roomfog;i++) {
			roomfogs_b[i] = instance_exists(roomfogs[i])
		}		
	}
	room_restart()
}

if dev {
	if keyboard_check_pressed(ord("V")) {
		screen_save("shot" + string(screenshotnum) + ".png")	
		screenshotnum++
	}
	if keyboard_check_pressed(ord("Z")) {
		ability_dash = true
	}
}