//fuck yes

num = instance_number(enemy_parent_obj)

ds_list_clear(enemy_list)
ds_list_clear(enemy_seen)
ds_list_clear(enemy_active)
for(var a=0;a<num;a++) {
	var addition = instance_find(enemy_parent_obj,a)
	
	ds_list_add(enemy_list,addition)
	ds_list_add(enemy_seen,false)
	ds_list_add(enemy_active,false)
	//ds_list_add(enemy_x,addition.x)
	//ds_list_add(enemy_y,addition.y)
}
instance_deactivate_object(enemy_parent_obj)

/// @description Insert description here
// You can write your code in this editor

if player_obj.death {
	return
}
for(var a=0;a<num;a++) {
	//sdm(a)
	if enemy_seen[| a] {
		continue	
	}
	var inst = enemy_list[| a]
	//sdm(a)
	//sdm(inst.id)
	if in_camera_range_bigger(inst.x,inst.y) {
		enemy_seen[| a] = true
		//enemy_active[| a] = true
		instance_activate_object(inst)
	}
	
	
}
