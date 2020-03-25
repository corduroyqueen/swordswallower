/// @description Insert description here
// You can write your code in this editor

	
	//tail_obj.x = x + swordx
	//tail_obj.y = y + swordy
	if player_obj.tail_pulling {
		if !mouse_check_button(mb_right) {
			tail_obj.moving_platform_bool = false
			
		}
		sword_present = false
	}
