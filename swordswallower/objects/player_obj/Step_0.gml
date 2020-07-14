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


if start_death && !death {
	//audio_stop_all()
	death = true
	sword_death_script()
	hspeed = 0
	vspeed = 0
	start_death = false
	duck_audio_script(0,2000)
	audio_play_sound(death_scream,0,false)
	
	audio_sound_gain(sword_thud_1,0.3,0)
	audio_sound_pitch(sword_thud_1,1)
	audio_play_sound(sword_thud_1,0,false)
	
	audio_sound_gain(sword_crunch_1,0.46,0)
	audio_sound_pitch(sword_crunch_1,1)
	audio_play_sound(sword_crunch_1,0,false)
	
	shockwave_shader.trigger = true
	shockwave_shader.strength_input = 0.2
	
	
	instance_deactivate_object(background)
	//layer_destroy(layertwo)
	
	
	//layerbk1 = layer_get_id("bkd")
	//layerbk2 = layer_get_id("bkd2")
	//layer_set_visible(layerbk1,false)
	//layer_set_visible(layerbk2,false)
	
	
	if room==subtemple01 {
		layerbk = layer_get_id("bkd_m")
		layer_set_visible(layerbk,false)
	
		layerbk = layer_get_id("p3bkd1")
		layer_set_visible(layerbk,false)
		layerbk = layer_get_id("p3bkd2")
		layer_set_visible(layerbk,false)
		layerbk = layer_get_id("p3bkd3")
		layer_set_visible(layerbk,false)
	
		layerbk = layer_get_id("bkd1p2")
		layer_set_visible(layerbk,false)
		layerbk = layer_get_id("bkdp22")
		layer_set_visible(layerbk,false)
		layerbk = layer_get_id("bkdp23")
		layer_set_visible(layerbk,false)
		layerbk = layer_get_id("Assets_3")
		layer_set_visible(layerbk,false)
	
		layerbk = layer_get_id("bkd")
		layer_set_visible(layerbk,false)
		layerbk = layer_get_id("bkd2")
		layer_set_visible(layerbk,false)
		layerbk = layer_get_id("bkd3")
		layer_set_visible(layerbk,false)
	
		px = layer_get_id("parallax")
		layer_set_visible(px,false)
	}
	
	audio_manager(false,0,false,3)
	just_blood_input(0,0,hspreva*0.2,vspreva* 0.25-10,200,false,sprite_width,sprite_height)
	sprite_index = sprite310
	shatter_script()
	sprite_index = -1
	
	
	
}

