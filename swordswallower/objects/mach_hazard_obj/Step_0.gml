/// @description Insert description here
// You can write your code in this editor
if master==noone{
	master = instance_nearest(x,y,mach_generator_obj)	
}
if place_meeting(x,y,player_obj) || 
(player_obj.held_position && place_meeting(x,y,tail_obj)) {
	if !player_obj.zoom_timer_bool && on {
		damage_script(101,sign(player_obj.x-x),5,-10)
	}	
}

on = master.on