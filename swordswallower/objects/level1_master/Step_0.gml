
if available_checkpoints>1 {
	lol = true	
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
	map = level0map	
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

