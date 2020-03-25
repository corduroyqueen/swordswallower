/// @description Insert description here
// You can write your code in this editor

mask_index = player_idle
if sprite.sprite_index == player_crouching || sprite.sprite_index == player_crouching_s {
	mask_index = player_crouching
}
audio_listener_position(x,y,0)
//sprite.sprite_index

if hp<=0 {
	start_death = true
	
}
if shielded {
	hp = 2
} else {
	if hp>1 {
		hp = 1	
	}	
}
//TO DO
//make checkpoint organizing array


if start_death {
	//audio_stop_all()
	death = true
	hspeed = 0
	vspeed = 0
	start_death = false
}

if death {
	just_blood(hspeed,vspeed,0.2,30,false,sprite_width/4,sprite_height)	
	move_locked = true
	tail_carry = true
	hspeed = 0
	vspeed = 0
} else {
	
	if mouse_check_button(mb_left) && grounded && speed<5
	&& point_distance(player_obj.x,player_obj.y,tail_obj.x,tail_obj.y)<30
	&& ckpt_place_toggle{
		start_ckpt_timer++	
	} else {
		start_ckpt_timer = 0
	}
	
	if mouse_check_button_released(mb_left) {
		ckpt_place_toggle = true	
	}
	/*
	if place_meeting(x,y,checkpoint_manager.checkpoint) {
		
		if keyboard_check_pressed(ord("E")) {
			if !instance_place(x,y,checkpoint_manager.checkpoint).setpoint {
				instance_destroy(checkpoint_manager.checkpoint)
				level1_master.checkpoints[checkpoint_num] = 0
				checkpoint_num--
	
				level1_master.available_checkpoints++
				checkpoint_manager.checkpoint = level1_master.checkpoints[checkpoint_num-1]
	
				checkpoint_manager.rx = checkpoint_manager.checkpoint.x
				checkpoint_manager.ry = checkpoint_manager.checkpoint.y
				level1_master.checkpoint_num = checkpoint_num
				start_ckpt_timer=0
				//player_obj.tail_planted = false
				//player_obj.tail_pulling = true
				ckpt_place_toggle = false
				
			}
		}*/
	
//	if in_camera_range(checkpoint_manager.checkpoint.x,checkpoint_manager.checkpoint.y)
	if point_distance(x,y,checkpoint_manager.checkpoint.x,checkpoint_manager.checkpoint.y)<100
	&& !checkpoint_manager.checkpoint.setpoint {
		if keyboard_check_pressed(ord("E")) {
			
			//if !instance_place(x,y,checkpoint_manager.checkpoint).setpoint {
			checkpoint_particle_script(x,y,24)
			checkpoint_particle_script(checkpoint_manager.checkpoint.x,checkpoint_manager.checkpoint.y,8)
			instance_destroy(checkpoint_manager.checkpoint)
			level1_master.checkpoints[checkpoint_num] = 0
			checkpoint_num--
	
			level1_master.available_checkpoints++
			checkpoint_manager.checkpoint = level1_master.checkpoints[checkpoint_num-1]
	
			checkpoint_manager.rx = checkpoint_manager.checkpoint.x
			checkpoint_manager.ry = checkpoint_manager.checkpoint.y
			level1_master.checkpoint_num = checkpoint_num
			start_ckpt_timer=0
			//player_obj.tail_planted = false
			//player_obj.tail_pulling = true
			ckpt_place_toggle = false
			keyboard_clear(ord("E"))
			//}
		}
		
	} else {
		if keyboard_check_pressed(ord("E")) && level1_master.available_checkpoints>=1 && 
		grounded  {
			oog = instance_create_depth(x,y,0,checkpoint1)	
			hp=2
			checkpoint_particle_script(x,y,36)
			level1_master.checkpoints[checkpoint_num] = oog
			oog.number = checkpoint_num
			checkpoint_num++
			level1_master.available_checkpoints--
			level1_master.checkpoint_num = checkpoint_num
			start_ckpt_timer=0
			//player_obj.tail_planted = false
			//player_obj.tail_pulling = true
			ckpt_place_toggle = false
			keyboard_clear(ord("E"))
	
		}	
	}
	
}


