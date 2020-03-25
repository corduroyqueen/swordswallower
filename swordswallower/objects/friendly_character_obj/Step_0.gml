/// @description Insert description here
// You can write your code in this editor
if point_distance(x,y,player_obj.x,player_obj.y)<(sprite_width) {
	player_present = true
} else {
	player_present = false
}
if gravd {
	if stopped {
		
	} else {
		vspeed+=0.4
		if wall_checker(x,y+1) {
			stopped = true	
			vspeed = 0
		}
	}
} else {
	y = starty
}


if init {
	var lol = dialogue_array[0]
	while lol!="0" {
		lol = dialogue_array[o]	
		o++
	}
	if o>0 {
		dialogue_array[o-1] = "end"
	} else {
		dialogue_array[0] = "end"	
	}
	init = false
}
if player_present {
	if keyboard_check_pressed(level1_master.speaking_button) {
		ui_manager.speaking = true
		ui_manager.printing = true
		
		with ui_manager {
			current_dialogue = ""
			global.display_txt = ""
			global.tboxActive = false;
		    txt = global.txtCache;
		    global.txtCache = "";
		
			txt = global.placeholderTxt;
		    global.placeholderTxt = "";
		    global.temp_placeholderTxt = "";
		    global.txtIndex = 1;
		}
		
		dialogue = dialogue_array[current_pick]
		current_pick++
		ui_manager.current_dialogue = dialogue
		if dialogue="end" {
			current_pick = 0	
		}
	}
}
if plf==true && player_present = false {
	ui_manager.current_dialogue = "end"
	current_pick = 0
	if mapguy {
		level1_master.getmap = true	
	}
}


plf = player_present