obj = argument0

dist_moved = 0;
new_x = x;
while (dist_moved < abs(hspeed)) {
	new_x -= sign(hspeed);
	dist_moved++;
	if (!place_meeting(new_x, y, obj)) {
		x = new_x
		hspeed=-hspeed
		hspeed*=0.2
		hspeed=0
		y-=10
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
		vspeed = 0;
		return;
	}
}