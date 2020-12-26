xinput = argument0
yinput = argument1
sp = argument2
obj = argument3


var dist_moved = 0;
var new_x = xinput;
while (dist_moved < abs(sp)) {
	new_x -= sign(sp);
	dist_moved++;
	if (!place_meeting(new_x, yinput, obj)) {
		return new_x
		return;
	}
}
