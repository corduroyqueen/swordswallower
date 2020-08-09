obj = argument0

if place_meeting(x+hsp,y,obj) && grounded && !place_meeting(x+hsp*1.5,y-abs(hsp*5.5),obj)
{
    yplus = 0;
    while (place_meeting(x+hsp,y-yplus,obj) && yplus <= 20) yplus += 1;
    if place_meeting(x+hsp,y-yplus,obj)
    {
        //while (!place_meeting(x+sign(hsp),y,wall_obj)) //x+=sign(hsp);
        hsp = 0;
    }
    else
    {
        y -= yplus
    }
}

if !wall_detect(x+hsp,y+vsp+1) && grounded
{
	yplus = 1;
	while (!wall_detect(x+hsp,y+vsp+yplus) && yplus <=20) yplus += 1;
	
	if yplus<21	{
	    y += yplus-1
	}
}
