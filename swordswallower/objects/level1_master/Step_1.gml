/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if firsttime {
	
	num_shields = instance_number(shield_spawner_obj)
	shields = array_create(num_shields)
	shields_b = array_create(num_shields)
	for(i=0;i<num_shields;i++) {
			shields[i] = instance_find(shield_spawner_obj,i)
			shields_b[i] = true
		}
		
	if room==subtemple01 {
		subtemple01init()	
		audio_play_sound(gmc,0,1)
	}
	if room==subtemple02 {
		for (i=0;i<instance_number(checkpoint1);i++) {
			instance_destroy(instance_find(checkpoint1,i))
		}
		checkpoints = array_create(100)
		available_checkpoints = 2
		checkpoint_num = 1
		player_obj.checkpoint_num = 1
		subtemple02init()	
		
		
	}
	if room==subtemple03 {
		

		for(i=0;i<num_shields;i++) {
			shields[i] = instance_find(shield_spawner_obj,i)
			shields_b[i] = true
		}
	
		checkpoints = array_create(100)
		available_checkpoints = 2
		checkpoint_num = 1
		player_obj.checkpoint_num = 1
		subtemple03init()	
	}
	
	if room==voidtemple01 {
		voidtemple01init()	
	}
	if room==machtemple01 {
		machtemple01init()
	}
	if room==airtemple01 {
		

		for(i=0;i<num_shields;i++) {
			shields[i] = instance_find(shield_spawner_obj,i)
			shields_b[i] = true
		}
	
		checkpoints = array_create(100)
		available_checkpoints = 2
		checkpoint_num = 1
		player_obj.checkpoint_num = 1
		airtemple01init()	
	}
	
	

}



if initialize {
	player_obj.shielded = shielded
	for(i=0;i<num_shields;i++) {
		shields[i].active = shields_b[i]
	}
	if room==subtemple02 {
		//audio_manager(gsound.m_feedbacker,0,true,0)	
		for(i=0;i<num_wooden_walls;i++) {
			if !checkpoint_manager.checkpoint.wooden_walls_b[i] {
				with wooden_walls[i] {
					instance_destroy()	
				}
			}
		}
		for(i=0;i<num_big_bois;i++) {
			if !checkpoint_manager.checkpoint.big_bois_b[i] {
				with big_bois[i] {
					instance_destroy()	
				}
			}
		}
		for(i=0;i<num_stinky_piles;i++) {
			stinky_piles[i].lit = checkpoint_manager.checkpoint.stinky_piles_b[i]
		}
		for(i=0;i<num_fog;i++) {
			if !fogs_b[i] {
				with fogs[i] {
					instance_destroy()	
				}
			}
		}
		for(i=0;i<num_switches;i++) {
			switches[i].enabled = checkpoint_manager.checkpoint.switches_b[i]
		}	
		for(i=0;i<num_die_blocks;i++) {
			if !die_blocks_b[i] {
				with die_blocks[i] {
					instance_destroy()	
				}
			}
		}	
	}
	if room==subtemple01 {
		if subtemple01ckptbool {
			instance_destroy(checkpointlol)	
		}
		for(i=0;i<num_switches;i++) {
			switches[i].enabled = switches_b[i]
		}	
		for(i=0;i<num_die_blocks;i++) {
			if !die_blocks_b[i] {
				with die_blocks[i] {
					instance_destroy()	
				}
			}
		}	
		for(i=0;i<num_chargers;i++) {
			if !chargers_b[i] {
				with chargers[i] {
					instance_destroy()	
				}
			}
		}
		for(i=0;i<num_boss_box;i++) {
			boss_box[i].enter = boss_box_b[i]
			boss_box[i].ended = boss_box_b2[i]
		}	
		for(i=0;i<num_fog;i++) {
			if !fogs_b[i] {
				with fogs[i] {
					instance_destroy()	
				}
			}
		}
		for(i=0;i<num_roomfog;i++) {
			if !roomfogs_b[i] {
				with roomfogs[i] {
					instance_destroy()	
				}
			}
		}
		
	}
	if room==subtemple03 {
		for(i=0;i<num_switches;i++) {
			switches[i].enabled = switches_b[i]
		}	
		for(i=0;i<num_die_blocks;i++) {
			if !die_blocks_b[i] {
				with die_blocks[i] {
					instance_destroy()	
				}
			}
		}	
		for(i=0;i<num_chargers;i++) {
			if !chargers_b[i] {
				with chargers[i] {
					instance_destroy()	
				}
			}
		}
		for(i=0;i<num_boss_box;i++) {
			boss_box[i].enter = boss_box_b[i]
			boss_box[i].ended = boss_box_b2[i]
		}	
		for(i=0;i<num_fog;i++) {
			if !fogs_b[i] {
				with fogs[i] {
					instance_destroy()	
				}
			}
		}
		for(i=0;i<num_roomfog;i++) {
			if !roomfogs_b[i] {
				with roomfogs[i] {
					instance_destroy()	
				}
			}
		}
		for(i=0;i<num_wooden_walls;i++) {
			if !wooden_walls_b[i] {
				with wooden_walls[i] {
					instance_destroy()	
				}
			}
		}
		for(i=0;i<num_big_bois;i++) {
			if !big_bois_b[i] {
				with big_bois[i] {
					instance_destroy()	
				}
			}
		}
		for(i=0;i<num_stinky_piles;i++) {
		
			stinky_piles[i].lit = stinky_piles_b[i]
		
		}
		
	}
	if room==airtemple01 {
		for(i=0;i<num_switches;i++) {
			switches[i].enabled = switches_b[i]
		}	
		for(i=0;i<num_die_blocks;i++) {
			if !die_blocks_b[i] {
				with die_blocks[i] {
					instance_destroy()	
				}
			}
		}	
		for(i=0;i<num_chargers;i++) {
			if !chargers_b[i] {
				with chargers[i] {
					instance_destroy()	
				}
			}
		}
		for(i=0;i<num_boss_box;i++) {
			boss_box[i].enter = boss_box_b[i]
			boss_box[i].ended = boss_box_b2[i]
		}	
		for(i=0;i<num_fog;i++) {
			if !fogs_b[i] {
				with fogs[i] {
					instance_destroy()	
				}
			}
		}
		for(i=0;i<num_roomfog;i++) {
			if !roomfogs_b[i] {
				with roomfogs[i] {
					instance_destroy()	
				}
			}
		}
		for(i=0;i<num_wooden_walls;i++) {
			if !wooden_walls_b[i] {
				with wooden_walls[i] {
					instance_destroy()	
				}
			}
		}
		for(i=0;i<num_big_bois;i++) {
			if !big_bois_b[i] {
				with big_bois[i] {
					instance_destroy()	
				}
			}
		}
		for(i=0;i<num_stinky_piles;i++) {
		
			stinky_piles[i].lit = stinky_piles_b[i]
		
		}
		
	}
	initialize = false
}

