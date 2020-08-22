

iteration_num = 8;
xdelt = x - xpreva;
ydelt = y - ypreva;

for(i=0; i < iteration_num; i++) {
	var xc = xpreva + xdelt * (i/iteration_num), 
	var yc = ypreva + ydelt * (i/iteration_num),
	if !place_meeting(xc,yc,enemy_parent_obj) {
			
	} else {
		//ds_list_clear(enemy_collided_list)
		enemy_collided_list = instance_place_list(xc,yc,enemy_parent_obj,enemy_collided_list,false)
		//sdm("en")
		//sdm(ds_list_size(enemy_collided_list))
		//for (i = 0; i<ds_list_size(enemy_collided_list); i++) {
		//	sdm(object_get_name(enemy_collided_list[| i].object_index))
		//}
		for (i = 0; i<ds_list_size(enemy_collided_list); i++) {
			var collision = enemy_collided_list[| i]
			if !instance_exists(collision) {
				continue	
			}
			ds_list_add(enemy_collided_total_list,collision)
			
			if object_get_parent(collision.object_index)==fly_parent_obj {
				//flies
				if !tail_obj.stinky && !player_obj.stinky_check {
					enemy_default_player_collision(collision)
				}
			} else if collision.object_index==cryptkeeper_obj {
				//cryptkeeper
				enemy_default_player_collision(collision)
			} else if object_get_parent(collision.object_index)==kill_on_dash_parent_obj {
				//enemies that die when youre dashing and nothing else
				//ie - snake hearts, breakable obejcts
				enemy_killondash_player_collision(collision)
			} else if object_get_parent(collision.object_index)==killalways_parent_obj {
				//things that kill you on touch always
				//ie - spikes, snake heads
				enemy_damage_player_collision(collision)
			} else if object_get_parent(collision.object_index)==kill_notondash_parent_obj {
				//things that kill you on touch except when youre dashing
				//ie nothing right now
				if !zoom_hitbox_active {
					enemy_damage_player_collision(collision)
				}
			} else if object_get_parent(collision.object_index)==toggle_hitbox_enemy_parent_obj {
				//things whose hitboxes turn on and off
				//once hitbox is on, it is treated like another type
				//might need more statements?
				//ie minotaurs, deathweeds
				if collision.hitbox_on {
					enemy_damage_player_collision(collision)
				}
			}
			instance_deactivate_object(collision)	
			
		}
		ds_list_clear(enemy_collided_list)
	}
}	

for (i = 0; i < ds_list_size(enemy_collided_total_list); i++) {
	instance_activate_object(enemy_collided_total_list[| i])
}
ds_list_clear(enemy_collided_total_list)

damage_start = false


//if collision_line(xpreva,ypreva,x,y,enemy_parent_obj,false,true) {
//	var enemy_count = collision_line_list(xpreva,ypreva,x,y,enemy_parent_obj,false,true,enemy_collided_list,true)
//	for (var i = 0; i < enemy_count; i++;) {
//		//enemy_collided_list[| i]
			
//	}
//	ds_list_clear(enemy_collided_list)
//  damage_start = false
//}