/// @description Insert description here
// You can write your code in this editor

dist_moved = 0;
new_x = x;
while (dist_moved < abs(hsp)) {
	new_x -= sign(hsp);
	dist_moved++;
	if (!place_meeting(new_x, y, other)) {
		x = new_x
		hsp=0
		if !fallingoverride || !thrown {
			hsp=0
		}
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
		vsp=0
		if !fallingoverride || !thrown {
		vsp = 0;
		}
		return;
	}
}