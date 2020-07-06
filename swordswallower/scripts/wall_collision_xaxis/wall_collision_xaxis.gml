obj = argument0

if place_meeting(x+hspeed,y,obj) && grounded
{
    yplus = 0;
    while (place_meeting(x+hspeed,y-yplus,obj) && yplus <= 20) yplus += 1;
    if place_meeting(x+hspeed,y-yplus,obj)
    {
        //while (!place_meeting(x+sign(hspeed),y,wall_obj)) //x+=sign(hspeed);
        hspeed = 0;
    }
    else
    {
        y -= yplus
    }
}

if !wall_checker(x+hspeed,y+vspeed+1) && grounded
{
	yplus = 1;
	while (!wall_checker(x+hspeed,y+vspeed+yplus) && yplus <=20) yplus += 1;
	
	if yplus<21	{
	    y += yplus-1
	}
}
