/// @description Insert description here
// You can write your code in this editor

if zoom_timer_bool {
	other.broken = true
	player_obj.tail_planted = false
	player_obj.tail_pulling = true
	player_obj.bounced = false
	reset_intangibility()
	player_obj.zoom_timer_bool = false
	player_obj.zoom_timer = 0
	player_obj.hspeed*=0.4
	player_obj.vspeed*=0.4
	return
} else if !other.broken {
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