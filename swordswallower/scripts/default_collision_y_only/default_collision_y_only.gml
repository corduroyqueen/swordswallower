xinput = argument0
yinput = argument1
sp = argument2
obj = argument3

var dist_moved = 0;
var new_y = yinput;
while (dist_moved < abs(sp)) {
	new_y -= sign(sp);
	dist_moved++;
	if (!place_meeting(xinput, new_y, obj)) {
		return new_y;
		return;
	}
}
