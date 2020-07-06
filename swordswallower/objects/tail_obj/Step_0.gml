/// @description Insert description here
// You can write your code in this editor
if pickup_timer>0 {
	pickup_timer--
}
if player_obj.tail_carry {
	if player_obj.held_position {
		visible = true
		x = held_pos_x
		y = held_pos_y
		image_angle = held_pos_ang
		hspeed=0
		vspeed=0
	} else {
		
		visible = false 	
		x = player_obj.x
		y = player_obj.y
	
		player_obj.tail_planted=false
		player_obj.tail_pulling=false
		pull_timer = 0
		inside_flier = false
		player_obj.zoom_out_of_wall_timer = 0
		if player_obj.held_bounce_timer<=0 {
			//player_obj.bounced = true
		}
		mask_index= noone
		hspeed = 0
		vspeed = 0
		planted_wall = false	
		player_obj.boosting_collision_check = false
		player_obj.bounce_buff_timer = 0
		player_obj.check_zoom_collision = false
	
		player_obj.gem_active = false
		player_obj.gem_thrown = false
		
		charger_bool = false
	
	}
	
	
} else {
	visible = true
}

floor_particle_script()	

if abs(player_obj.camx+960-x)>710 ||
abs(player_obj.camy+540-y)>430 {
	outside = true
	player_obj.gem_active = false
	player_obj.gem_thrown = false
} else {
	outside = false	
}


if (player_obj.tail_pulling && !player_obj.held_position) {
	moving_platform_bool = false
}
	
if player_obj.tail_pulling {
	pull_timer++
	
	move_towards_point(player_obj.x,player_obj.y,pspeed+player_obj.speed/1.5)
	throwxs = hspeed
	throwys = vspeed
	
	if (distance_to_object(player_obj)<20 && pull_timer>pull_wall_t) {
		player_obj.tail_pulling=false
		player_obj.tail_carry=true
		player_obj.fire_active = false
		visible = false
		pull_timer = 0
		
		
		
		if stinky && stinky_when_thrown {
			player_obj.stinky_check = false
			//stinky = false
		}
		if stinky && !stinky_when_thrown {
			player_obj.stinky_check = true
			//stinky = false
		}
		//stinky_when_thrown = false
		player_obj.jump_able = true
		
		audio_play_sound(grab1,0,false)
	}
	planted=false
	player_obj.tail_planted=false
	throw_timer=0
	
	if player_obj.zoom_timer_bool {
		player_obj.zoom_timer_bool = false
		reset_intangibility()
	}
	
	if pull_timer<=1 {
		held_image_angle = image_angle	
		if place_meeting(x,y,crab_obj) {
			audio_play_sound(Knife_Pull_140,0,false)	
		}
	}
	
	if floor(pull_timer)==floor(pull_wall_t) && !inside_flier {
		held_image_angle = image_angle	
		//audio_manager(gsound.s_sword_whoosh,0,true,0)	
		
	}	
	
	if pull_timer<=pull_wall_t {
		hspeed=0
		vspeed=0
		move_towards_point(player_obj.x,player_obj.y,pspeed/15)
		
		//held_image_angle = lerp(held_image_angle,point_direction(x,y,player_obj.x,player_obj.y)-90,0.1)
		image_angle = held_image_angle + random_range(-(5+pull_timer),5+pull_timer)
		//if player_obj.zoom_timer_bool {
		//	pull_timer=pull_wall_t+1	
		//}
	} else {
		if player_obj.fire_active {
			sprite_index = sword_whirling
			//sprite_index = sword_whirlingfire
			image_speed = 3	
		} else {
			sprite_index = sword_whirling
			mask_index = sword_whirling
			image_speed = 3		
		}
	}
	//sdm(pull_timer)
	
}

if player_obj.tail_throwing {
	throw_timer++
	throw_count++
	if throw_timer<=1 {
		move_towards_point(player_obj.tail_dest_x,player_obj.tail_dest_y,tspeed)
		throwxs=hspeed
		throwys=vspeed
	} 
	hspeed = throwxs
	vspeed = throwys
	
	thrown_ang = ang
	
} 



