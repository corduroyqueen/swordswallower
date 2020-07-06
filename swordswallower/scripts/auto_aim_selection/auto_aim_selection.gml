

lel = instance_create_depth(x,y,depth,auto_aim_check_obj)
with lel {
	x = player_obj.x
	y = player_obj.y
	image_angle = point_direction(player_obj.x,player_obj.y,global.mousepx,global.mousepy)
	image_xscale = 400
	image_yscale = 1.5
	img=0

	cool_list = ds_list_create()
	final_list = ds_list_create()

	cool_list = collision_list(x,y,all)

	//if !ds_list_empty(cool_list)
	if cool_list!=noone{
	
		for (i=0;i<ds_list_size(cool_list);i++){
	
			if variable_instance_exists(cool_list[| i],"auto_aim") {
				if cool_list[| i].auto_aim==true {
					ds_list_add(final_list,cool_list[| i])
				}                                  
			}
		
			//cool_list[| i].image_blend = c_purple
			//ds_list_add(ui_manager.cool_list,cool_list[| i])
	
		}
	
		ds_list_destroy(cool_list)
	}
	
	if ds_list_size(final_list)>0 {
		distance = 3000
		target = noone
		for (i=0;i<ds_list_size(final_list);i++) {
			agh = point_distance(player_obj.x,player_obj.y,final_list[| i].x,final_list[| i].y)
			if agh<distance && agh>300 {
				distance=agh
				target = final_list[| i]
			}
		}
		if instance_exists(target) {
			global.mousepx = target.x
			global.mousepy = target.y 
		}
	} 
	ds_list_destroy(final_list)
}

