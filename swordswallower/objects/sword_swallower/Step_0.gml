/// @description Insert description here
// You can write your code in this editor
if death && visible {
	just_blood(tail_obj.hspeed,tail_obj.vspeed,0.9,60,true,sprite_width/1.5,sprite_height/1.5)
	
	visible = false
}


if mouse_check_button_pressed(mb_left) && visible {
	tail_obj.x = x
	tail_obj.y = y
	player_obj.tail_carry = false
	player_obj.tail_pulling = true
	death = true
	if place_meeting(x,y,crab_obj) {
			audio_play_sound(Knife_Pull_140,0,false)	
		}
		audio_manager(false,0,false,3)
	
}