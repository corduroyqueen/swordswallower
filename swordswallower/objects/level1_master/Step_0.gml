
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
	if room==airtemple01 {
		//level1map = true	
	}
	getmap = false
}

if room==subtemple01 {
	map = level0map	
}

if room==subtemple02 {
	map = level1map	
}

if room==subtemple03 {
	map = level0map	
}




if room==voidtemple01 {
	if keyboard_check_pressed(vk_shift) {
		voidwalltoggle = !voidwalltoggle
		
	}
}


/*
sdm("OOGA BOOGA")
for(i=0;i<instance_number(checkpoint1);i++){
	sdm(checkpoints[i].x)
}

