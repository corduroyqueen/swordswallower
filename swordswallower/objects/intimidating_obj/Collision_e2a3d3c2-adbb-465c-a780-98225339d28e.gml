/// @description Insert description here
// You can write your code in this editor

if !met && !player_obj.tail_carry && !player_obj.tail_planted {

	player_obj.tail_throwing = false
	player_obj.tail_held = true

	sword_present = true

	other.hsp = 0
	other.vsp = 0

	sword_hold_x = (other.x-x)
	sword_hold_y = (other.y-y)
	
	tail_obj.image_angle = point_direction(player_obj.start_throw_x,player_obj.start_throw_y,x,y) - 90
	
	met = true
}