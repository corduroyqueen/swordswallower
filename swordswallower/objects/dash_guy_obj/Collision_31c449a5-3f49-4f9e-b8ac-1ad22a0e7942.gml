/// @description Insert description here
// You can write your code in this editor
obj = other

dist_moved = 0;
new_x = x;
while (dist_moved < abs(hsp)) {
	new_x -= sign(hsp);
	dist_moved++;
	if (!place_meeting(new_x, y, obj)) {
		x = new_x
		hsp=-hsp
		return;
	}
}

dist_moved = 0;
new_y = y;
while (dist_moved < abs(vsp)) {
	new_y -= sign(vsp);
	dist_moved++;
	if (!place_meeting(x, new_y, obj)) {
		y = new_y;
		vsp = -vsp
		return;
	}
}