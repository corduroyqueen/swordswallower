obj = argument0

if !instance_exists(instance_place(x,y,obj)) {
	return;
}

dist_moved = 0;
new_x = x;
while (dist_moved < abs(hsp)) {
	new_x -= sign(instance_place(x,y,obj).x-tail_obj.x);
	dist_moved++;
	if (!place_meeting(new_x, y, obj)) {
		x = new_x
		return;
	}
}

dist_moved = 0;
new_y = y;
while (dist_moved < abs(vsp)) {
	new_y -= sign(instance_place(x,y,obj).y-tail_obj.y);
	dist_moved++;
	if (!place_meeting(x, new_y, obj)) {
		y = new_y;
		return;
	}
}