if player_obj.tail_throwing {
	
	if player_obj.fire_active {
		sprite_index = sword_whirling
	//	sprite_index = sword_whirlingfire
		image_speed = 3	
	} else {
		sprite_index = sword_whirling
		mask_index = sword_whirling
		image_speed = 3		
	}
	
	
	
} else if !player_obj.tail_pulling {
	
	//audio_manager(gsound.s_sword_whoosh,0,false,1)
	audio_emitter_gain(s_whoosh_emitter,0)
	
	if player_obj.fire_active {
		sprite_index = sword5
		//sprite_index = swordfire
	} else {
		sprite_index = sword5		
		mask_index = sword
	}
} 

if player_obj.tail_held {
	
	if mouse_check_button_pressed(mb_left) {
		wiggle_timer = 10	
		held_image_angle = image_angle
	}
	if wiggle_timer>0 {
		wiggle_timer--	
		image_angle = held_image_angle + random_range(-7.5,7.5)
	}
	player_obj.tail_dest_x = x
	player_obj.tail_dest_y = y
	
	
}

if player_obj.tail_planted {
	throw_timer=0
	throw_count=0
	if pickup_timer>0 {
		pickup_timer--	
		if mouse_check_button(mb_left) {
			pickup_timer=10	
		}
	}
	if !planted_wall {
		if place_meeting(x,y,wall_obj) {
			planted_wall = instance_place(x,y,wall_obj)
		}
		if place_meeting(x,y,voidwall_obj) {
			planted_wall = instance_place(x,y,voidwall_obj)
		}
	}
	if player_obj.gem_thrown {
		player_obj.gem_active = false	
		player_obj.gem_thrown = false	
	}
	//player_obj.tail_dest_x = x
	//player_obj.tail_dest_y = y
	if abs(player_obj.camx+960-x)>1500 ||
	abs(player_obj.camy+540-y)>900 && !player_obj.intro {
		
		player_obj.tail_planted = false
		player_obj.tail_pulling = true
		
	}
	if speed>0 {
		
		hspeed = insert_hs/15
		vspeed = insert_vs/15
		
		insert_hs = hspeed
		insert_vs = vspeed
		
		if speed<1 {
			insert_hs = 0
			insert_vs = 0
		}
		
	}
	
	
	//sdm("ZOOM BOOL: " + string(player_obj.zoom_timer_bool))
	//sdm("INSIDE FLIER: " + string(inside_flier))
	//sdm("PLACE MEETING: " + string(place_meeting(x,y,wall_obj)))
	//
	//sdm(point_distance(player_obj.x,player_obj.y,player_obj.tail_dest_x,player_obj.tail_dest_y))
	//sdm(point_distance(player_obj.x,player_obj.y,player_obj.tail_dest_x,player_obj.tail_dest_y))
	//sdm(point_distance(player_obj.x,player_obj.y,player_obj.tail_dest_x,player_obj.tail_dest_y))
	if point_distance(player_obj.x,player_obj.y,player_obj.tail_dest_x,player_obj.tail_dest_y)<player_obj.speed+1
	&& (player_obj.zoom_timer_bool || player_obj.bounce_buff_timer>0)
	&& !inside_flier && instance_exists(current_wall)
	&& current_wall.object_index!=door_obj{
		//sdm("a")
		reset_intangibility()
		player_obj.c_slingtimer = 2.5
		if !current_wall.intangible {
			//sdm("help")
			fucking_wall_thing()
	//	sdm("c")
		} else if !collision_line(player_obj.tail_dest_x,player_obj.tail_dest_y,player_obj.x,player_obj.y,wall_obj,false,true){
			//sdm("d")
			fucking_wall_thing()
			
		} else if point_distance(player_obj.xpreva,player_obj.ypreva,player_obj.tail_dest_x,player_obj.tail_dest_y)<point_distance(player_obj.x,player_obj.y,player_obj.tail_dest_x,player_obj.tail_dest_y) {
			//sdm("e")
			fucking_wall_thing()
		}
	
	} else if point_distance(player_obj.x,player_obj.y,player_obj.tail_dest_x,player_obj.tail_dest_y)<165 
	&& !inside_flier && current_obj!=dash_guy_obj  && current_wall.object_index!=door_obj
	&& current_wall.object_index!=circle_friend_obj && !player_obj.zoom_timer_bool && pickup_timer<1 && !player_obj.intro
	{ //sdm(" b")
		player_obj.tail_planted = false
		player_obj.tail_pulling = true
		
		//if !player_obj.grounded {
		//	player_obj.vspeed*=0.6
		//	player_obj.held_release_timer = 10
		//}
		/*
		if current_wall.object_index==impale_circle_obj {
			player_obj.hspeed*=0.8
			player_obj.vspeed*=0.8
		} else {
		
			player_obj.hspeed*=1
			player_obj.vspeed*=1
		}*/
		
	}
	
	//sword_particle()
	
} else {
	
	if throw_timer>4 {
		current_wall = false
		current_obj = false
	}
	sword_particle_spawn = 30
}


