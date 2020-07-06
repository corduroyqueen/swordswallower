available_checkpoints = 1
room_set_persistent(room,false)
hello = instance_create_depth(player_obj.x,player_obj.y,0,checkpoint1)	
checkpoint_manager.checkpoint = hello
checkpoints[0] = hello
hello.number = 0
hello.setpoint = true

num_wooden_walls = instance_number(wood_wall_obj)
num_big_bois = instance_number(big_boi_obj)
num_stinky_piles = instance_number(stinky_pile_obj)
		
wooden_walls = array_create(num_wooden_walls)
wooden_walls_b = array_create(num_wooden_walls)
for(i=0;i<num_wooden_walls;i++) {
	wooden_walls[i] = instance_find(wood_wall_obj,i)
	wooden_walls_b[i] = true
}

big_bois = array_create(num_big_bois)
stinky_piles = array_create(num_stinky_piles)


big_bois_b = array_create(num_big_bois)
stinky_piles_b = array_create(num_stinky_piles)
big_boi_bool = big_boi_time.special_guy
		
num_switches = instance_number(switch_wall_switch_obj)
switches = array_create(num_switches)
switches_b = array_create(num_switches)
for(i=0;i<num_switches;i++) {
	switches[i] = instance_find(switch_wall_switch_obj,i)
	switches_b[i] = false
}
		

		
for(i=0;i<num_big_bois;i++) {
	big_bois[i] = instance_find(big_boi_obj,i)
	big_bois_b[i] = true
}
	
		
for(i=0;i<num_stinky_piles;i++) {
	stinky_piles[i] = instance_find(stinky_pile_obj,i)
	stinky_piles_b[i] = stinky_piles[i].lit
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