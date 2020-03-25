checkx = argument0;
checky = argument1;
obj = argument2;

if(!place_meeting(checkx,checky,obj)){
	return false;
}

local_obj = instance_place(checkx, checky, obj);

x = checkx;
y = checky;

if (player_obj.tail_throwing || player_obj.tail_pulling) && !local_obj.met {
	
	image_angle = point_direction(player_obj.start_throw_x,player_obj.start_throw_y,x,y) - 90
	
	
	
	dist_moved = 0;
	new_x = x;
	while (dist_moved < abs(hspeed)) {
		new_x -= sign(hspeed);
		dist_moved++;
		if (!place_meeting(new_x, y, local_obj)) {
			
			local_obj.sword_lock = true
			local_obj.swordx = x - local_obj.x
			local_obj.swordy = y - local_obj.y
			
			
			local_obj.met = true
			
			current_obj = local_obj
			
			x = new_x
			hspeed = 0
			vspeed = 0
			planted=true
			player_obj.tail_dest_x = x
			player_obj.tail_dest_y = y
			player_obj.tail_throwing = false
			player_obj.tail_pulling = false
			player_obj.tail_planted = true
			
			
			
			return;
		}
	}


	dist_moved = 0;
	new_y = y;
	while (dist_moved < abs(vspeed)) {
		new_y -= sign(vspeed);
		dist_moved++;
		if (!place_meeting(x, new_y, local_obj)) {
			
			local_obj.sword_lock = true
			local_obj.swordx = x - local_obj.x
			local_obj.swordy = y - local_obj.y
			
			local_obj.met = true
			
			current_obj = local_obj
			
			y = new_y;
			hspeed = 0
			vspeed = 0;
			planted=true
			player_obj.tail_dest_x = x
			player_obj.tail_dest_y = y
			player_obj.tail_throwing = false
			player_obj.tail_pulling = false
			player_obj.tail_planted = true
			return;
		}
	}

} else {
	
	dist_moved = 0;
	new_x = x;
	while (dist_moved < abs(hspeed)) {
		new_x -= sign(hspeed);
		dist_moved++;
		if (!place_meeting(new_x, y, local_obj)) {
			x = new_x
			hspeed = 0
			return;
		}
	}


	dist_moved = 0;
	new_y = y;
	while (dist_moved < abs(vspeed)) {
		new_y -= sign(vspeed);
		dist_moved++;
		if (!place_meeting(x, new_y, local_obj)) {
			y = new_y;
			vspeed = -1;
			return;
		}
	}
	
}

return true;

