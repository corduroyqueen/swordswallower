/// @description Insert description here
// You can write your code in this editor
if active {
	
	if !player_obj.zoom_timer_bool {
		if !wall_checker(x+hspeed,y+vspeed) {
			if point_distance(x,y,mouse_x,mouse_y)>25 {
				move_towards_point(mouse_x,mouse_y,point_distance(x,y,mouse_x,mouse_y)*0.1)
			} else {
				hspeed=0
				vspeed=0
			}
		}
	} else {
		hspeed=0
		vspeed=0
	}
	
	tail_obj.x = x+hspeed+xoff
	tail_obj.y = y+vspeed+yoff
	player_obj.tail_dest_x = x
	player_obj.tail_dest_y = y
	
} else {
	if speed>0 {
		hspeed = 0 
		vspeed = 0
	}
}