if death {
	move_locked = true
	tail_carry = true
	hspeed = 0
	vspeed = 0
	
	
	
} else {
	
	if k_fire && grounded && speed<5
	&& point_distance(player_obj.x,player_obj.y,tail_obj.x,tail_obj.y)<30
	&& ckpt_place_toggle{
		start_ckpt_timer++	
	} else {
		start_ckpt_timer = 0
	}
	
	if k_fire_r {
		ckpt_place_toggle = true	
	}
	/*
	if place_meeting(x,y,checkpoint_manager.checkpoint) {
		
		if keyoard_check_pressed(ord("E")) {
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
	/*if point_distance(x,y,checkpoint_manager.checkpoint.x,checkpoint_manager.checkpoint.y)<100
	&& !checkpoint_manager.checkpoint.setpoint {
		if keboard_check_pressed(vk_space) {
			
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
			kyboard_clear(vk_space) 
			//}
		}
		
	} else {
		if kyboard_check_pressed(vk_space) && level1_master.available_checkpoints>=1 && 
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
			kyboard_clear(vk_space)
	
		}	
	}*/
	if last_checkpoint == noone || !instance_exists(last_checkpoint)  {
		last_checkpoint  = lelckpt
	}
	if grounded && !place_meeting(x,y+2,black_wall_obj) && !ckpt_bool {
		
		if !place_meeting(x,y,checkpoint_manager.checkpoint) && !ckpt_bool {
			if gems>=1 && !ckpt_bool {
				if k_ckpt {
					ckpt_place_timer++	
					move_locked = true
					hspeed=0
				} else {
					ckpt_place_timer = 0
					move_locked = false
				}
				if ckpt_place_timer>ckpt_place_timer_m {
					ckpt_place_timer=0
					ckpt_bool = true
					last_checkpoint = checkpoint_manager.checkpoint
					oog = instance_create_depth(x,y,0,checkpoint1)	
					hp=2
					checkpoint_particle_script(x,y,36)
					
					level1_master.checkpoints[checkpoint_num] = oog
					oog.number = checkpoint_num
					checkpoint_num++
					//level1_master.available_checkpoints--
					level1_master.checkpoint_num = checkpoint_num
					start_ckpt_timer=0
					//player_obj.tail_planted = false
					//player_obj.tail_pulling = true
					ckpt_place_toggle = false
					keyboard_clear(vk_space)	
					gems-=1
		
					with oog {
						player_obj.hp = 2
						checkpoint_particle_script(x,y,24)
			
						if checkpoint_manager.checkpoint != self || starting_bool {
							audio_sound_gain(fire_sound,audio_sound_get_gain(firecrackle1),0)
							audio_play_sound(firelit1,0,false)	
							audio_play_sound(Ice_Projectile_Shoot_03,0,false)
							starting_bool = false
						}
						savegame_script()
	
						ready = false
					}
				}
			}
		} else if !checkpoint_manager.checkpoint.setpoint && !ckpt_bool {
			if k_ckpt {
				ckpt_place_timer++	
				move_locked = true
				hspeed=0
			} else {
				ckpt_place_timer = 0	
				move_locked = false
			}
			if ckpt_place_timer>60 {
				ckpt_place_timer=0
				ckpt_bool = true
				instance_destroy(checkpoint_manager.checkpoint)
				level1_master.checkpoints[checkpoint_num] = 0
				checkpoint_num--
				gems+=1
				//level1_master.available_checkpoints++
				//checkpoint_manager.checkpoint = level1_master.checkpoints[checkpoint_num-1]
				
				if last_checkpoint == noone || !instance_exists(last_checkpoint)  {
					last_checkpoint  = lelckpt
				}
				checkpoint_manager.checkpoint = last_checkpoint
				checkpoint_manager.rx = checkpoint_manager.checkpoint.x
				checkpoint_manager.ry = checkpoint_manager.checkpoint.y
				level1_master.checkpoint_num = checkpoint_num
				//start_ckpt_timer=0
				//player_obj.tail_planted = false
				//player_obj.tail_pulling = true
				//ckpt_place_toggle = false
			}
		}
	} else {
		ckpt_place_timer = 0	
		if ckpt_bool && !k_ckpt {
		
			ckpt_bool = false	
			ckpt_place_timer=0
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
	if !position_meeting(x,y+48,thin_floor_obj) || k_down_p {
		thin_floor_bool = false	
	}
}

if (place_meeting(x,y+1,wall_obj) || place_meeting(x,y+1,black_wall_obj) || 
place_meeting(x,y+1,burn_wall_obj) || place_meeting(x,y+1,illusion_wall_obj) || 
place_meeting(x,y+1,moving_platform_obj) || place_meeting(x,y+1,friendo2_obj) || 
place_meeting(x,y+1,break_wall_obj) || place_meeting(x,y+1,door_obj) ||
place_meeting(x,y+1,falling_rock_obj) || place_meeting(x,y+1,switch_wall_obj)
|| place_meeting(x,y+1,touch_die_block_obj) || place_meeting(x,y+1,sinking_platform_obj)
|| place_meeting(x,y+1,break_block_obj) || place_meeting(x,y+1,close_wall_obj)
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
if grounded && !zoom_timer_bool { 
	h_decel = h_decel_g 
	
} else { 
	h_decel = h_decel_a 
}

if !intro && !death {
	if !ending_lock && !mapout {
		if room!=hub  {
			mouse_controller()
		}
	
		if !intro {
			zooming()
		}
	
		if !move_locked && !intro {
		
			movement()
		
		}
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


/*
if keboard_check_pressed(ord("T")) {	

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
	if k_map_p && !death{ 
		hspeed=0
		vspeed=0
		view_visible[0] = false
		view_visible[1] = true
		if room==subtemple01 {
			if y>1100 {
				camera_set_view_pos(view_camera[1],12000,13000)
			} else {
				camera_set_view_pos(view_camera[1],22000,1500)	
			}
		}
		
		
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
				//lol.sprite_index = current_ckpt_marker
			}
			lol.image_xscale = scale_con * 10
			lol.image_yscale = scale_con * 10
			lol.yeet = 1
			if checkpoints[i]==checkpoint_manager.checkpoint {
				lol.yeet = 0	
			} 
		}
		hello = instance_create_depth(player_obj.x,player_obj.y,-700,checkpoint_marker_obj)
		hello.sprite_index = swordicon
		hello.image_xscale = scale_con*8.5
		hello.image_yscale = scale_con*8.5
		hello.yeet = 2
		
	
		//view_set_camera(view_camera[1],view_get_camera(view_camera[1]))
	} 
	if k_map && !death {
		hello.x = player_obj.x
		hello.y = player_obj.y
	}
	if k_map_r || death {
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

if view_visible[1] {
	mapout = true	
} else {
	mapout = false	
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
if place_meeting(x,y,dc_water_obj) { 
	stinky_check = true
}
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
		//stinky_check = false	
	}
	with tail_obj {
		
		if collision_line(other.tail_dest_x,other.tail_dest_y,other.x,other.y,stinky_pile_obj,false,true)
		&& place_meeting(x,y,stinky_pile_obj)
		&& instance_place(x,y,stinky_pile_obj).lit {
			stinky = true
		}
		//if other.tail_pulling && !collision_line(other.tail_dest_x,other.tail_dest_y,other.x,other.y,stinky_pile_obj,false,true) {
			
		//	other.stinky_check = false
		//}
		
		
	}
}
if tail_carry {
	wall_kicked = false	
}
if hit_pause>0 {
	hit_pause--
	x = xpreva
	y = ypreva
} else {
	hit_pause = 0	
}

current_platform = instance_place(x,y+1,wall_obj)
if !instance_exists(current_platform) {
	current_platform = instance_place(x,y+1,black_wall_obj)	
}

//sdm(string(zoom_timer_bool)+" :    " + string(speed))

//sdm("ok")
//sdm(ds_list_size(keys))
if speed>0 {
	prev_pos_t++
	if prev_pos_t>5 {
		xpreva2 = xpreva1
		ypreva2 = ypreva1
		xpreva1 = xpreva
		ypreva1 = ypreva
		prev_pos_t = 0
	}
}

xpreva = x
ypreva = y
hspreva = hspeed
vspreva = vspeed

if ending_lock {
	x = tail_obj.current_wall.x + xvheld
	y = tail_obj.current_wall.y + yvheld
	
	x = clamp(x,skiff_obj.x-30,skiff_obj.x+30)
	y = skiff_obj.y+64
	
	tail_obj.x = x
	tail_obj.y = y
	
	hspeed = held_start_hspeed
	vspeed = held_start_vspeed
}


if keyboard_check_pressed(ord("T")) && !death && !ending_lock {
	start_death = true
	respawn_timer = 0
	
	player_obj.shake_d=9
	player_obj.camera_shake_d = true
	
	//level1_master.death_num+=25
	
	
}

if level1_master.dev {


	//if keyboard_check_pressed(ord("H")){
	//	wall_obj.visible = !wall_obj.visible
	//	black_wall_obj.visible = !black_wall_obj.visible
	//	spike.visible = !spike.visible
	//	thin_floor_obj.visible = !thin_floor_obj.visible
	//}
	if keyboard_check_pressed(ord("U")){
		//x = 20680
		//x=2500
		//y=2500
		//x=44703
		//y = 10000
	}

}

if view_visible[1] {
	hspeed=0	
}

//sdm(point_direction(x,y,tail_dest_x,tail_dest_y))

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


("TAIL ZOOMING:  " + string(tail_zooming))
sdm("TAIL HELD:     " + string(tail_held))

//sdm(zoom_timer)

