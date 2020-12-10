
if available_checkpoints>1 {
	lol = true	
}

if keyboard_check_pressed(ord("G")) {
	window_set_fullscreen(!window_get_fullscreen())
}
if instance_exists(player_obj) {
	if player_obj.x>43000 {
		zone4 = true
	} else {
		zone4 = false
	}
}
if getmap {
	if room==subtemple02 {
		level1map = true	
	}
	if room==subtemple01 {
		level0map = true	
	}
	if room==subtemple03 {
		level2map = true	
	}
	if room==drycity01 {
		dc_map_1 = true	
	}
	if room==illusionforest01 {
		if_map_1 = true	
	}
	if room==airtemple01 {
		//level1map = true	
	}
	getmap = false
}

if room==subtemple01 {
	
	if st_map_1 && player_obj.y>11000 {
		map = spr_newmap
	} else if st_map_2 && player_obj.y<11000 && player_obj.y>3573 {
		map = spr_map2
	} else {
		map = nothing
	}
	
	//sdm(ds_list_size(player_obj.keylist))
}

if room==subtemple02 {
	map = level1map	
}

if room==subtemple03 {
	map = level0map	
}

if room==drycity01 {
	map = dc_map_1
}

if room==illusionforest01 {
	map = if_map_1
}


if room==voidtemple01 {
	if player_obj.k_map_p {
		voidwalltoggle = !voidwalltoggle
		
	}
}



/*
sdm("OOGA BOOGA")
for(i=0;i<instance_number(checkpoint1);i++){
	sdm(checkpoints[i].x)
}

