/// @description Insert description here
// You can write your code in this editor
obj = other

dist_moved = 0;
new_x = x;
while (dist_moved < abs(hspeed)) {
	new_x -= sign(hspeed);
	dist_moved++;
	if (!place_meeting(new_x, y, obj)) {
		x = new_x
		hspeed=-hspeed
		return;
	}
}

dist_moved = 0;
new_y = y;
while (dist_moved < abs(vspeed)) {
	new_y -= sign(vspeed);
	dist_moved++;
	if (!place_meeting(x, new_y, obj)) {
		y = new_y;
		vspeed = -vspeed
		return;
	}
}