
	if tail_obj.ang==0 {
		if sign(tail_obj.x-tail_obj.current_wallx)<0 {
			while place_meeting(x,y,c_w) {
				x-=2
			}
			wall = right_wall
		} else {
			while place_meeting(x,y,c_w) {
				x+=2
			}
			wall = left_wall
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
	} else {
		if sign(tail_obj.y-tail_obj.current_wally)<0 {
			while place_meeting(x,y,c_w) {
				y-=1
			}
			wall = down_wall
		} else {
			while place_meeting(x,y,c_w) {
				y+=1
			}
			wall = up_wall
		}
		if place_meeting(x,y,wall_obj) {
			if instance_place(x,y,wall_obj).x>x{
				while place_meeting(x,y,wall_obj) {
					x-=2
				}
			} else {
				while place_meeting(x,y,wall_obj) {
					x+=2
				}	
			}
		}
		
	}
	
	if place_meeting(x,y,black_wall_obj) {
		if tail_obj.ang==0 {
			if sign(tail_obj.x-tail_obj.current_wallx)<0 {
				while place_meeting(x,y,c_w) {
					x-=2
				}
				wall = right_wall
			} else {
				while place_meeting(x,y,c_w) {
					x+=2
				}
				wall = left_wall
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
			if sign(tail_obj.y-tail_obj.current_wally)<0 {
				while place_meeting(x,y,c_w) {
					y-=1
				}
				wall = down_wall
			} else {
				while place_meeting(x,y,c_w) {
					y+=1
				}
				wall = up_wall
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
	
	
	if tail_obj.moving_platform_bool {
		if tail_obj.ang==0 {
			if sign(tail_obj.x-tail_obj.current_wallx)<0 {
				while place_meeting(x,y,c_w) {
					x-=2
				}
				wall = right_wall
			} else {
				while place_meeting(x,y,c_w) {
					x+=2
				}
				wall = left_wall
			}
			if place_meeting(x,y,moving_platform_obj) {
				if instance_place(x,y,moving_platform_obj).y>y{
					while place_meeting(x,y,moving_platform_obj) {
						y-=2
					}
				} else {
					while place_meeting(x,y,wall_obj) {
						y+=2
					}	
				}
			}
		} else {
			if sign(tail_obj.y-tail_obj.current_wally)<0 {
				while place_meeting(x,y,c_w) {
					y-=1
				}
				wall = down_wall
			} else {
				while place_meeting(x,y,c_w) {
					y+=1
				}
				wall = up_wall
			}
			if place_meeting(x,y,moving_platform_obj) {
				if instance_place(x,y,moving_platform_obj).x>x{
					while place_meeting(x,y,moving_platform_obj) {
						x-=2
					}
				} else {
					while place_meeting(x,y,moving_platform_obj) {
						x+=2
					}	
				}
			}
		}
	}