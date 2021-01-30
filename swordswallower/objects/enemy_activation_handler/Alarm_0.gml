/// @description Insert description here
// You can write your code in this editor

num = instance_number(enemy_parent_obj)


for(var a=0;a<num;a++) {
	var addition = instance_find(enemy_parent_obj,a)
	
	ds_list_add(enemy_list,addition)
	ds_list_add(enemy_seen,false)
	ds_list_add(enemy_active,false)
	//ds_list_add(enemy_x,addition.x)
	//ds_list_add(enemy_y,addition.y)
}
instance_deactivate_object(enemy_parent_obj)
alarm[1] = 2