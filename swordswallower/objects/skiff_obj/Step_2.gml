/// @description Insert description here
// You can write your code in this editor


if ((player_obj.tail_pulling && !mouse_check_button(mb_right))
|| (mouse_check_button_released(mb_right)))
&& sword_present {
	tail_obj.moving_platform_bool = false
	sword_present = false
}