if dmg_flashing {
	inv_timer += 1
	
	if inv_timer>inv_delay {
		sprite.visible = !sprite.visible
		inv_count+=1
		inv_timer=0
	}
	if inv_count>14 {
		inv_timer = 0
		inv_count = 0
		dmg_flashing = false	
		sprite.visible = true
	}
} 

//sdm("dmgflashing" + string(dmg_flashing))
//sdm("dmgstart" + string(damage_start))
if thin_floor_bool {
	if !position_meeting(x,y+33,thin_floor_obj) || keyboard_check_pressed(ord("S")) {
		thin_floor_bool = false	
	}
}

if (place_meeting(x,y+1,wall_obj) || place_meeting(x,y+1,black_wall_obj) || 
place_meeting(x,y+1,moving_platform_obj) || place_meeting(x,y+1,friendo2_obj) || 
place_meeting(x,y+1,break_wall_obj) || place_meeting(x,y+1,door_obj) ||
place_meeting(x,y+1,falling_rock_obj) || place_meeting(x,y+1,switch_wall_obj)
|| place_meeting(x,y+1,touch_die_block_obj) || place_meeting(x,y+1,sinking_platform_obj)
|| place_meeting(x,y+1,break_block_obj)
|| thin_floor_bool) 
	&& !zoom_timer_bool {
	grounded=true
} else {
	grounded=false
}

if place_meeting(x,y+1,nightdoor_obj)&& !zoom_timer_bool && sky_obj.day {
	grounded = true

}


if place_meeting(x,y+1,friendo2_obj) {
	x = x + instance_place(x,y+1,friendo2_obj).hspeed	
}

moving_platform_script(moving_platform_obj)
moving_platform_script(switch_wall_obj)
moving_platform_script(sinking_platform_obj)




if place_meeting(x+1,y,wall_obj) 
|| place_meeting(x+1,y,moving_platform_obj) 
|| place_meeting(x+1,y,falling_rock_obj)
|| place_meeting(x+1,y,black_wall_obj)
|| place_meeting(x+1,y,sinking_platform_obj)
|| place_meeting(x+1,y,switch_wall_obj) {
	on_wall_right = true
} else {
	on_wall_right = false	
}

if place_meeting(x-1,y,wall_obj) 
|| place_meeting(x-1,y,moving_platform_obj)
|| place_meeting(x-1,y,falling_rock_obj)
|| place_meeting(x-1,y,black_wall_obj)
|| place_meeting(x-1,y,sinking_platform_obj)
|| place_meeting(x-1,y,switch_wall_obj){
	on_wall_left = true
} else {
	on_wall_left = false	
}
if grounded && !zoom_timer_bool { h_decel = h_decel_g } else { h_decel = h_decel_a }

if !intro {
	if room!=hub {
		mouse_controller()
	}
	zooming()
	
	if !move_locked {
		
		movement()
		
	}
} else {
	player_obj.hspeed = 0
	player_obj.vspeed = 0

	player_obj.x = player_obj.xpreva
	player_obj.y = player_obj.ypreva

	
}

if !tail_planted && !tail_pulling && !held_position {
	tail_obj.moving_platform_bool = false	
}

if keyboard_check_pressed(ord("T")) {	
	//audio_stop_all()
	level1_master.get_deaths = true
	level1_master.death_num++
	with (checkpoint_manager.checkpoint) {
			savegame_script()	
		}
	if death {
		if room==subtemple02 {
			if instance_exists(big_boi_time) {
				big_boi_bool = big_boi_time.special_guy
			}
		}
		
	}
}
/*
if keyboard_check_pressed(ord("T")) {	
	audio_stop_all()
	checkpoint_manager.rx = checkpoint_manager.x
	checkpoint_manager.ry = checkpoint_manager.y
	room_restart()
}*/
	if stinky_check && grounded {
		if place_meeting(x,y+1,wall_obj) {
			if !place_meeting(x,y,grass_obj) {
				sir = instance_create_depth(x,y,250,grass_obj)
				sir.image_angle = 0
				temp = instance_place(x,y+1,wall_obj)
				with sir {
					while !place_meeting(x,y-1,other.temp) {
						y+=0.1
					}	
				}
			}
		}
	}	


camera()


