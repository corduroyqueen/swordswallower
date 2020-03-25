/// @description Insert description here
// You can write your code in this editor
if master==noone{
	master = instance_nearest(x,y,mach_generator_obj)	
}


on = master.on

if on {
	if machtemple_music_ctrlr.timer<88 {
		act = true	
	} else {
		act = false	
	}
	if act {
		if place_meeting(x,y,player_obj) || 
		(player_obj.held_position && place_meeting(x,y,tail_obj)) {
			if !player_obj.zoom_timer_bool {
				damage_script(101,sign(player_obj.x-x),5,-10)
			}	
		}
	} else {
			
	}
} else {
	
	act = false	
}