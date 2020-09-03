//fuck yes
/// @description Insert description here
// You can write your code in this editor


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
if player_obj.x>38448 {
	player_present = true
} else  {
	//sdm("NOT PRES")
	boatboyenter = false
	player_present = false
}

if player_present { 
	with ui_manager {
		friendly_x = other.x
		friendly_y = other.y - 50
		view_xview = friendly_x-view_wview/2
		//sdm(friendly_x)
	}
	if (player_obj.k_speak_p || !boatboyenter) && !player_obj.ending_lock {
		event_user(0)
		boatboyenter = true
	}
}


if (plf==true && player_present = false) || player_obj.ending_lock {
	//sdm("please")
	//sdm("PFEHHEFHEHFHEFHE")
	ui_manager.current_dialogue = "end"
	current_pick = 0
	
}

plf = player_present