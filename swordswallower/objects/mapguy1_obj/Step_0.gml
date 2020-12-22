/// @description Insert description here
// You can write your code in this editor

if point_distance(x,player_obj.y,player_obj.x,player_obj.y)<300
&& point_distance(player_obj.x,y,player_obj.x,player_obj.y)<300{
	player_present = true
} else {
	player_present = false
}


if gravd {
	if stopped {
		
	} else {
		//vsp+=0.4
		//if wall_detect(x,y+1) {
		//	stopped = true	
		//	vsp = 0
		//}
	}
} else {
	y = starty
}

//if init {
//	var lol = dialogue_array[0]
//	while lol!="0" {
//		lol = dialogue_array[o]	
//		o++
//	}
//	if o>0 {
//		dialogue_array[o-1] = "end"
//	} else {
//		dialogue_array[0] = "end"	
//	}
//	init = false
//}
//if current_pick==6 {
//	level1_master.getmap = true	
//}
	
if keybool && mapguy_visited {
	if times_spoken<1 {
		dialogue_array[0] = "There it is! Well done. "
		dialogue_array[1] = "Now you'll want to return to the bridge that broke underneath you a few moments ago and cross the gap. "
		dialogue_array[2] = "If you can kill the bridgekeeper and find a way to pull the bridge back up I can get out of here. "
		dialogue_array[3] = "Good luck! Hopefully our paths cross again sometime soon. "
		dialogue_array[4] = "end"
	} else {
		dialogue_array[0] = "Best of luck with the bridgekeeper--be prepared for anything. "
		dialogue_array[4] = "end"
	}
		
} else if keybool && !mapguy_visited {
	if times_spoken<1 {
		dialogue_array[0] = "Greetings, warrior! I see you obtained the key from over there. "
		dialogue_array[1] = "I was trying to get your attention earlier, but it looked like you were in a rush. "
		dialogue_array[2] = "I'll give you a map of the tower if you find a way to reactivate the bridge. "
		dialogue_array[3] = "Here's the map. Press SHIFT or CIRCLE to look at it. "
		dialogue_array[4] = "If you can kill the bridgekeeper and find a way to pull the bridge back up I can get out of here. "
		dialogue_array[5] = "Good luck! Hopefully our paths cross again sometime soon. "
		dialogue_array[6] = "end"
		
		if current_pick==4 {
			level1_master.st_map_1 = true
		}
	}
} else {
	if times_spoken<1 {
		dialogue_array[0] = "Greetings, traveler. That's a rather large sword you're dragging around. "
		dialogue_array[1] = "If you're down here, then you must've fallen at the bridge, too. "
		dialogue_array[2] = "I came from the other side of the bridge, and the bridgekeeper dropped me into the tar pit as well. Now I'm stuck here. "
		dialogue_array[3] = "Tell you what, let's make a deal. "
		dialogue_array[4] = "I'm a cartographer, and I've mapped this entire area. And you're a warrior, with that giant sword of yours."
		dialogue_array[5] = "I'll give you a map of this tower and the cliffs above, and you can put the bridge back the way it was so we can get out of here. "
		dialogue_array[6] = "Here you go. Press SHIFT or CIRCLE to look at it. "
		dialogue_array[7] = "If you can find a way to open the door behind me, you'll be on your way back to the bridge. "
		dialogue_array[8] = "Good luck. "
		dialogue_array[9] = "end"
	} else {
		dialogue_array[0] = "Return when you've found a way to open that bridge. "
		dialogue_array[1] = "end"
	}
	
	if ds_list_size(player_obj.keylist)>0 {
		keybool = true	
		times_spoken = 0
	}
	if current_pick==6 {
		level1_master.st_map_1 = true
	}
}
	







if player_present && !boatboy {
	with ui_manager {
		friendly_x = other.x
		friendly_y = other.y - other.sprite_height/2
		view_xview = friendly_x-view_wview/2
	}
	if player_obj.k_speak_p {
		
		
		
		
		if !ui_manager.spk_bool {
			ui_manager.speaking = true
			ui_manager.printing = true
			ui_manager.spk_bool = true
			ui_manager.s_dia_talk_list = dialogue_sound_list
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
		} 
			
		
		if dialogue=="end" {
			current_pick = 0	
			if !keybool {
				mapguy_visited = true	
			}
			times_spoken++
		
			//spk_bool = false
		}
	}
}

if (plf==true && player_present = false) {//|| player_obj.ending_lock {
	//sdm("PFEHHEFHEHFHEFHE")
	ui_manager.current_dialogue = "end"
	current_pick = 0
	
	//ui_manager.spk_bool = false
	
}
if !in_camera_range_bigger(x,y) {
	image_xscale = sign(x-player_obj.x)
}

plf = player_present