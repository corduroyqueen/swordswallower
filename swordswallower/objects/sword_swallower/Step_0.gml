/// @description Insert description here
// You can write your code in this editor
if death && visible {
	
	
	visible = false
}


if mouse_check_button_pressed(mb_left) && visible && intro_handler.intro_timer>intro_handler.black_timer_m+200 {
	
	player_obj.tail_carry = false
	player_obj.tail_pulling = true
	player_obj.tail_throwing = false
	death = true
	
	
	
	
}

