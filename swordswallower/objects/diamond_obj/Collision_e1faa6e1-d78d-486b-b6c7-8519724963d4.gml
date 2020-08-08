/// @description Insert description here
// You can write your code in this editor

dist_moved = 0;
new_x = x;
while (dist_moved < abs(hsp)) {
	new_x -= sign(hsp);
	dist_moved++;
	if (!place_meeting(new_x, y, other)) {
		x = new_x
		hsp=-hsp
		if sprite_index == diamond_hurt && inv_timer<1 {
			death = true	
		} else {
			inv_timer=60
			sprite_index = diamond_hurt	
		}
		audio_play_sound(beep_sound,0,false)

		return;
	}
}

dist_moved = 0;
new_y = y;
while (dist_moved < abs(vsp)) {
	new_y -= sign(vsp);
	dist_moved++;
	if (!place_meeting(x, new_y, other)) {
		y = new_y;
		vsp = -vsp
		if sprite_index == diamond_hurt && inv_timer<1 {
			death = true	
		} else {
			inv_timer=60
			sprite_index = diamond_hurt	
		}
		audio_play_sound(beep_sound,0,false)

		return;
	}
}