/// @description Insert description here
// You can write your code in this editor
if master==noone{
	master = instance_nearest(x,y,mach_generator_obj)	
}

on = master.on

if length ==0 {
	length = point_distance(startx,starty,endx,endy)	
}

if startx<endx {
	x1 = startx
	x2 = endx
} else {
	x1 = endx
	x2 = startx
}
if starty<endy {
	y1 = starty
	y2 = endy
} else {
	y1 = endy
	y2 = starty
}

if on {
	enabled = true	
} else {
	enabled = false	
}


if enabled {
	if point_distance(x,y,endx,endy)>1 {
		movespeed = (length/(point_distance(x,y,endx,endy)) + 0.1)*(length/(point_distance(x,y,endx,endy)) + 0.1) * 1.3
		move_towards_point(endx,endy,movespeed)
		if point_distance(x,y,endx,endy)<(1+speed){
			player_obj.shake_d=6
			player_obj.camera_shake_d = true	
		}
	} else {
		x = endx
		y = endy
		movespeed = 0
		hspeed = 0  
		vspeed = 0
	}
} else {
	if point_distance(x,y,startx,starty)>1 {
		movespeed = (length/(point_distance(x,y,startx,starty)) + 0.1)*(length/(point_distance(x,y,startx,starty)) + 0.1) * 1.3
		move_towards_point(startx,starty,movespeed)
		if point_distance(x,y,startx,starty)<(1+speed){
			player_obj.shake_d=6
			player_obj.camera_shake_d = true	
		}
	} else {
		x = startx
		y = starty
		movespeed = 0
		hspeed = 0  
		vspeed = 0
	}
}
x = clamp(x,x1,x2)
y = clamp(y,y1,y2)
