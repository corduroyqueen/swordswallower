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
	//if in_camera_range_bigger(enemy_x[| a],enemy_y[| a]) {
	//	enemy_seen[| a] = true
	//	instance_activate_object(enemy_list[| a])
	//}
}
alarm[1] = 2