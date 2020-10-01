//fuck yes

if state==state_idle {
	
	state_timer++
	
	if state_timer>500 {
		attack = choose(1,3,4)
		attack = choose(1)
		state_timer=0
		state=state_attacking
	}
	
} else if state==state_attacking {
	
	if attack==attack_left_lunge {
		rightarm.state = rightarm.state_defense
		if leftarm.state == leftarm.state_idle {
			leftarm.state = leftarm.state_anticipation
		}
		if leftarm.state == leftarm.state_recovery {
			state = state_idle
			rightarm.state = rightarm.state_idle
		}
	} else if attack==attack_right_lunge {
		leftarm.state = leftarm.state_defense
		if rightarm.state == rightarm.state_idle {
			rightarm.state = rightarm.state_anticipation
		}
		if rightarm.state == rightarm.state_recovery {
			state = state_idle
		}
	} else if attack==attack_cough_flies {
		var spawn_num = floor(random_range(4,10))
		for(var i=0;i<spawn_num;i++) {
			fly1 = instance_create_depth(x-200,y-100,depth,flyfree_obj)
			
			var ang = random_range(120,240)
			var spd = random_range(3,20)
			fly1.hsp = dcos(ang) * spd
			fly1.vsp = dsin(ang) * spd
			fly1.inv_timer=15
			fly1.state = 1
			fly1.spawn = true
			fly1.eyespr = choose(greeneye,pinkeye)
		}
		state = state_idle
	} else if attack==attack_cough_tar {
		var spawn_num = floor(random_range(1,3))
		for(var i=0;i<spawn_num;i++) {
			fly1 = instance_create_depth(x-200,y-100,depth,flyfree_obj)
			
			var ang = random_range(120,240)
			var spd = random_range(3,20)
			fly1.hsp = dcos(ang) * spd
			fly1.vsp = dsin(ang) * spd
			fly1.inv_timer=15
			fly1.state = 1
			fly1.spawn = true
			fly1.eyespr = choose(greeneye,pinkeye)
		}
		state = state_idle
	}
	
	
} else if state==state_swallowing {
	
	timer++
	
	if timer>150 {
		
	}
	
}