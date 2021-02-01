/// @description Insert description here
// You can write your code in this editor

//sdm("start activation")
if player_obj.death {
	return
}
for(var a=0;a<num;a++) {
	//sdm(a)
	var inst = enemy_list[| a]
	if enemy_seen[| a] || is_undefined(inst) {
		continue	
	}
	//sdm(object_get_name(inst.object_index))
	//sdm(inst.id)
	//sdm(inst.x)
	//sdm(inst.y)
	//sdm(a)
	if inst.x == 19502 {
		//sdm("first")
		//sdm(inst.x)
		//sdm(inst.y)
		//sdm(instance_exists(id))
		//sdm(enemy_active[| a])
	}
	if inst.x == 19284 {
		//sdm("scd")
		//sdm(inst.x)
		//sdm(inst.y)
		//sdm(instance_exists(id))
		//sdm(enemy_active[|a])
		//sdm(object_get_name(inst.object_index))
	}
	//sdm(inst.id)
	if in_camera_range_bigger(inst.x,inst.y) {
		enemy_seen[| a] = true
		//sdm(object_get_name(inst.object_index))
		//sdm("activate")
		//enemy_active[| a] = true
		instance_activate_object(inst)
	}
	
	
}

alarm[1] = 2