//fuck yes

head.x = x - 15
head.y = y - 30
head.image_angle = 0
head.image_index = 0
if player_obj.tail_carry {
	met = false
}
if state==state_idle {
	
	state_timer++
	
	if state_timer>100 {
		
		if rightarm.destroy_arm {
			attack = choose(3,5)
			
		} else if leftarm.destroy_arm {
			attack = choose(2,3,5)
			//attack = 2
		} else {
			attack = choose(1,3,5)
			attack = 5
			//attack = 1
		}
		
		
		state_timer=0
		state=state_attacking
	}
	
} else if state==state_attacking {
	
	if attack==attack_left_lunge {
		rightarm.state = rightarm.state_defense
		if leftarm.state == leftarm.state_idle {
			leftarm.state = leftarm.state_anticipation
		}
		
		if leftarm.state == leftarm.state_reset || leftarm.destroy_arm {
			state = state_idle
			rightarm.state = rightarm.state_idle
			leftarm.state = leftarm.state_idle
			leftarm.timer=0
		}
	} else if attack==attack_right_lunge {
		leftarm.state = leftarm.state_defense
		if rightarm.state == rightarm.state_idle {
			rightarm.state = rightarm.state_anticipation
		}
		if rightarm.state == rightarm.state_reset || rightarm.destroy_arm {
			state = state_idle
			rightarm.state = rightarm.state_idle
			rightarm.timer=0
		}
	} else if attack==attack_cough_flies {
		head.image_index = 1
		var spawn_num = floor(random_range(2,6))
		for(var i=0;i<spawn_num;i++) {
			fly1 = instance_create_depth(x-200,y-100,depth,flyfree_obj)
			
			var ang = random_range(220,270)
			var spd = random_range(14,28)
			fly1.hsp = dcos(ang) * spd
			fly1.vsp = -dsin(ang) * spd
			fly1.inv_timer=15
			fly1.state = 1
			fly1.spawn = true
			fly1.eyespr = choose(greeneye,pinkeye)
		}
		if leftarm.destroy_arm && rightarm.destroy_arm {
			state = state_mouthopen
		} else {
			state = state_idle
		}
	} else if attack==attack_cough_tar {
		head.image_index = 1
		var spawn_num = 5
		var sx = head.x-200
		var sy = head.y-100
		for(var i=0;i<spawn_num;i++) {
			var tar1 = instance_create_depth(sx,sy,depth+1,projectile_arcing_obj)
			tar1.start_x = sx
			tar1.start_y = sy
			tar1.end_x = sx - 175 - (230 * i)
			tar1.end_y = sy - 200
			tar1.fall_speed = 8
			tar1.timer_m = 120 - i * 10
		}
		if leftarm.destroy_arm && rightarm.destroy_arm {
			state = state_mouthopen
		} else {
			state = state_idle
			state_timer = -100
		}
	} else if attack==attack_wall_hands {
		
		ht++
		//h1.visible = true
		//h2.visible = true
		if ht>200 {
			ht=0
			h1.x = 1000
			h1.y = -1000
			h2.x = 1000
			h2.y = -1000
			h1.mask_index = noone
			h2.mask_index = noone
			if leftarm.destroy_arm && rightarm.destroy_arm {
				state = state_mouthopen
			} else {
				state = state_idle
				state_timer = 0
			}
		} else if ht>100 {
			h1.mask_index = sprite54
			h2.mask_index = sprite54
			h1.image_alpha = 1
			h2.image_alpha = 1
		} else {
			h1.mask_index = noone
			h2.mask_index = noone
			h1.image_alpha = 0.5
			h2.image_alpha = 0.5
			h1.x = h1_x
			h1.y = h1_y
			h2.x = h2_x
			h2.y = h2_y
		}
		
		
	}
	
	
} else if state==state_swallowing {
	
	timer++
	
	if timer>150 {
		head.image_index = 0
		tail_obj.stuck_check = false
		
		tail_obj.x = x
		tail_obj.y = y + 400
		if player_obj.k_fire_p {
			timer=0
			sword_pull_check()
			instance_destroy()
			
			instance_destroy(leftarm)
			
			instance_destroy(rightarm)
			instance_destroy(head)
		}
	} else {
		head.image_index = 1
		tail_obj.stuck_check = true
		tail_obj.x = x
		tail_obj.y = y
		player_obj.tail_planted = true
		player_obj.tail_pulling = false
		
	}
	
} else if state==state_mouthopen {
	leftarm.state = leftarm.state_defense
	rightarm.state = rightarm.state_defense
	
	head.image_index = 1
	timer++
	if timer>100 {
		leftarm.state = leftarm.state_idle
		rightarm.state = rightarm.state_idle
		state = state_idle
		timer=0
	}
	var lel = false
	with head {
		if place_meeting(x,y,tail_obj) {
			lel = true
			player_obj.tail_planted = true
		}
	}
	if lel {
		timer=0
		leftarm.state = leftarm.state_idle
		rightarm.state = rightarm.state_idle
		state = state_swallowing
	}
}

