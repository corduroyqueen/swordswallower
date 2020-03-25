/// @description Insert description here
// You can write your code in this editor
if death {
	if deathinit {
		if instance_exists(hit) {
			instance_destroy(hit)	
		}
		go = instance_create_depth(head.x,head.y,0,snakeheaddead_obj)
		go.hspeed = tail_obj.hspeed*0.4
		go.vspeed = tail_obj.vspeed*0.4
		go.spinspeed = random_range(20,100) * -sign(go.hspeed)
	
		instance_destroy(head)
		deathinit = false
	}
} else {
	if state==state_idle {
		head.image_angle = image_angle
		if distance_to_object(player_obj)<750 {
			if wall_raycast_checker(player_obj) {
				state = state_searching
			}
		}	
	} else if state==state_searching {
		atk_timer++
		head.image_angle = lerp(head.image_angle,point_direction(x,y,
		player_obj.x+player_obj.hspeed,
		player_obj.y+player_obj.vspeed)-90,1)
		if atk_timer<80 {
			head.x = x + random_range(-3,3)
			head.y = y + random_range(-3,3)
		} else {
			head.x = x
			head.y = y
		}
		
		
		if atk_timer>100 && wall_raycast_checker(player_obj) {
			state=state_attacking
			targetx = player_obj.x
			targety = player_obj.y
			atk_timer = 0
		}
	} else if state==state_attacking {
		with head {
			move_towards_point(other.targetx,other.targety,other.atk_speed)
		}
		if point_distance(head.x,head.y,targetx,targety) < head.speed {
			head.hspeed = 0
			head.vspeed = 0
		
			weak_spot = instance_create_depth(x,y,0,snakeheart_obj)
			weak_spot.distance = random_range(20,point_distance(x,y,head.x,head.y)-10)
			ok = point_direction(x,y,head.x,head.y)
			weak_spot.x = x + lengthdir_x(weak_spot.distance,ok)
			weak_spot.y = y + lengthdir_y(weak_spot.distance,ok)
			weak_spot.parent = self
	
	
	
			state = state_hitting
		}
	} else if state==state_hitting {
	
	
		if atk_timer<1 {
			hit = instance_create_depth(head.x,head.y,0,atk_collision_obj)
			hit.xvel = sign(hit.x-player_obj.x)*10
			hit.yvel = -4
			hit.dmg = 10
		}
		atk_timer++
		
		if atk_timer > 50 {
			instance_destroy(hit)
			instance_destroy(weak_spot)
			atk_timer = 0
			state=state_retracting
		}
	
	} else if state==state_retracting {
		with head {
			move_towards_point(other.x,other.y,other.atk_speed*1.4)
		}	
		if point_distance(x,y,head.x,head.y)<head.speed*1.2 {
			state=state_searching
			head.x = x
			head.y = y
			head.hspeed = 0
			head.vspeed = 0
		}
	}
}