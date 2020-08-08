/// @description Insert description here
// You can write your code in this editor
//if checkpoint_manager.checkpoint!=self {

if firsttime {
	num_shields = instance_number(shield_spawner_obj)
	shields = array_create(num_shields)
	shields_b = array_create(num_shields)
	
	 if checkpoint_manager.checkpoint == self {
		 starting_bool = true
	 }
	
	
	with level1_master {
		for(i=0;i<num_shields;i++) {
			other.shields_b[i] = shields[i].active
		}	
	}
}

if room==subtemple02 {
	if firsttime {
		
		wooden_walls = array_create(level1_master.num_wooden_walls)
		big_bois = array_create(level1_master.num_big_bois)
		stinky_piles = array_create(level1_master.num_stinky_piles)

		wooden_walls_b = array_create(level1_master.num_wooden_walls)
		big_bois_b = array_create(level1_master.num_big_bois)
		stinky_piles_b = array_create(level1_master.num_stinky_piles)
		if instance_exists(big_boi_time){
			big_boi_bool = big_boi_time.special_guy
		}
		switches = array_create(level1_master.num_switches)
		switches_b = array_create(level1_master.num_switches)
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
		}
		checkpoint_manager.checkpoint = self
		checkpoint_manager.rx = x
		checkpoint_manager.ry = y
		firsttime = false
	}
}

if room==subtemple01 {
	if firsttime {
		switches = array_create(level1_master.num_switches)
		switches_b = array_create(level1_master.num_switches)
		
		chargers = array_create(level1_master.num_chargers)
		chargers_b = array_create(level1_master.num_chargers)
		
		boss_box = array_create(level1_master.num_boss_box)
		boss_box_b = array_create(level1_master.num_boss_box)
		boss_box_b2 = array_create(level1_master.num_boss_box)
		
		//wooden_walls = array_create(level1_master.num_wooden_walls)
		//big_bois = array_create(level1_master.num_big_bois)
		//stinky_piles = array_create(level1_master.num_stinky_piles)

		//wooden_walls_b = array_create(level1_master.num_wooden_walls)
		//big_bois_b = array_create(level1_master.num_big_bois)
		//stinky_piles_b = array_create(level1_master.num_stinky_piles)
		
		with level1_master {
			for(i=0;i<num_switches;i++) {
				other.switches_b[i] = switches[i].enabled
			}	
			for(i=0;i<num_boss_box;i++) {
				other.boss_box_b[i] = boss_box[i].enter
				other.boss_box_b2[i] = boss_box[i].ended
			}	
			for(i=0;i<num_chargers;i++) {
				other.chargers_b[i] = instance_exists(chargers[i])	
			}
		}
		checkpoint_manager.checkpoint = self
		checkpoint_manager.rx = x
		checkpoint_manager.ry = y
		firsttime = false
	}
}

if room==subtemple03 {
	if firsttime {
		switches = array_create(level1_master.num_switches)
		switches_b = array_create(level1_master.num_switches)
		
		chargers = array_create(level1_master.num_chargers)
		chargers_b = array_create(level1_master.num_chargers)
		
		boss_box = array_create(level1_master.num_boss_box)
		boss_box_b = array_create(level1_master.num_boss_box)
		boss_box_b2 = array_create(level1_master.num_boss_box)
		
		with level1_master {
			for(i=0;i<num_switches;i++) {
				other.switches_b[i] = switches[i].enabled
			}	
			for(i=0;i<num_boss_box;i++) {
				other.boss_box_b[i] = boss_box[i].enter
				other.boss_box_b2[i] = boss_box[i].ended
			}	
			for(i=0;i<num_wooden_walls;i++) {
				other.wooden_walls_b[i] = instance_exists(wooden_walls[i])
			}
			for(i=0;i<num_big_bois;i++) {
				other.big_bois_b[i] = instance_exists(big_bois[i])	
			}
			for(i=0;i<num_stinky_piles;i++) {
				other.stinky_piles_b[i] = stinky_piles[i].lit
			}
			for(i=0;i<num_chargers;i++) {
				other.chargers_b[i] = instance_exists(chargers[i])	
			}
		}
		checkpoint_manager.checkpoint = self
		checkpoint_manager.rx = x
		checkpoint_manager.ry = y
		firsttime = false
	}
}

if room==airtemple01 {
	if firsttime {
		switches = array_create(level1_master.num_switches)
		switches_b = array_create(level1_master.num_switches)
		
		chargers = array_create(level1_master.num_chargers)
		chargers_b = array_create(level1_master.num_chargers)
		
		boss_box = array_create(level1_master.num_boss_box)
		boss_box_b = array_create(level1_master.num_boss_box)
		boss_box_b2 = array_create(level1_master.num_boss_box)
		
		with level1_master {
			for(i=0;i<num_switches;i++) {
				other.switches_b[i] = switches[i].enabled
			}	
			for(i=0;i<num_boss_box;i++) {
				other.boss_box_b[i] = boss_box[i].enter
				other.boss_box_b2[i] = boss_box[i].ended
			}	
			for(i=0;i<num_wooden_walls;i++) {
				other.wooden_walls_b[i] = instance_exists(wooden_walls[i])
			}
			for(i=0;i<num_big_bois;i++) {
				other.big_bois_b[i] = instance_exists(big_bois[i])	
			}
			for(i=0;i<num_stinky_piles;i++) {
				other.stinky_piles_b[i] = stinky_piles[i].lit
			}
			for(i=0;i<num_chargers;i++) {
				other.chargers_b[i] = instance_exists(chargers[i])	
			}
		}
		checkpoint_manager.checkpoint = self
		checkpoint_manager.rx = x
		checkpoint_manager.ry = y
		firsttime = false
	}
}

if room==machtemple01 {
	if firsttime {
		checkpoint_manager.checkpoint = self
		checkpoint_manager.rx = x
		checkpoint_manager.ry = y
		firsttime = false
	}
}

if !place_meeting(x,y,player_obj) && !place_meeting(x,y,tail_obj) {
	ready  = true	
}

if player_obj.tail_carry {
	thrown = false	
}

if !setpoint {
	with player_obj {
		if place_meeting(other.x,other.y+2,wall_parent_obj){
			other.vsp=0	
		} else {
			other.vsp+=0.2
			other.vsp = clamp(other.vspeed,0,15)
		}
	}
}