obj = argument0

if climbing {
	return false	
}

if place_meeting(x-sign(image_xscale)*20+hspeed,y-3,obj) && !climbing
{
    mspeed = 9
	maxheight = 300
	//sdm("climbinp111")

	if player_obj.y<y {
		while (place_meeting(x-sign(image_xscale)*20+hspeed,y-wallheight,obj) && wallheight <= maxheight) wallheight += 1;
		if wallheight<=maxheight && wallheight>20 {
			climbing=true
			//sdm("climbing true")
		}
	} 
	
	
	
	
}
