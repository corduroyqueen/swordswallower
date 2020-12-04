/// @description Insert description here
// You can write your code in this editor
if point_distance(xstart,ystart,player_obj.x,player_obj.y)<3000 {
	if !level1_master.piercebool {
		x = -100
		y = 20000
	}
} else {
	x = xstart
	y = ystart
}
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
	

if times_spoken<1 {
	dialogue_array[0] = "We meet again. Thank you for putting the bridge back in the place. "
	dialogue_array[1] = "I saw you climbing up the cliffside! That's a incredible blade in your possession. "
	dialogue_array[2] = "I haven't seen anyone use a sword like that in a long time. "
	dialogue_array[3] = "Other than the Queen, of course. "
	dialogue_array[4] = "end"
} else if times_spoken<2 {
	dialogue_array[0] = "Hm? A map? "
	dialogue_array[1] = "...alright, I'll give you one. In the name of potential future collaborations between us, hopefully. "
	dialogue_array[2] = "Here you go. I saw something peculiar nearby and marked it down, so it may be of some use to you. "
	dialogue_array[3] = "end"
	
	if current_pick==2 {
		level1_master.st_map_2 = true
	}
} else if times_spoken<3 {
	dialogue_array[0] = "The maps I'm giving you are my drafts, by the way, so apologies for their roughness. Some things might be wrong. "
	dialogue_array[1] = "My partners sell higher quality versions back in the Dry City. "
	dialogue_array[2] = "end"
} else if times_spoken<4 {
	dialogue_array[0] = "Best of luck in your travels, warrior. "
	dialogue_array[1] = "I trust we'll meet again soon. "
	dialogue_array[2] = "end"
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