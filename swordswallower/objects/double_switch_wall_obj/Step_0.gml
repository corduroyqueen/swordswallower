/// @description Insert description here
// You can write your code in this editor
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
if master1!=noone && master2!=noone {
	if master1.enabled && master2.enabled {
		enabled = true	
	} else {
		enabled = false	
	}
} else if enemytoggle {
	if instance_exists(character) {
		enabled = false
	} else {
		enabled = true	
	}
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
		hsp = 0  
		vsp = 0
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
		hsp = 0  
		vsp = 0
	}
}
x = clamp(x,x1,x2)
y = clamp(y,y1,y2)