/// @description Insert description here
// You can write your code in this editor

if partner==noone {
		partner = self	
	}
	
if enemy {
	enabled = true
	for(i=0;i<30;i++) {
		if instance_exists(enemy_list[i]) {
			enabled = false	
		}
	}
}

if enabled {
	partner.enabled = true
	image_alpha = 0.6
	sprite_index = spr_switch_on
} else {
	partner.enabled = false
	sprite_index = spr_switch_off
	
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
	
}

