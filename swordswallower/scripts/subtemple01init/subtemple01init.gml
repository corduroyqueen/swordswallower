hello = instance_create_depth(checkpoint_manager.x,checkpoint_manager.y,0,checkpoint1)	
checkpoints[0] = hello
hello.number = 0
hello.setpoint = true
checkpoint_manager.checkpoint = hello
		
num_switches = instance_number(switch_wall_switch_obj)
switches = array_create(num_switches)
switches_b = array_create(num_switches)

subtemple01ckptbool = false


for(i=0;i<num_switches;i++) {
	switches[i] = instance_find(switch_wall_switch_obj,i)
	switches_b[i] = false
}

num_chargers = instance_number(charger_obj)
chargers = array_create(num_chargers)
chargers_b = array_create(num_chargers)

for(i=0;i<num_chargers;i++) {
	chargers[i] = instance_find(charger_obj,i)
	chargers_b[i] = true
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

available_checkpoints = 0
ui_manager.show_checkpoints = false
firsttime = false