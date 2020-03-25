obj = argument0

ang = tail_obj.ang

/*
ang = point_direction(x,y,x+hspeed,y+vspeed)
dist_movedx = 0
dist_movedy = 0
new_x = x
new_y = y
while dist_movedx < abs(hspeed) && dist_movedy < abs(vspeed) {
	new_x-=cos(degtorad(ang))	
	new_y+=sin(degtorad(ang))
	dist_movedx++
	dist_movedy++
	if !place_meeting(new_x,new_y,obj) {
		x = new_x
		y = new_y
		hspeed = 0
		vspeed = 0
		return
	}
}

*/

/*
dist_moved=0
new_x = x
new_y = y
direc = get_angle_plug(x,y,obj)
direc2 = point_direction(0,0,hspeed,vspeed)

while dist_moved < abs(speed)+5  {
	new_x -= cos(degtorad(direc)) * 2
	new_y -= -sin(degtorad(direc)) * 2
	dist_moved++
	sdm(new_y)
	if !place_meeting(new_x,new_y,obj) {
		x = new_x
		y = new_y
		hspeed=0
		vspeed=0
		
		return
	}
}*/


dist_moved = 0;
new_x = x;
while (dist_moved < abs(hspeed)) {
	new_x -= sign(hspeed);
	dist_moved++;
	if (!place_meeting(new_x, y, obj)) {
		x = new_x
		hspeed=0
		return;
	}
}


dist_moved = 0;
new_y = y;
while (dist_moved < abs(vspeed)) {
	new_y -= sign(vspeed);
	dist_moved++;
	if (!place_meeting(x, new_y, obj)) {
		y = new_y;
		vspeed = 0;
		return;
	}
}

if hspeed!=0 && vspeed!=0 {
	
	if point_distance(x,y,player_hitbox_check_obj.x,player_hitbox_check_obj.y)<30 {
		x = player_hitbox_check_obj.x
		y = player_hitbox_check_obj.y
	}
	hspeed = 0
	vspeed = 0
}