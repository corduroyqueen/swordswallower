/// @description Insert description here
// You can write your code in this editor


if death {
	just_blood(0,0,0.2,10,false,sprite_width/2,sprite_height)
	
	if !place_meeting(x,y,fatfly_destroyer) && met {
		sword_pull_check()
		player_obj.bounced = false
		reset_intangibility()
		player_obj.zoom_timer_bool = false
		player_obj.zoom_timer = 0
	}
	
	ui_manager.current_dialogue = "end"
	current_pick = 0
	
	instance_destroy(id)	
}

if player_obj.tail_carry {
	sword_lock = false
	if !player_obj.zoom_timer_bool {
		met = false	
	}
	
}

if met {
	if mouse_check_button_pressed(mb_left) {
		audio_play_sound(Knife_Pull_140,0,false)	
	}
}

if met && player_obj.tail_carry {
	met = false	
}


if sword_present {
	if player_obj.zoom_timer_bool && place_meeting(x,y,player_obj) {
		//death = true
	}

	player_obj.tail_dest_x = x
	player_obj.tail_dest_y = y
	tail_obj.x = x + swordx
	tail_obj.y = y + swordy
	
	if player_obj.tail_pulling || player_obj.tail_carry {
		sword_present = false
	}
}



if point_distance(x,player_obj.y,player_obj.x,player_obj.y)<150
&& point_distance(player_obj.x,y,player_obj.x,player_obj.y)<150
&& !player_obj.zoom_timer_bool
{
	player_present = true
} else {
	player_present = false
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
	if player_obj.k_speak_p {
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
if (plf==true && player_present = false) || player_obj.ending_lock {
	ui_manager.current_dialogue = "end"
	current_pick = 0
	
}

plf = player_present

