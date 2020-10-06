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
			attack = choose(3,4)
		} else if leftarm.destroy_arm {
			attack = choose(2,3,4)
			attack = 2
		} else {
			attack = choose(1,3,4)
			attack = 1
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
		if leftarm.state == leftarm.state_recovery || leftarm.destroy_arm {
			state = state_idle
			rightarm.state = rightarm.state_idle
		}
	} else if attack==attack_right_lunge {
		leftarm.state = leftarm.state_defense
		if rightarm.state == rightarm.state_idle {
			rightarm.state = rightarm.state_anticipation
		}
		if rightarm.state == rightarm.state_recovery || rightarm.destroy_arm {
			state = state_idle
		}
	} else if attack==attack_cough_flies {
		head.image_index = 1
		var spawn_num = floor(random_range(4,10))
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
		var spawn_num = floor(random_range(1,3))
		for(var i=0;i<spawn_num;i++) {
			//fly1 = instance_create_depth(x-200,y-100,depth,flyfree_obj)
			
			//var ang = random_range(120,240)
			//var spd = random_range(3,20)
			//fly1.hsp = dcos(ang) * spd
			//fly1.vsp = dsin(ang) * spd
			//fly1.inv_timer=15
			//fly1.state = 1
			//fly1.spawn = true
			//fly1.eyespr = choose(greeneye,pinkeye)
		}
		if leftarm.destroy_arm && rightarm.destroy_arm {
			state = state_mouthopen
		} else {
			state = state_idle
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

