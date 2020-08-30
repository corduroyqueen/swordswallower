/// @description Insert description here
// You can write your code in this editor
if !hit  {
	if place_meeting(x,y,tail_obj)
	&& !player_obj.tail_carry {
		enabled = !enabled	
		hit = true
		if !place_meeting(x,y,black_wall_obj) {
			audio_play_sound(sword_reject_1,0,false)
		}
		audio_play_sound(door_unlock_2,0,false)
	}
}
if partner==noone {
	partner = self	
}
if enabled {
	partner.enabled = true
	image_index = 1
} else {
	partner.enabled = false
	image_index = 0
}