if player_obj.fire_active {
	fire_particles(fire_particle_obj)
} else if stinky {
	fire_particles(stinky_particle_obj)
} else {
	fire_timer = 0
}

if current_wall==moving_platform_obj {
			
		
		
	//default_collision_nospeed(moving_platform_obj)
		
		
			
			
	
}

if moving_platform_bool {
	if current_wall.sword_present {
		x = current_wall.x + current_wall.swordx
		y = current_wall.y + current_wall.swordy
	}
	/*
	if place_meeting(x,y,wall_obj) || place_meeting(x,y,black_wall_obj) {
		//platform_movingout = true
		hspeed = current_wall.hspeed*10
		vspeed = current_wall.vspeed*10
		if place_meeting(x,y,wall_obj) {
			default_collision(wall_obj)
		} else {
			default_collision(black_wall_obj)
		}
		hspeed = 0
		vspeed = 0
		current_wall.swordx = x-current_wall.x
		current_wall.swordy = y-current_wall.y
		if tail_obj.current_wall.vertical {
			player_hitbox_check_obj.y = y
			tail_dest_x = player_hitbox_check_obj.x
			tail_dest_y = player_hitbox_check_obj.y
		} else {
			player_hitbox_check_obj.x = x
			tail_dest_x = player_hitbox_check_obj.x
			tail_dest_y = player_hitbox_check_obj.y
		}
		
	} else {
		//platform_movingout = false
	}*/
	
}

if player_obj.tail_throwing || player_obj.tail_pulling {
	var cx = player_obj.camx + player_obj.cam_width_h
	var cy = player_obj.camy + player_obj.cam_height_h
	
	
	audio_emitter_position(s_whoosh_emitter,
	mean(cx,cx,cx,cx,cx,cx,tail_obj.x),
	mean(cy,cy,cy,cy,cy,cy,tail_obj.y),
		//mean(cx,cx,cx,cx,2*cx-tail_obj.x),//cx + (tail_obj.x-cx)),
		//mean(cy,cy,cy,cy,2*cy-tail_obj.y),//,cy + (tail_obj.y-cy))
	0)
	
	
	audio_emitter_gain(s_whoosh_emitter,1)
} else {
	audio_emitter_gain(s_whoosh_emitter,0)
}

