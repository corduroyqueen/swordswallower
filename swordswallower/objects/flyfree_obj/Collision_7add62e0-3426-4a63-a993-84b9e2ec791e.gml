/// @description Insert description here
// You can write your code in this editor
dist_moved = 0;
new_x = x;
while (dist_moved < abs(hspeed)) {
	new_x -= sign(hspeed);
	dist_moved++;
	if (!place_meeting(new_x, y, other)) {
		x = new_x
		hspeed=0
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
		vspeed = 0;
		return;
	}
}