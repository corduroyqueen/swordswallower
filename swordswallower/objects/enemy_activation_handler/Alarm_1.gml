/// @description Insert description here
// You can write your code in this editor


for(var a=0;a<num;a++) {
	
	if enemy_seen[| a] {
		continue	
	}
	var inst = enemy_list[| a]
	
	if in_camera_range_bigger(inst.x,inst.y) {
		enemy_seen[| a] = true
		instance_activate_object(inst)
	}
	
	
}

alarm[1] = 2