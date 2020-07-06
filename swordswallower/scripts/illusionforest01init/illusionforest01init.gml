available_checkpoints = 1
room_set_persistent(room,false)
hello = instance_create_depth(player_obj.x,player_obj.y,0,checkpoint1)	
checkpoint_manager.checkpoint = hello
checkpoints[0] = hello
hello.number = 0
hello.setpoint = true

num_burn_walls = instance_number(burn_wall_obj)
num_big_bois = instance_number(big_boi_obj)
num_torchs = instance_number(torch_obj)
		
burn_walls = array_create(num_burn_walls)
big_bois = array_create(num_big_bois)
torchs = array_create(num_torchs)

burn_walls_b = array_create(num_burn_walls)
big_bois_b = array_create(num_big_bois)
torchs_b = array_create(num_torchs)


num_switches = instance_number(switch_wall_switch_obj)
switches = array_create(num_switches)
switches_b = array_create(num_switches)
for(i=0;i<num_switches;i++) {
	switches[i] = instance_find(switch_wall_switch_obj,i)
	switches_b[i] = false
}

num_ghosts = instance_number(character_ghost_obj)
ghosts = array_create(num_ghosts)
ghosts_b = array_create(num_ghosts)
for(i=0;i<num_ghosts;i++) {
	ghosts[i] = instance_find(character_ghost_obj,i)
	ghosts_b[i] = true
}
		
for(i=0;i<num_burn_walls;i++) {
	burn_walls[i] = instance_find(burn_wall_obj,i)
	burn_walls_b[i] = true
}
		
for(i=0;i<num_big_bois;i++) {
	big_bois[i] = instance_find(big_boi_obj,i)
	big_bois_b[i] = true
}
	
		
for(i=0;i<num_torchs;i++) {
	torchs[i] = instance_find(torch_obj,i)
	torchs_b[i] = torchs[i].lit
}
		
		

num_chargers = instance_number(charger_obj)
chargers = array_create(num_chargers)
chargers_b = array_create(num_chargers)
	
for(i=0;i<num_chargers;i++) {
	chargers[i] = instance_find(charger_obj,i)
	chargers_b[i] = true
}

num_keydoors = instance_number(key_door_obj)
keydoors = array_create(num_keydoors)
keydoors_b = array_create(num_keydoors)

for(i=0;i<num_keydoors;i++) {
	keydoors[i] = instance_find(key_door_obj,i)
	keydoors_b[i] = true
}

num_keys = instance_number(key_obj)
keys = array_create(num_keys)
keys_b = array_create(num_keys)
keys_b2 = array_create(num_keys)

for(i=0;i<num_keys;i++) {
	keys[i] = instance_find(key_obj,i)
	keys_b[i] = false
	keys_b2[i] = true
}



num_boss_box = instance_number(boss_room_collision_obj)
boss_box = array_create(num_boss_box)
boss_box_b = array_create(num_boss_box)
boss_box_b2 = array_create(num_boss_box)

for(i=0;i<num_boss_box;i++) {
	boss_box[i] = instance_find(boss_room_collision_obj,i)
	boss_box_b[i] = false
	boss_box_b2[i] = false
}

		
num_die_blocks = instance_number(touch_die_block_obj)
die_blocks = array_create(num_die_blocks)
die_blocks_b = array_create(num_die_blocks)
for(i=0;i<num_die_blocks;i++) {
	die_blocks[i] = instance_find(touch_die_block_obj,i)
	die_blocks_b[i] = true
}
		
		
		
		
num_fog = instance_number(fog_obj)
		
fogs = array_create(num_fog)
fogs_b = array_create(num_fog)
for(i=0;i<num_fog;i++) {
	fogs[i] = instance_find(fog_obj,i)
	fogs_b[i] = true
	fogs[i].image_alpha = 0
	//fogs[i].mask_index = noone
}

num_roomfog = instance_number(grey_obj)

roomfogs = array_create(num_roomfog)
roomfogs_b = array_create(num_roomfog)
for(i=0;i<num_roomfog;i++) {
	roomfogs[i] = instance_find(grey_obj,i)
	roomfogs_b[i] = true
	roomfogs[i].image_alpha = 0
	//fogs[i].mask_index = noone
}

num_die_blocks = instance_number(touch_die_block_obj)
die_blocks = array_create(num_die_blocks)
die_blocks_b = array_create(num_die_blocks)
for(i=0;i<num_die_blocks;i++) {
	die_blocks[i] = instance_find(touch_die_block_obj,i)
	die_blocks_b[i] = true
}

		
firsttime = false