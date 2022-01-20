/// @description Insert description here
// You can write your code in this editor
if level1_master.dev {
	if keyboard_check_pressed(ord("B")) {
		hsp = 0
		vsp = 0
		x = tail_dest_x
		y = tail_dest_y
	}
}

if ending_lock {
	y = skiff_obj.y+66
	x = skiff_obj.x
}

if intro {
	x = 19707
	y = 14132-48-24
	xpreva=x
	ypreva=y
}

if !ending_lock && !zoom_timer_bool && wall_detect_solids(x,y) {
	x = xpreva
	y = ypreva
	if wall_detect_solids(x+1,y) 
	&& wall_detect_solids(x-1,y) 
	&& wall_detect_solids(x,y+1) 
	&& wall_detect_solids(x,y-1) {
		
		hp-=100
	}
	
}

if door_enter {
	door_enter = false
}