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
	
//dialogue_array[0] = "You've finally escaped your confinement in the tower. "
//dialogue_array[1] = "If you're down here, then you must've fallen at the bridge, too. "
//dialogue_array[2] = "I came from the other side of the bridge, and the bridgekeeper dropped me into the tar pit as well. Now I'm stuck here. "
//dialogue_array[3] = "Tell you what, let's make a deal. "
//dialogue_array[4] = "I'm a cartographer, and I've mapped this entire area. And you're a warrior, with that giant sword of yours."
//dialogue_array[5] = "I'll give you a map of this tower and the cliffs above, and you can put the bridge back the way it was so we can get out of here. "
//dialogue_array[6] = "Here you go. Press SHIFT or CIRCLE to look at it. "
//dialogue_array[7] = "If you can find a way to open the door behind me, you'll be on your way back to the bridge. "
//dialogue_array[8] = "Good luck. "
//dialogue_array[9] = "end"

dialogue_array[0] = "You got a dunce cap! Press 1 and 2 to cycle through hats. "
dialogue_array[1] = "end"



if player_present {
	with ui_manager {
		friendly_x = other.x
		friendly_y = other.y - other.sprite_height/2
		view_xview = friendly_x-view_wview/2
	}
	if player_obj.k_speak_p {
		
		level1_master.hats_list[|3] = true
		
		
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