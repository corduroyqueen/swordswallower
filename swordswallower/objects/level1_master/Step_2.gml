/// @description Insert description here
// You can write your code in this editor

if get_deaths {
	
	get_deaths = false
	initialize = true
	shielded = player_obj.shielded
	if instance_exists(big_boi_time) {
		big_boi_bool = big_boi_time.special_guy
	}
	
	for(i=0;i<num_shields;i++) {
		shields_b[i] = shields[i].active
	}
		
	if room==subtemple01 {
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
	if room==subtemple02 {
		for(i=0;i<num_fog;i++) {
			fogs_b[i] = instance_exists(fogs[i])
		}	
		for(i=0;i<num_die_blocks;i++) {
			die_blocks_b[i] = instance_exists(die_blocks[i])
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

if keyboard_check_pressed(ord("V")) {
	screen_save("shot" + string(screenshotnum) + ".png")	
	screenshotnum++
}