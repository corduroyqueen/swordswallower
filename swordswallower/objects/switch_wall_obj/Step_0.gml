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
if master!=noone {
	if master.enabled {
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
		move_towards_point(endx,endy,10)
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
	if instance_place(x,y+vspeed,all) {
		list = collision_list(x,y+vspeed,all)
			
		for (i=0;i<ds_list_size(list);i++) {
			obj = ds_list_find_value(list,i)
				
			with(obj){
					
				if abs(x - other.x) > other.sprite_width/2 + 2 { return false }
					
				if !variable_instance_exists(id, "pers") {
					
				} else if pers==0 {
					
					if wall_checker(x,y+other.vspeed) {
						//perform_player_damage(1000)
					} else {
						//vspeed+=other.vspeed
					}
				}else if pers==1 {
					
					if wall_checker(x,y+other.vspeed) {
						death = true
					} else {
						vspeed=0
						y+=other.vspeed
						hspeed=0
					}
				}
			}
		}
	}
} else {
	if point_distance(x,y,startx,starty)>1 {
		movespeed = (length/(point_distance(x,y,startx,starty)) + 0.1)*(length/(point_distance(x,y,startx,starty)) + 0.1) * 1.3
		move_towards_point(startx,starty,10)
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

if hspeed>0 {
	hspeed = clamp(hspeed,4,100)
} else if hspeed<0 {
	hspeed = clamp(hspeed,-100,-4)
}


if vspeed>0 {
	vspeed = clamp(vspeed,4,100)
} else if vspeed<0 {
	vspeed = clamp(vspeed,-100,-4)
}



