/// @description Insert description here
// You can write your code in this editor
on = master.on

if sword_present {
	
	//tail_obj.x = x + swordx
	//tail_obj.y = y + swordy
	
	//tail_obj.current_obj = self
	tail_obj.current_wall = self
	tail_obj.moving_platform_bool = true
	//if player_obj.tail_pulling {
	//	sword_present = false
	//	if !mouse_check_button(mb_right) {
	//		tail_obj.moving_platform_bool = false
	//	}
	//}
}


if on {
	if pause {
		pause_timer++
		if pause_timer>pause_length {
			pause_timer = 0
			pause = false
			
		}
	} else {
	
		move_towards_point(points[pos_index+1,0],points[pos_index+1,1],move_speed)
		
		if point_distance(x,y,points[pos_index+1,0],points[pos_index+1,1])<move_speed {
			pause = true
			
			hspeed=0
			vspeed=0
			
			x = points[pos_index+1,0]
			y = points[pos_index+1,1]
			
			pos_index++
			if pos_index>point_number-1 {
				pos_index = 0	
			}
		}
	
	}
} else {
	hspeed=0
	vspeed=0	
}