/// @description Insert description here
// You can write your code in this editor
if active {
	
	if !player_obj.zoom_timer_bool {
		if !wall_checker(x+hsp,y+vsp) {
			if point_distance(x,y,global.mousepx,global.mousepy)>25 {
				move_towards_point(global.mousepx,global.mousepy,point_distance(x,y,global.mousepx,global.mousepy)*0.1)
			} else {
				hsp=0
				vsp=0
			}
		}
	} else {
		hsp=0
		vsp=0
	}
	
	tail_obj.x = x+hsp+xoff
	tail_obj.y = y+vsp+yoff
	player_obj.tail_dest_x = x
	player_obj.tail_dest_y = y
	
} else {
	if speed>0 {
		hsp = 0 
		vsp = 0
	}
}