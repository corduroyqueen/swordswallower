if checkpoint_manager.checkpoint!=self {
		lol = true	
	} else {
		lol = false	
	}
	refreshtext = true
	checkpoint_manager.checkpoint = self
	checkpoint_manager.rx = x
	checkpoint_manager.ry = y
	
	if setpoint {
		for (i=0;i<instance_number(shield_spawner_obj);i++) {
			xd = instance_find(shield_spawner_obj,i)
			xd.active = true	
		}	
	}
	
	with level1_master {
		for(i=0;i<num_shields;i++) {
			other.shields_b[i].active = shields[i].active
		}
	}
	
	if room==subtemple02 {
		with level1_master {
			for(i=0;i<num_wooden_walls;i++) {
				other.wooden_walls_b[i] = instance_exists(wooden_walls[i])
			}
			for(i=0;i<num_big_bois;i++) {
				other.big_bois_b[i] = instance_exists(big_bois[i])	
			}
			for(i=0;i<num_stinky_piles;i++) {
				other.stinky_piles_b[i] = stinky_piles[i].lit
			}
			for(i=0;i<num_switches;i++) {
				other.switches_b[i] = switches[i].enabled
			}
			if other.lol {
				organize_checkpoint_array(other.number)
			}
		
		
		}
	}
	if room==subtemple01 {
		with level1_master {
			for(i=0;i<num_switches;i++) {
				switches_b[i] = switches[i].enabled
			}
			for(i=0;i<num_boss_box;i++) {
				boss_box_b[i] = boss_box[i].enter
				boss_box_b2[i] = boss_box[i].ended
			}
			for(i=0;i<num_chargers;i++) {
				chargers_b[i] = instance_exists(chargers[i])	
			}
			if other.lol {
				organize_checkpoint_array(other.number)
			}
		}
	}
	if room==subtemple03 {
		with level1_master {
			for(i=0;i<num_switches;i++) {
				switches_b[i] = switches[i].enabled
			}
			for(i=0;i<num_boss_box;i++) {
				boss_box_b[i] = boss_box[i].enter
				boss_box_b2[i] = boss_box[i].ended
			}
			for(i=0;i<num_chargers;i++) {
				chargers_b[i] = instance_exists(chargers[i])	
			}
			for(i=0;i<num_wooden_walls;i++) {
				wooden_walls_b[i] = instance_exists(wooden_walls[i])
			}
			for(i=0;i<num_big_bois;i++) {
				big_bois_b[i] = instance_exists(big_bois[i])	
			}
			for(i=0;i<num_stinky_piles;i++) {
				stinky_piles_b[i] = stinky_piles[i].lit
			}
			if other.lol {
				organize_checkpoint_array(other.number)
			}
		}	
	}
	if room==machtemple01 {
		with level1_master {
			if other.lol {
				organize_checkpoint_array(other.number)
			}	
		}
	}
	
	if setpoint && player_obj.checkpoint_num>1 {
	
		level1_master.checkpoints[player_obj.checkpoint_num] = noone
		level1_master.checkpoints[player_obj.checkpoint_num-1] = noone
		num_to_lose = player_obj.checkpoint_num-1
		player_obj.checkpoint_num-=num_to_lose
		tempnum = player_obj.checkpoint_num
		level1_master.available_checkpoints+=num_to_lose
		//level1_master.checkpoints[0] = self
			
		for (i=0;i<level1_master.checkpoint_num-1;i++) {
			instance_destroy(level1_master.checkpoints[i])
			level1_master.checkpoints[i] = noone
		}
		
		level1_master.checkpoints[0] = self
		level1_master.checkpoint_num = tempnum
		checkpoint_manager.checkpoint = self
		
		
		player_obj.checkpoint_num = level1_master.checkpoint_num
		number = 0
		checkpoint_manager.checkpoint = self
		checkpoint_manager.rx = x
		checkpoint_manager.ry = y
		level1_master.hello = self
	}