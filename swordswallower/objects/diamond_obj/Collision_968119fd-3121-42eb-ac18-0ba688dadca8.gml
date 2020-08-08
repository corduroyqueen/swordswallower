/// @description Insert description here
// You can write your code in this editor

//state = state_idle
//hit_timer=0

dist_moved = 0;
new_x = x;
while (dist_moved < abs(hsp)) {
	new_x -= sign(hsp);
	dist_moved++;
	if (!place_meeting(new_x, y, other)) {
		x = new_x
		hsp=(-hsp*0.8)
		audio_play_sound(clink1mp3,0,false)
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
		vsp = (-vsp*0.8)
		audio_play_sound(clink1mp3,0,false)
		return;
	}
}