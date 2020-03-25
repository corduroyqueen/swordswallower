obj = argument0

if place_meeting(x+hspeed,y-1,obj) && !climbing
{
    mspeed = 6
	maxheight = 170
	

	if player_obj.y<y {
		while (place_meeting(x+hspeed,y-wallheight,obj) && wallheight <= maxheight) wallheight += 1;
		if wallheight<=maxheight && wallheight>20 {
			climbing=true
		}
	} 
	
	
	
	
}
if wall_checker(x+hspeed,y-wallheight) {
	climbing = false	
}

if sign(player_obj.x-x)==image_xscale {
	yplusb = 0
	y -= yplusb
	wallheight = 0
	climbing = false
}

if climbing {
	vspeed=-mspeed
	if !place_meeting(x+5,y,obj) && !place_meeting(x-5,y,obj){
		bad = true	
	} else {
		bad = false
	}
	
	if bad  {
		yplusb = 0
		y -= yplusb
		wallheight = 0
		climbing = false
	}
			
	
}