/// @description Insert description here
// You can write your code in this editor
if !other.dmg_flashing {
	if dir_ground {
		damage_script(15,sign(player_obj.x-x),3,-5)
	} else if dir_ceiling{
		damage_script(15,sign(player_obj.x-x),1,3)
	} else {
		damage_script(15,sign(player_obj.x-x),6,-3)
	}
}

dist_moved = 0;
new_x = x;
while (dist_moved < abs(hsp)) {
	new_x -= sign(hsp);
	dist_moved++;
	if (!place_meeting(new_x, y, other)) {
		x = new_x
		hsp=0
		return;
	}
}

dist_moved = 0;
new_y = y;
while (dist_moved < abs(vsp)) {
	new_y -= sign(vsp);
	dist_moved++;
	if (!place_meeting(x, new_y, other)) {
		y = new_y;
		vsp = 0;
		return;
	}
}