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
	
	num_cgems = instance_number(cgem_obj)
	cgems = array_create(num_cgems)
	cgems_b = array_create(num_cgems)
	
	for(i=0;i<num_cgems;i++) {
		cgems[i] = instance_find(cgem_obj,i)
		cgems_b[i] = false
	}
		
	if room==subtemple01 {
		px_layer_sky = layer_get_id("px_sky")
		px_layer_sky_amt = 1.01
		px_layer_bkd2 = layer_get_id("px_bkd2")
		px_layer_bkd2_amt = 1.03
		px_layer_bkd1 = layer_get_id("px_bkd1")
		px_layer_bkd1_amt = 1.04
		px_layer_near2 = layer_get_id("px_near2")
		px_layer_near2_amt = 15
		px_layer_near1 = layer_get_id("px_near1")
		px_layer_near1_amt = 30
		var s = -1
			s= layer_get_id("px_sky")
			layer_sprite_destroy(layer_sprite_get_id(s,"mooneye1"))
			layer_sprite_destroy(layer_sprite_get_id(s,"mooneye2"))
			layer_sprite_destroy(layer_sprite_get_id(s,"mooneye3"))
			layer_sprite_destroy(layer_sprite_get_id(s,"mooneye4"))
			layer_sprite_destroy(layer_sprite_get_id(s,"mooneye5"))
			layer_sprite_destroy(layer_sprite_get_id(s,"mooneye6"))
		
		//layer_parallax_normalize_x(px_layer_sky_amt,px_layer_sky)
		layer_parallax_normalize_x(px_layer_near1_amt,px_layer_near1)
		layer_parallax_normalize_y(px_layer_near1_amt,px_layer_near1)
		layer_parallax_normalize_x(px_layer_near2_amt,px_layer_near2)
		layer_parallax_normalize_y(px_layer_near2_amt,px_layer_near2)
		
		subtemple01init()	
		//fireflies_particle_system_obj.spawn = true
		//audio_play_sound(gmc,0,1)
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
	if room==drycity01 {
		//for (i=0;i<instance_number(checkpoint1);i++) {
	//		instance_destroy(instance_find(checkpoint1,i))
	//	}
		checkpoints = array_create(100)
		available_checkpoints = 2
		checkpoint_num = 1
		player_obj.checkpoint_num = 1
		waterbool = false
		drycity01init()
	}
	if room==illusionforest01 {
		//for (i=0;i<instance_number(checkpoint1);i++) {
	//		instance_destroy(instance_find(checkpoint1,i))
	//	}
		checkpoints = array_create(100)
		available_checkpoints = 2
		checkpoint_num = 1
		player_obj.checkpoint_num = 1
		waterbool = false
		illusion = 3
		illusion_s = 3
		illusionforest01init()
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
	
	
	player_obj.camx = checkpoint_manager.checkpoint.x - player_obj.cam_width_h
	player_obj.camy = checkpoint_manager.checkpoint.y - player_obj.cam_height_h
	
	//wall_obj.visible = walls_visible
	//black_wall_obj.visible = black_walls_visible
	//spike.visible = spikes_visible
	//thin_floor_obj.visible = thin_floor_visible
	
	player_obj.shielded = shielded
	
	player_obj.gems = p_cgems
	
	for(i=0;i<num_shields;i++) {
		shields[i].active = shields_b[i]
	}
	for(i=0;i<num_cgems;i++) {
		cgems[i].pickedup = cgems_b[i]
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
		if zone4 {
			var s = -1
			s= layer_get_id("px_sky")
			var l = -1
			l = layer_sprite_get_id(s, "moon_ass")
			layer_sprite_change(l,moon1)
		} else {
			var s = -1
			s= layer_get_id("px_sky")
			layer_sprite_destroy(layer_sprite_get_id(s,"mooneye1"))
			layer_sprite_destroy(layer_sprite_get_id(s,"mooneye2"))
			layer_sprite_destroy(layer_sprite_get_id(s,"mooneye3"))
			layer_sprite_destroy(layer_sprite_get_id(s,"mooneye4"))
			layer_sprite_destroy(layer_sprite_get_id(s,"mooneye5"))
			layer_sprite_destroy(layer_sprite_get_id(s,"mooneye6"))
		}
		layer_parallax_normalize_x(px_layer_near1_amt,px_layer_near1)
		layer_parallax_normalize_y(px_layer_near1_amt,px_layer_near1)
		layer_parallax_normalize_x(px_layer_near2_amt,px_layer_near2)
		layer_parallax_normalize_y(px_layer_near2_amt,px_layer_near2)
		
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
		for(i=0;i<num_keydoors;i++) {
			if !keydoors_b[i] {
				with keydoors[i] {
					closed = false
				}
			}
		}
		for(i=0;i<num_keys;i++) {
			if keys_b[i] && keys_b2[i] {
				with keys[i] {
					following = true
					x = checkpoint_manager.checkpoint.x-10
					y = checkpoint_manager.checkpoint.y-10
					ds_list_add(player_obj.keylist, self)
				}
			}
			if !keys_b2[i] {
				with keys[i] {
					instance_destroy()	
				}
			}
		}
		for(i=0;i<num_boss_box;i++) {
			//boss_box[i].enter = boss_box_b[i]
			//boss_box[i].ended = boss_box_b2[i]
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
	if room==drycity01 {
		for(i=0;i<num_wooden_walls;i++) {
			if !wooden_walls_b[i] {
				with wooden_walls[i] {
					instance_destroy()	
				}
			}
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
		for(i=0;i<num_keydoors;i++) {
			if !keydoors_b[i] {
				with keydoors[i] {
					closed = false
				}
			}
		}
		for(i=0;i<num_keys;i++) {
			if keys_b[i] && keys_b2[i] {
				with keys[i] {
					following = true
					x = checkpoint_manager.checkpoint.x-10
					y = checkpoint_manager.checkpoint.y-10
					ds_list_add(player_obj.keylist, self)
				}
			}
			if !keys_b2[i] {
				with keys[i] {
					instance_destroy()	
				}
			}
		}
		for(i=0;i<num_boss_box;i++) {
			//boss_box[i].enter = boss_box_b[i]
			//boss_box[i].ended = boss_box_b2[i]
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
		
		
		for(i=0;i<num_big_bois;i++) {
			if !big_bois_b[i] {
				with big_bois[i] {
					instance_destroy()	
				}
			}
		}
		for(i=0;i<num_stinky_piles;i++) {
			stinky_piles[i].lit = checkpoint_manager.checkpoint.stinky_piles_b[i]
		}
		
		
		
		for(i=0;i<num_die_blocks;i++) {
			if !die_blocks_b[i] {
				with die_blocks[i] {
					instance_destroy()	
				}
			}
		}	
		
	}
	
	if room==illusionforest01 {
		
		for(i=0;i<num_burn_walls;i++) {
			if !burn_walls_b[i] {
				with burn_walls[i] {
					instance_destroy()	
				}
			}
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
		for(i=0;i<num_keydoors;i++) {
			if !keydoors_b[i] {
				with keydoors[i] {
					closed = false
				}
			}
		}
		for(i=0;i<num_ghosts;i++) {
			 ghosts[i].alive = ghosts_b[i]
		}
		for(i=0;i<num_keys;i++) {
			if keys_b[i] && keys_b2[i] {
				with keys[i] {
					following = true
					x = checkpoint_manager.checkpoint.x-10
					y = checkpoint_manager.checkpoint.y-10
					ds_list_add(player_obj.keylist, self)
				}
			}
			if !keys_b2[i] {
				with keys[i] {
					instance_destroy()	
				}
			}
		}
		for(i=0;i<num_boss_box;i++) {
			//boss_box[i].enter = boss_box_b[i]
			//boss_box[i].ended = boss_box_b2[i]
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
		
		
		for(i=0;i<num_big_bois;i++) {
			if !big_bois_b[i] {
				with big_bois[i] {
					instance_destroy()	
				}
			}
		}
		for(i=0;i<num_torchs;i++) {
			torchs[i].lit = torchs_b[i]
		}
		
		
		
		for(i=0;i<num_die_blocks;i++) {
			if !die_blocks_b[i] {
				with die_blocks[i] {
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


