obj = argument0

dist_moved = 0;
new_x = x;
while (dist_moved < abs(hsp)) {
	new_x -= sign(hsp);
	dist_moved++;
	if (!place_meeting(new_x, y, obj)) {
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
	if (!place_meeting(x, new_y, obj)) {
		y = new_y;
		if vsp>0.1 {
			
			if abs(hsp)>0 {
				hsp/=2
			} else {
				hsp += choose(-vsp/2,vsp/2)
			}
			vsp = -vsp/3
		} else {
			vsp = 0
		}
		return;
	}
}

