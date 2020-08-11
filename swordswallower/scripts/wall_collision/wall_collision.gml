if place_meeting(x+hspeed,y,wall_obj) {	
	yPlus=0;
	while (place_meeting(x+hspeed,y-yPlus,wall_obj) && yPlus <= abs(step_height)) {
		yPlus +=1;
	}
	if (place_meeting(x+hspeed,y-yPlus,wall_obj)) {
		while(!place_meeting(x+sign(hspeed),y,wall_obj))
		{
			x += sign(hspeed)
		}
	} else {
		y -= yPlus;	
	}
}