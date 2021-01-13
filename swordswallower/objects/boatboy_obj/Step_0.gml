//fuck yes
/// @description Insert description here
// You can write your code in this editor
if x>46000 {
	if times_spoken<1 {
		dialogue_array[0] = "I'm going to circle around. I'll wait for you on the other side if I get there first. "
		dialogue_array[1] = "See you soon. "
		dialogue_array[2] = "end"
	} else {
		dialogue_array[0] = "Good luck. "
		dialogue_array[1] = "end"
	}
//if times_spoken<1 {
	
//}
} else {
	if times_spoken<1 {
		dialogue_array[0] = "Hey! Warrior! Up here! "
		dialogue_array[1] = "Yes, me. Hello. Are you following the hooded creature? "
		dialogue_array[2] = "It just passed here and crossed the tar river. It was walking on top like it was made of stone. "
		dialogue_array[3] = "I was going to try and stop it, but it was holding a... very big sword. "
		dialogue_array[4] = "I'm worried for my town on the other side and was about to cross. I can take you if you need. "
		dialogue_array[5] = "Hang onto the bottom of my skiff. "
	} else {
		dialogue_array[0] = "We must hurry, warrior. I don't know what that creature's planning. "
		dialogue_array[1] = "end"
	}
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

y = skiff_obj.y + 10
x = skiff_obj.x - 300


starty = y
//38448
if player_obj.x>38448 && player_obj.x<47500 {
	player_present = true
} else  {
	//sdm("NOT PRES")
	boatboyenter = false
	player_present = false
}

if player_present { 
	if !player_obj.ending_lock {
		with ui_manager {
			friendly_x = other.x
			friendly_y = other.y - 50
			view_xview = friendly_x-view_wview/2
			//sdm(friendly_x)
		}
	}
	if (player_obj.k_speak_p || !boatboyenter) && !player_obj.ending_lock {
		event_user(0)
		boatboyenter = true
	}
}


if (plf==true && player_present = false) {//|| player_obj.ending_lock {
	//sdm("please")
	//sdm("PFEHHEFHEHFHEFHE")
	ui_manager.current_dialogue = "end"
	current_pick = 0
	
	
	
}

plf = player_present