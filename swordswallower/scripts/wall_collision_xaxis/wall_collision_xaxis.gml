obj = argument0

if place_meeting(x+hspeed,y,obj) && grounded
{
    yplus = 0;
    while (place_meeting(x+hspeed,y-yplus,obj) && yplus <= 10) yplus += 1;
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