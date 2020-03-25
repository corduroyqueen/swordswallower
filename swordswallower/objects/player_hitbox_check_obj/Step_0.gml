/// @description Insert description here
// You can write your code in this editor
fuck = false
if go {
	
	
	mask_index = player_idle
	c_w=tail_obj.current_wall
	x = tail_obj.x
	y = tail_obj.y
	
	//old_player_hitbox_code()
	ang = tail_obj.ang
	
	while place_meeting(x,y,tail_obj.current_wall) {
		x+=cos(degtorad(ang))
		y+=-sin(degtorad(ang))
	}
	
	ogx = x
	ogy = y
	
	if wall_checker(x,y) {
		presentwall = instance_place(x,y,wall_obj)
		if presentwall==noone {
			presentwall = instance_place(x,y,black_wall_obj)	
		}
		if presentwall==noone {
			//break;
			presentwall = tail_obj.current_wall
		}
		if presentwall.y>y{
			while place_meeting(x,y,presentwall) {
				y-=2
			}
			
		} else {
			while place_meeting(x,y,presentwall) {
				y+=2
			}
		}
		temp1x = x
		temp1y = y
		x=ogx
		y=ogy
		if presentwall.x>x{
			while place_meeting(x,y,presentwall) {
				x-=2
			}
		} else {
			while place_meeting(x,y,presentwall) {
				x+=2
			}	
		}
		temp2x = x
		temp2y = y
		x=ogx
		y=ogy
		if point_distance(x,y,temp1x,temp1y)<point_distance(x,y,temp2x,temp2y) {
			x = temp1x
			y = temp1y
		} else {
			x = temp2x
			y = temp2y
		}
	}
	
	if wall_checker(x,y) {
		new_x = x
		new_y = y
		diffx1 = 0
		diffx2 = 0
		diffy1 = 0
		diffy2 = 0
		while wall_checker(new_x,y) {
			new_x--
			if !wall_checker(new_x,y) {
				diffx1=new_x-x
			}
		}
		new_x = x
		while wall_checker(new_x,y) {
			new_x++
			if !wall_checker(new_x,y) {
				diffx2=new_x-x
			}
		}
		
		while wall_checker(x,new_y) {
			new_y--
			if !wall_checker(x,new_y) {
				diffy1=new_y-y
			}
		}
		new_y = y
		while wall_checker(x,new_y) {
			new_y++
			if !wall_checker(x,new_y) {
				diffy2=new_y-y
			}
		}
		/*
		sdm(diffx1)
		sdm(diffx2)
		sdm(diffy1)
		sdm(diffy2)*/
		
		
		if abs(diffx2)<abs(diffx1) {
			diffx1 = diffx2	
		} else if abs(diffx1)==abs(diffx2) {
			if point_distance(x+diffx2,y,player_obj.x,player_obj.y)<=
			point_distance(x+diffx1,y,player_obj.x,player_obj.y) {
				diffx1 = diffx2
			}
		}
		if abs(diffy2)<abs(diffy1) {
			diffy1 = diffy2	
		} else if abs(diffy1)==abs(diffy2) {
			if point_distance(x,y+diffy2,player_obj.x,player_obj.y)<=
			point_distance(x,y+diffy1,player_obj.x,player_obj.y) {
				diffy1 = diffy2
			}
		}
		
		if abs(diffx1)<abs(diffy1) {
			x += diffx1	
		} else if abs(diffx1)>abs(diffy1) {
			y += diffy1	
		} else {
			if point_distance(x,y+diffy1,player_obj.x,player_obj.y)<=
			point_distance(x+diffx1,y,player_obj.x,player_obj.y) {
				y += diffy1
			} else {
				x += diffx1	
			}
		}
		
		
	} 
	
	
	
	player_obj.tail_dest_x = x
	player_obj.tail_dest_y = y
	go = false	
	
	
} 

fuck = false
if tail_obj.moving_platform_bool && fuck {
	if place_meeting(x,y,wall_obj) {
		c_w = instance_place(x,y,wall_obj)
		if sign(tail_obj.x-c_w.x)<0 {
			while place_meeting(x,y,c_w) {
				x-=3
			}
		} else {
			while place_meeting(x,y,c_w) {
				x+=3
			}
		}
		if place_meeting(x,y,wall_obj) {
			if instance_place(x,y,wall_obj).y>y{
				while place_meeting(x,y,wall_obj) {
					y-=2
				}
			} else {
				while place_meeting(x,y,wall_obj) {
					y+=2
				}	
			}
		}
	}
	
	
	if place_meeting(x,y,black_wall_obj) {
		c_w = instance_place(x,y,black_wall_obj)
		if !tail_obj.current_wall.vertical {
			if sign(tail_obj.x-c_w.x)<0 {
				while place_meeting(x,y,c_w) {
					x-=3
				}
			} else {
				while place_meeting(x,y,c_w) {
					x+=3
				}
			}
			if place_meeting(x,y,black_wall_obj) {
				if instance_place(x,y,black_wall_obj).y>y{
					while place_meeting(x,y,black_wall_obj) {
						y-=2
					}
				} else {
					while place_meeting(x,y,black_wall_obj) {
						y+=2
					}	
				}
			}
		} else {
			if sign(tail_obj.y-c_w.y)<0 {
				while place_meeting(x,y,c_w) {
					y-=3
				}
			} else {
				while place_meeting(x,y,c_w) {
					y+=3
				}
			}
			if place_meeting(x,y,black_wall_obj) {
				if instance_place(x,y,black_wall_obj).x>x{
					while place_meeting(x,y,black_wall_obj) {
						x-=2
					}
				} else {
					while place_meeting(x,y,black_wall_obj) {
						x+=2
					}	
				}
			}
		}
	}
	
	player_obj.tail_dest_x = x
	player_obj.tail_dest_y = y
}

//if wall==left_wall {
//	image_blend = c_red	
//} else if wall==right_wall {
//	image_blend = c_blue	
//} else {
//	image_blend = c_white	
//}

//if wall==up_wall {
//	sprite_index = player_idle_1	
//}

//if wall==down_wall {
//	sprite_index = player_idle_2	
//}

if place_meeting(x,y,wall_obj) {
	image_blend = c_red	
} else {
	image_blend = c_white	
}



