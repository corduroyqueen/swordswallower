/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if level1_master.death_num>=50{
	dialogue_array[0] = "......."
	dialogue_array[1] = string(level1_master.death_num) + " deaths. "
	dialogue_array[2] = "I am... fascinated. Impressed. "
	dialogue_array[3] = "......"
	dialogue_array[4] = "With your deaths as payment, I would like to give special thanks to a few individuals on the behalf of Uti and Julia. "
	dialogue_array[5] = "Gabe. Matt. Burgess. Winnie. Bennett. Julian. Marianna. Hosni. Noah. Clair. Spencer. Elizabeth. Justin. Derek. Mars. Isabella.  Corey. "
	dialogue_array[6] = "That is all, that is all, there is nothing else. "
	dialogue_array[7] = "end"
} else {
	dialogue_array[0] = "......."
	dialogue_array[1] = "Your deaths. They're " + string(level1_master.death_num) + ". "
	dialogue_array[2] = "When you've seen death 50 times, you will speak to me again. "
	dialogue_array[3] = "There are always more to come. "
	dialogue_array[4] = "end"
}


if place_meeting(x,y,player_obj) && y>2375 {
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
if plf==true && player_present = false {
	ui_manager.current_dialogue = "end"
	current_pick = 0
	if mapguy {
		level1_master.getmap = true	
	}
}

image_xscale = sign(x-player_obj.x)

plf = player_present