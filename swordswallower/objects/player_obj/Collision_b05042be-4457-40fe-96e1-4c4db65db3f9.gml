/// @description Insert description here
// You can write your code in this editor

if other.met && zoom_timer_bool {
	other.broken = true	
	zoom_timer_bool = false
	hspeed *=0.5
	vspeed *=0.5
	held_position = false
	reset_intangibility()
	other.friendo.mask_index = background
} else{
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
		if (!place_meeting(x, new_y, other) && !place_meeting(x-hspeed, new_y, wall_obj)) {
			y = new_y;
			vspeed = 0;
			return;
		}
	}
} 
