/// @description Insert description here
// You can write your code in this editor
if level1_master.dev {
	if keyboard_check_pressed(ord("B")) {
		hsp = 0
		vsp = 0
		x = tail_dest_x
		y = tail_dest_y
	}
}


if held_position && !ending_lock {
	
	if tail_obj.moving_platform_bool { 
		x = player_hitbox_check_obj.x
		y = player_hitbox_check_obj.y
	}	
}
if door_enter {
	door_enter = false
}