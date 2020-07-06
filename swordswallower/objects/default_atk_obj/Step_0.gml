/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y,player_obj) {
	damage_script(10,sign(player_obj.x-x),1,1)
	instance_destroy()	
}

timer--
if timer<0 {
	instance_destroy()	
}

if destructive {
	cool_list = ds_list_create()
	
	cool_list = collision_list(x,y,all)

	//if !ds_list_empty(cool_list)
	if cool_list!=noone{
	
		for (i=0;i<ds_list_size(cool_list);i++){
			if variable_instance_exists(cool_list[| i],"hp") {
				cool_list[| i].hp = -1
			}
			if variable_instance_exists(cool_list[| i],"death") {
				cool_list[| i].death = true
			}
	
		}
	
		ds_list_destroy(cool_list)
	}
	player_obj.shake_d=20
		player_obj.camera_shake_d = true

}