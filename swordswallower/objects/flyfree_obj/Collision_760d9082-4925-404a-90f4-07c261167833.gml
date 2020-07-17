/// @description Insert description here
// You can write your code in this editor
if !death && !tail_obj.stinky && !player_obj.stinky_check {
if !inv_timer>0 {
	if other.zoom_hitbox_active {
		death = true
	} else if !other.dmg_flashing {
		damage_script(10,sign(player_obj.x-x),5,-1)
	}
}
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
}