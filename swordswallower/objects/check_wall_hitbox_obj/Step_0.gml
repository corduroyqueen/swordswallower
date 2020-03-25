/// @description Insert description here
// You can write your code in this editor




cool_list = collision_list(x,y,wall_obj)

//if !ds_list_empty(cool_list)
if cool_list!=noone{
	
	for (i=0;i<ds_list_size(cool_list);i++){
	
		cool_list[| i].intangible = true
		//cool_list[| i].image_blend = c_purple
		//ds_list_add(ui_manager.cool_list,cool_list[| i])
	
	}
	
	ds_list_destroy(cool_list)
}


if point_distance(player_hitbox_check_obj.x,player_hitbox_check_obj.y,player_obj.x,player_obj.y)<10 {
	reset_intangibility()	
}

if !mouse_check_button(mb_right) {
	reset_intangibility()	
}

instance_destroy()