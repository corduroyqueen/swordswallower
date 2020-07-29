/// @description Insert description here
// You can write your code in this editor


if point_distance(x,player_obj.y,player_obj.x,player_obj.y)<150
&& point_distance(player_obj.x,y,player_obj.x,player_obj.y)<150{
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

if mapguy {
	if ds_list_size(player_obj.keylist)>0 {
		keybool = true	
	}
	if keybool && mapguy_visited {
		dialogue_array[0] = "There it is! Well done. "
		dialogue_array[1] = "Now you'll want to return to the bridge that broke underneath you a few moments ago and cross it. "
		dialogue_array[2] = "There's no other way out of this valley, so I'm sure she went that way. "
		dialogue_array[3] = "Good luck! Hopefully our paths cross again sometime soon. "
		dialogue_array[4] = "end"
		
	} else if keybool && !mapguy_visited {
		dialogue_array[0] = "Greetings! I see you obtained the key from over there. "
		dialogue_array[1] = "I was trying to get your attention earlier, but were in such a rush. I can give you a map of the tower. "
		dialogue_array[2] = "Here you go. Press 'SHIFT' to look at it. "
		dialogue_array[3] = "Now you'll want to return to the bridge that broke underneath you a few moments ago and cross it. "
		dialogue_array[4] = "There's no other way out of this valley, so I'm sure she went that way. "
		dialogue_array[5] = "Good luck! Hopefully our paths cross again sometime soon. "
		dialogue_array[6] = "end"
		
		if current_pick==2 {
			level1_master.getmap = true	
		}
	} else {
		dialogue_array[0] = "Greetings. I see you've escaped the tower. "
		dialogue_array[1] = "I can give you a map of the area if you'd like. It might help you in your pursuit. "
		dialogue_array[2] = "Here you go. Press 'SHIFT' to look at it. "
		dialogue_array[3] = "You're going to need a key to open the door above us. If you keep going left you'll find one. "
		dialogue_array[4] = "Good luck. "
		dialogue_array[5] = "end"
		
		if current_pick==2 {
			level1_master.getmap = true	
		}
	}
	
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

if boatboy {
	y = skiff_obj - sprite_height/2 -skiff_obj.sprite_height/2
	y = skiff_obj - 10
	starty = y
	if player_obj.x>38448 && !player_obj.ending_lock {
		if !boatboyenter {
			boatboyenter = true
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
		player_present = true
		
	} else {
		boatboyenter = false
	}
	
}

if player_present {
	if player_obj.k_speak_p {
		ui_manager.speaking = true
		ui_manager.printing = true
		if mapguy && !keybool {
			mapguy_visited = true	
		}
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
if (plf==true && player_present = false) || player_obj.ending_lock {
	ui_manager.current_dialogue = "end"
	current_pick = 0
	
}
if !in_camera_range_bigger(x,y) {
	image_xscale = sign(x-player_obj.x)
}

plf = player_present