/// @description Insert description here
// You can write your code in this editor

if toggle {
	move_towards_point(endx,endy,sp)
	if point_distance(x,y,endx,endy)<=sp {
		toggle = false	
	}
} else {
	move_towards_point(startx,starty,sp)	
	if point_distance(x,y,startx,starty)<=sp {
		toggle = true
	}
}

if player_obj.tail_pulling || player_obj.tail_carry {
	sword_present = false	
}

if sword_present {
	
	player_obj.tail_dest_x = x
	player_obj.tail_dest_y = y
	tail_obj.x = x + swordx
	tail_obj.y = y + swordy
	if player_obj.zoom_timer_bool {
		hspeed=0
		vspeed=0
	}
}