if player_obj.tail_throwing && !in_camera_range_bigger(x,y) {
	
	player_obj.tail_throwing = false
	player_obj.tail_planted = false
	player_obj.tail_pulling = true

	
} else {
	if player_obj.tail_throwing {
		mask_index=sword_whirling
		if player_obj.gem_active {
			if throw_timer<3 {
				//if place_meeting(x+hspeed,y+vspeed,wall_obj) {
				if collision_line(player_hitbox_check_obj.x,player_hitbox_check_obj.y,player_hitbox_check_obj.x+hspeed,player_hitbox_check_obj.y+vspeed,current_wall,false,true) {
					//x = x+hspeed/4
					//y = y+vspeed/4
					//collision_iterate_wall(wall_obj)
					
					collision_iterate_wall(wall_obj)
					player_obj.tail_throwing = false
					player_obj.tail_planted = true
					
				} else {
					x = player_hitbox_check_obj.x
					y = player_hitbox_check_obj.y
					throw_timer=3
				}
			} else {
				collision_iterate_wall(wall_obj)	
			}
			
		} else {
			collision_iterate_wall(wall_obj)	
			//collision_iterate_wall(voidwall_obj)
		}
		
		//collision_iterate_wall(passwall_obj)
		collision_iterate_wall(illusion_wall_obj)
		collision_iterate_wall(break_wall_obj)
		collision_iterate_wall(door_obj)
		collision_iterate_wall(close_wall_obj)
		//collision_iterate_wall(fatfly_spawner_left_obj)
		//collision_iterate_wall(fatfly_spawner_right_obj)
		//collision_iterate_wall(fatfly_destroyer)
		temptemptemp = true
		ccatemp = cca
		cca = 0
		if place_meeting(x,y,impale_circle_moving_obj) || place_meeting(xpreva,ypreva,impale_circle_moving_obj) {
			with player_obj {
				if place_meeting(x,y,instance_place(other.xpreva,other.ypreva,impale_circle_moving_obj)) && point_distance(x,y,other.x,other.y)<300 {
					other.temptemptemp = false
					
				} 
			}
		} else {
			if !temptemptemp {
				xpreva = x
				ypreva = y
				temptemptemp = true		
			}
			
		}
		if temptemptemp {
			
			collision_iterate_wall(impale_circle_moving_obj) 
		}
		
		temptemptemp = true
		if place_meeting(x,y,impale_circle_obj) || place_meeting(xpreva,ypreva,impale_circle_obj) {
			with player_obj {
				if place_meeting(x,y,instance_place(other.xpreva,other.ypreva,impale_circle_obj)) && point_distance(x,y,other.x,other.y)<300 {
					other.temptemptemp = false
					
				} 
			}
		} else {
			if !temptemptemp {
				xpreva = x
				ypreva = y
				temptemptemp = true		
			}
			
		}
		if temptemptemp {
			
			collision_iterate_wall(impale_circle_obj) 
		}
		temptemptemp = true
		if place_meeting(x,y,stinky_pile_obj) || place_meeting(xpreva,ypreva,stinky_pile_obj) {
			with player_obj {
				if place_meeting(x,y,instance_place(other.xpreva,other.ypreva,stinky_pile_obj)) && point_distance(x,y,other.x,other.y)<300 {
					other.temptemptemp = false
					
				}
			}
		} else {
			if !temptemptemp {
				xpreva = x
				ypreva = y
				temptemptemp = true		
			}
		}
		if temptemptemp {
			
			collision_iterate_wall(stinky_pile_obj)
		}
		temptemptemp = true
		if place_meeting(x,y,circle_friend_obj) || place_meeting(xpreva,ypreva,circle_friend_obj) {
			with player_obj {
				if place_meeting(x,y,instance_place(other.xpreva,other.ypreva,circle_friend_obj)) && point_distance(x,y,other.x,other.y)<300 {
					other.temptemptemp = false
					
				}
			}
		} else {
			if !temptemptemp {
				xpreva = x
				ypreva = y
				temptemptemp = true		
			}
		}
		if temptemptemp {
			
			collision_iterate_wall(circle_friend_obj)
		}
		cca = ccatemp
		
		collision_iterate_wall(wood_wall_obj)
		collision_iterate_wall(wood_wall2_obj)
		collision_iterate_wall(kill_back_wall_obj)
		collision_iterate_wall(black_wall_obj)
		collision_iterate_wall(moving_platform_obj)
		//collision_iterate_wall(mach_moving_wall_obj)
		//collision_iterate_wall(draft_obj)
		if !place_meeting(player_obj.x,player_obj.y,tar_obj) {
			collision_iterate_wall(tar_obj)
		}
		collision_iterate_wall(skiff_obj)
		collision_iterate_wall(switch_wall_obj)
		//collision_iterate_wall(double_switch_wall_obj)
		//collision_iterate_wall(skyswitcher_obj)
		//collision_iterate_wall(falling_rock_obj)
		//collision_iterate_wall(headtest_obj)
		collision_iterate_wall(touch_die_block_obj)
		//collision_iterate_wall(break_block_obj)
		//collision_iterate_wall(mach_hazard_obj)
		//collision_iterate_wall(mach_timed_hazard_obj)
		//collision_iterate_wall(mach_door_obj)
		collision_iterate_wall(key_door_obj)
		collision_iterate_wall(sinking_platform_obj)
		
		
		collision_iterate_enemy(snakehead_obj)
		collision_iterate_enemy(tear_nograv_obj)
		collision_iterate_enemy(thirsty_ghoul_obj)
		
		
		//collision_iterate_wall(spike)
		//if sky_obj.day {
		//	collision_iterate_wall(nightdoor_obj)
		//}
		
		
	}

	if player_obj.tail_throwing || player_obj.tail_pulling { 
		mask_index=sword_whirling_enemy
		collision_iterate_enemy(fatfly_obj)
		collision_iterate_enemy(flyswarm_obj)
		collision_iterate_enemy(hum_food_obj)
		collision_iterate_enemy(fatfly2_obj)
		collision_iterate_enemy(bombfly_diagonal_obj)
		collision_iterate_enemy(bombfly_fat_obj)
		//collision_iterate_enemy(crab_obj)
		collision_iterate_enemy(nucrab_obj)
		collision_iterate_enemy(handbug_obj)
		//collision_iterate_enemy(zombie_obj)
		//collision_iterate_enemy(kill_back_obj)
		//collision_iterate_enemy(golem_obj)
		//collision_iterate_enemy(diamond_obj)
		//collision_iterate_enemy(chair_obj)
		collision_iterate_wall(burn_wall_obj)
		collision_iterate_enemy(ghost_obj)
		collision_iterate_enemy(arcing_knight_obj)
		
		collision_iterate_wall(breakable_decoration_obj)
		//collision_iterate_wall(dec_skull_obj)
		
		//collision_iterate_enemy(wooden_fly_obj)
		//collision_iterate_enemy(wooden_fly_dart_obj)
		collision_iterate_enemy(eye_obj)
		//collision_iterate_enemy(green_guy_obj)
		//collision_iterate_enemy(spikyguy_obj)
		collision_iterate_enemy(dash_guy_obj)
		collision_iterate_enemy(snakeheart_obj)
		collision_iterate_enemy(fly_pod_obj)
		collision_iterate_enemy(crimson_soldier_obj)
		
		
		//collision_iterate_wall(switch_wall_switch_obj)
		
		if !player_obj.move_locked {
			collision_iterate_enemy(big_boi_obj)
			if !charger_bool {
				collision_iterate_enemy(charger_obj)
			}
		}
		collision_iterate_enemy(cryptkeeper_obj)
		collision_iterate_enemy(cryptkeeper_ceiling_obj)
		
		if player_obj.stinky_check || (tail_obj.stinky && !player_obj.tail_carry) {
			
		} else {
			//collision_iterate_enemy(fly_obj)
			collision_iterate_enemy(flyfree_obj)
			collision_iterate_enemy(doublefly_obj)
		}
		
		
		collision_iterate_wall(falling_rock_rope_obj)
		
		ccatemp = cca
		cca = 0
		if place_meeting(x,y,hummingbird_obj) {
			with player_obj {
				if place_meeting(x,y,hummingbird_obj) && point_distance(x,y,other.x,other.y)<150 {
					other.temptemptemp = false
					
				} 
			}
		} else {
			if !temptemptemp {
				xpreva = x
				ypreva = y
				temptemptemp = true		
			}
			
		}
		if temptemptemp {
			
			collision_iterate_wall(hummingbird_obj) 
		}
		cca = ccatemp
	}
}
if hitpause {
	hitpause_timer++
	hspeed=0
	vspeed=0
	if hitpause_timer>2 {
		hitpause_timer=0
		hitpause = false
	}
}
if current_obj = false {
	//if something goes seriously wrong with tail code
	//change this
	//current_obj = self	
}

if player_obj.death {
	audio_emitter_gain(s_whoosh_emitter,0)	
}

if player_obj.ending_lock {
	x=player_obj.x
	y=player_obj.y-45
}

xpreva = x
ypreva = y
lockcheck = false


//sdm("TAIL DEST  :   " + string(player_obj.tail_dest_x) + "   :   " + string(player_obj.tail_dest_y))
//sdm("TAIL POSI :   " + string(x) + "   :   " + string(y))

//sdm("H: " + string(hspeed))
//sdm("V: " + string(vspeed))

//sdm("THROW:" + string(throw_timer))
//sdm("X:   " + string(player_obj.tail_dest_x))
//sdm("Y:   " + string(player_obj.tail_dest_y))

//sdm("WINDING:  " + string(player_obj.winding))
//sdm("THROWING: " + string(player_obj.tail_throwing))
//sdm("PLANTED : " + string(player_obj.tail_planted))
//sdm("GROUNDED: " + string(player_obj.grounded))

//sdm("ZOOMING:  " + string(player_obj.tail_zooming))
//sdm("PLANTED:  " + string(planted))