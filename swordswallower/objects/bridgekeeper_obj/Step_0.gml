/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor




if abs(x-player_obj.x)<300 && abs(y-player_obj.y)<300 {
	player_present = true
} else {
	player_present = false
}
y = starty

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


if crying_bool {
	sprite_index = bridgekeeper3
} else {
	if point_distance(x,y,player_obj.x,player_obj.y)<1000 && 
	(player_obj.held_position_start || !collision_line(x,y,player_obj.x,player_obj.y,wall_parent_obj,false,true)) {
		crying_bool = true
	}
}

if player_present {
	with ui_manager {
		friendly_x = other.x
		friendly_y = other.y - other.sprite_height/2 - 40	
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
			spk_bool = false
		}
	}
}
if plf==true && player_present = false {
	ui_manager.current_dialogue = "end"
	current_pick = 0
	spk_bool = false
	if mapguy {
		level1_master.getmap = true	
	}
}

image_xscale = sign(x-player_obj.x)

plf = player_present