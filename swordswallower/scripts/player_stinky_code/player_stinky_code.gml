//if place_meeting(x,y,sinking_platform_obj) && !zoom_timer_bool{default_collision(sinking_platform_obj)}
if stinky_check && grounded {
	if place_meeting(x,y+1,wall_obj) {
		if !place_meeting(x,y,grass_obj) {
			sir = instance_create_depth(x,y,250,grass_obj)
			sir.image_angle = 0
			temp = instance_place(x,y+1,wall_obj)
			with sir {
				while !place_meeting(x,y-1,other.temp) {
					y+=0.1
				}	
			}
		}
	}
}	


if place_meeting(x,y,dc_water_obj) { 
	stinky_check = true
}

if place_meeting(x,y,stinky_pile_obj) {
	ok = instance_place(x,y,stinky_pile_obj)
	if ok.lit {
		stinky_check = true
	}
} else {
	
	if tail_obj.stinky && tail_carry {
		stinky_check = true	
	}
	if tail_throwing {
		//stinky_check = false	
	}
	with tail_obj {
		
		if collision_line(other.tail_dest_x,other.tail_dest_y,other.x,other.y,stinky_pile_obj,false,true)
		&& place_meeting(x,y,stinky_pile_obj)
		&& instance_place(x,y,stinky_pile_obj).lit {
			stinky = true
		}
		//if other.tail_pulling && !collision_line(other.tail_dest_x,other.tail_dest_y,other.x,other.y,stinky_pile_obj,false,true) {
			
		//	other.stinky_check = false
		//}
		
		
	}
}