//fuck yes

if falling {
	timer++
	if timer>timer_m {
		
		
		
		moving_plat_move(hsp,vsp)
	}

	
} else {
	if in_camera_range_bigger(x,y) &&
	(place_meeting(x+2,y,player_obj) ||
	place_meeting(x-2,y,player_obj) ||
	place_meeting(x,y+2,player_obj) ||
	place_meeting(x,y-2,player_obj)) {
		falling = true
	}
}