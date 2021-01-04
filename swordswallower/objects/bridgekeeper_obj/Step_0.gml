/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor



if place_meeting(x,y,tail_obj) && (player_obj.tail_throwing || player_obj.tail_pulling) {
	just_blood(tail_obj.hsp,tail_obj.vsp,0.2,10,false,x,y)
	level1_master.piercebool = true
	
	ui_manager.current_dialogue = "end"
	current_pick = 0
	spk_bool = false
}

if level1_master.piercebool {
	instance_destroy(id)
}

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
	if level1_master.pierce_bridge_pulled && !level1_master.piercebool {
		st_bridge_switch.enabled = true
	}
	init = false
}
if times_spoken<1 {
	dialogue_array[0] = "Spare me! Please! I'm so sorry! "
	dialogue_array[1] = "The Queen made me do it, I swear, I didn't want to trick you! "
	dialogue_array[2] = "I've been locked up here for years, just like you. They threatened to kill me if I didn't drop every passerby into the tar pit. "
	dialogue_array[3] = "Please, just spare me, I promise I won't try to kill anyone else! "
	dialogue_array[4] = "end"
} else if times_spoken<2 {
	dialogue_array[0] = "What do you want from me?? "
	dialogue_array[1] = "Is it about the cloaked man? I saw him go up your tower. "
	dialogue_array[2] = "If you keep going straight you'll find him. He was carrying an unconscious girl. "
	dialogue_array[3] = "end"
} else if times_spoken<3 {
	dialogue_array[0] = "Is it about the traveler I tricked earlier? The masked one? "
	dialogue_array[1] = "If you find him, tell I'm sorry... I really mean it. "
	dialogue_array[2] = "end"
} else {
	dialogue_array[0] = "Please just leave me alone, I won't hurt anyone else! "
	dialogue_array[1] = "end"
}


if crying_bool {
	sprite_index = bridgekeeper3
} else {
	if point_distance(x,y,player_obj.x,player_obj.y)<1000 && 
	(player_obj.held_position_start || !collision_line(x,y,player_obj.x,player_obj.y,wall_parent_obj,false,true)) {
		crying_bool = true
	}
}
if times_spoken==0 && current_pick==0 {
	if wall_raycast_checker(player_obj) {
		start_dialogue = true
	}
} else {
	start_dialogue = false
}
if player_present || start_dialogue {
	with ui_manager {
		friendly_x = other.x
		friendly_y = other.y - other.sprite_height/2 - 40	
		view_xview = friendly_x-view_wview/2
	}
	if player_obj.k_speak_p || start_dialogue {
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
			times_spoken++
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