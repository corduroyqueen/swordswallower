/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(ord("B")) {
	hspeed = 0
	vspeed = 0
	x = tail_dest_x
	y = tail_dest_y
}


if held_position {
	
	if tail_obj.moving_platform_bool { 
		x = player_hitbox_check_obj.x
		y = player_hitbox_check_obj.y
	}	
}