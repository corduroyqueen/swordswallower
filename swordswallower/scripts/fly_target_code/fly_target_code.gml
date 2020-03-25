flydamage = argument0

if state==state_chasing && point_distance(x,y,player_obj.x,player_obj.y)>1500 {
	death = true
}	

if tail_obj.stinky {
	target = tail_obj
	if player_obj.tail_planted && !on_target {
		if tail_obj.current_obj!=false {
			if place_meeting(x,y,tail_obj.current_obj) {
			
				target_obj = tail_obj.current_obj
				if !variable_instance_exists(target_obj.id, "pers") {
			
				} else if target_obj.pers==1 {
					if variable_instance_exists(target_obj.id, "fly_immunity") {
					
					} else {
						if !on_target {
							hit_timer = 50
						}
						on_target = true
						
					}
				}
			}
		} else if tail_obj.current_wall {
			
			target_obj = tail_obj.current_wall
			if instance_exists(target_obj) && place_meeting(x+hspeed,y+vspeed,target_obj) {
				if !variable_instance_exists(target_obj.id, "pers") {
			
				} else if target_obj.pers==2 {
					if !on_target {
						hit_timer = 50
					}
					on_target = true
					on_wall = true
				}	
			}
		}
	}
} else if !on_target {
	target = player_obj
	hit_timer = 0
	
}
	
	
	
	if on_target {
		target = target_obj
		inv_timer = 20
		if !instance_exists(target_obj) {
			on_target = false
			target=tail_obj
			death = false
			inv_timer=5
			on_wall = false
			hspeed=random_range(-5,5)
			vspeed=random_range(-5,5)
			return false
			
		} else {
			
			if (point_distance(target.x,target.y,x,y)<6) {
				x = target.x + random_range(-target.sprite_width/2,target.sprite_width/2)
				y = target.y + random_range(-target.sprite_height/2,target.sprite_height/2)
			}
		
			if !variable_instance_exists(target_obj.id, "pers") {
			
			} else if target_obj.pers==1 {
				if variable_instance_exists(target_obj.id, "fly_immunity") {
					
				} else {
					hit_timer++
					if hit_timer>60 {
						hit_timer=0
						target_obj.fly_hp-=flydamage
						inv_timer=60
					}
				}
			} else if target_obj.pers==2 {
				hit_timer++
				if hit_timer>30 {
					hit_timer=0
					target_obj.fly_hp-=flydamage
					inv_timer=60
				}
			}
		}
	}
	//flies go towards the players head
	//makes directing them a lot easier
	if target==player_obj {
		loltemp = 20	
	} else {
		loltemp = 0	
	}
	
	ang = arctan((target.y-y-loltemp)/(target.x-x))
	tempx = -cos(ang) * sign(x-target.x)
	tempy = -sin(ang) * sign(x-target.x)
	
	
	
	
	if on_target {
		image_blend = c_red
		hspeed = lerp(hspeed,tempx*h_accel*7,0.2)
		vspeed = lerp(vspeed,tempy*h_accel*7,0.2)
	} else if tail_obj.stinky {
		
		if player_obj.tail_planted {
			//move_towards_point(player_obj.x,player_obj.y,h_accel*4)
			hspeed = lerp(hspeed,tempx*h_accel*4.5,0.15)
			vspeed = lerp(vspeed,tempy*h_accel*4.5,0.15)
		} else if player_obj.tail_pulling {
			//move_towards_point(player_obj.x,player_obj.y,h_accel*4)
			hspeed = lerp(hspeed,tempx*h_accel*0.8,0.15)
			vspeed = lerp(vspeed,tempy*h_accel*0.8,0.15)
		} else {
			ang = arctan((player_obj.tail_dest_y-y-loltemp)/(player_obj.tail_dest_x-x))
			tempx = -cos(ang) * sign(x-target.x)
			tempy = -sin(ang) * sign(x-target.x)
			
			
			ang = arctan((target.y-y-loltemp)/(target.x-x))
			tempx = -cos(ang) * sign(x-target.x)
			tempy = -sin(ang) * sign(x-target.x)
			//move_towards_point(player_obj.x,player_obj.y,h_accel*0.8)
			ayy = point_distance(x,y,player_obj.x,player_obj.y)/120
			hspeed = lerp(hspeed,tempx*h_accel*1.3*ayy,0.1)
			vspeed = lerp(vspeed,tempy*h_accel*1.3*ayy,0.1)
			
		}
	} else {
		if player_obj.tail_carry {
			inv_timer=0
		}
		if player_obj.stinky_check {
			ayy = point_distance(x,y,player_obj.x,player_obj.y)/120
			hspeed = lerp(hspeed,tempx*h_accel*1.3*ayy,0.1)
			vspeed = lerp(vspeed,tempy*h_accel*1.3*ayy,0.1)
		} else {
			hspeed = lerp(hspeed,tempx*h_accel*1.1,0.07)
			vspeed = lerp(vspeed,tempy*h_accel*1.1,0.07)
		}
	}