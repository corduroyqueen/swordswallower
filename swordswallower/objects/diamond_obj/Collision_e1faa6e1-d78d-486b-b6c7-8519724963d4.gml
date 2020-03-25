/// @description Insert description here
// You can write your code in this editor

dist_moved = 0;
new_x = x;
while (dist_moved < abs(hspeed)) {
	new_x -= sign(hspeed);
	dist_moved++;
	if (!place_meeting(new_x, y, other)) {
		x = new_x
		hspeed=-hspeed
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
while (dist_moved < abs(vspeed)) {
	new_y -= sign(vspeed);
	dist_moved++;
	if (!place_meeting(x, new_y, other)) {
		y = new_y;
		vspeed = -vspeed
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