if level1_master.map {
	if keyboard_check_pressed(vk_shift){ 
		view_visible[0] = false
		view_visible[1] = true
		with level1_master {
			for (i=0;i<num_fog;i++) {
				if instance_exists(fogs[i]) {
					fogs[i].image_alpha = 1
				}
			}
			for (i=0;i<num_roomfog;i++) {
				if instance_exists(roomfogs[i]) {
					roomfogs[i].image_alpha = 1
				}
			}
		}
		var checkpoints = array_create(instance_number(checkpoint1))
		var scale_con = (camera_get_view_width(view_camera[1]) * 0.00961538461)/200
		for (i = 0; i < instance_number(checkpoint1); i++) {
			checkpoints[i] = instance_find(checkpoint1,i)
			lol = instance_create_depth(checkpoints[i].x,checkpoints[i].y,-700,checkpoint_marker_obj)
			if !checkpoints[i].setpoint {
				lol.sprite_index = current_ckpt_marker
			}
			lol.image_xscale = scale_con
			lol.image_yscale = scale_con
		}
		hello = instance_create_depth(player_obj.x,player_obj.y,-700,checkpoint_marker_obj)
		hello.sprite_index = player_marker
		hello.image_xscale = scale_con
		hello.image_yscale = scale_con
		
	
		//view_set_camera(view_camera[1],view_get_camera(view_camera[1]))
	} 
	if keyboard_check(vk_shift) {
		hello.x = player_obj.x
		hello.y = player_obj.y
	}
	if keyboard_check_released(vk_shift) {
		view_visible[0] = true
		view_visible[1] = false
		with level1_master {
			for (i=0;i<num_fog;i++) {
				if instance_exists(fogs[i]) {
					fogs[i].image_alpha = 0
				}
			}
			for (i=0;i<num_roomfog;i++) {
				if instance_exists(roomfogs[i]) {
					roomfogs[i].image_alpha = 0
				}
			}
		}
		//view_set_camera(view_camera[0],view_get_camera(view_camera[0]))
	}
}


if line_go>0 {
	line_go--	
}

if place_meeting(x,y,moving_platform_obj) && !zoom_timer_bool {
	default_collision(moving_platform_obj)
}

if place_meeting(x,y,switch_wall_obj) && !zoom_timer_bool {
	default_collision(switch_wall_obj)
}
//if place_meeting(x,y,sinking_platform_obj) && !zoom_timer_bool{default_collision(sinking_platform_obj)}
if place_meeting(x,y,stinky_pile_obj) {
	ok = instance_place(x,y,stinky_pile_obj)
	if ok.lit {
		stinky_check = true
	}
} else {
	
	if tail_obj.stinky && tail_carry {
		stinky_check = true	
	}
	if tail_throwing {
		stinky_check = false	
	}
	with tail_obj {
		
		if collision_line(other.tail_dest_x,other.tail_dest_y,other.x,other.y,stinky_pile_obj,false,true)
		&& place_meeting(x,y,stinky_pile_obj)
		&& instance_place(x,y,stinky_pile_obj).lit {
			stinky = true
		}
		if other.tail_pulling && !collision_line(other.tail_dest_x,other.tail_dest_y,other.x,other.y,stinky_pile_obj,false,true) {
			
			other.stinky_check = false
		}
		
		
	}
}

if hit_pause>0 {
	hit_pause--
	x = xpreva
	y = ypreva
} else {
	hit_pause = 0	
}

current_platform = instance_place(x,y+1,wall_obj)

//sdm(string(zoom_timer_bool)+" :    " + string(speed))

xpreva = x
ypreva = y

//sdm(point_distance(player_obj.x,player_obj.y,player_obj.tail_dest_x,player_obj.tail_dest_y))
//sdm(player_obj.bounce_buff_timer)

//sdm("THROWING: " + string(tail_throwing))
//sdm("PLANTED:  " + string(tail_planted))
//sdm("ZOOMING:  " + string(tail_zooming))
//sdm("PULLING:  " + string(tail_pulling))
/*
sdm("TAIL PULLING:  " + string(tail_pulling))
sdm("TAIL THROWING: " + string(tail_throwing))
sdm("TAIL PLANTED:  " + string(tail_planted))
sdm("TAIL CARRYING: " + string(tail_carry))
sdm("TAIL ZOOMING:  " + string(tail_zooming))
sdm("TAIL HELD:     " + string(tail_held))

//sdm(zoom_timer)

