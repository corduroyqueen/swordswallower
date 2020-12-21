/// @description Insert description here
// You can write your code in this editor
//dt = delta_time/(1/60 * 1000000)

if pickup_timer>0 {
	pickup_timer--
}
if nearby_swordgrab_buffer>0 {
	nearby_swordgrab_buffer--
}
if player_obj.tail_carry {
	
	if player_obj.held_position {
		visible = true
		x = player_obj.x-held_pos_x
		y = player_obj.y-held_pos_y
		
		image_angle = held_pos_ang
		hsp=0
		vsp=0
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
		hsp = 0
		vsp = 0
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
	


if player_obj.tail_throwing {
	throw_timer++
	throw_count++
	if throw_timer<=1 {
		//move_towards_point(player_obj.tail_dest_x,player_obj.tail_dest_y,tspeed)
		x = player_obj.x
		y = player_obj.y
		sp_towards_target(player_obj.tail_dest_x,player_obj.tail_dest_y,tspeed,1)
		throwxs=hsp
		throwys=vsp
	} 
	hsp = throwxs
	vsp = throwys
	
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
		sprite_index = newsword_center
		//sprite_index = swordfire
	} else {
		sprite_index = newsword_center		
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
	hilt_x = x+cos(degtorad(tail_obj.image_angle+270)) * 66
	hilt_y = y-sin(degtorad(tail_obj.image_angle+270)) * 66
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
		
		sword_pull_check()
		
	}
	if get_speed()>0 {
		
		hsp = insert_hs/15
		vsp = insert_vs/15
		
		insert_hs = hsp
		insert_vs = vsp
		
		if get_speed()<1 {
			insert_hs = 0
			insert_vs = 0
		}
		
	}
	
	if !instance_exists(current_obj) {
		player_obj.tail_planted = false	
		player_obj.tail_pulling = false	
	}
	//sdm("ok")
	//sdm("ZOOM BOOL: " + string(player_obj.zoom_timer_bool))
	//sdm("INSIDE FLIER: " + string(inside_flier))
	//sdm("PLACE MEETING: " + string(place_meeting(x,y,wall_obj)))
	//
	//sdm(point_distance(player_obj.x,player_obj.y,player_obj.tail_dest_x,player_obj.tail_dest_y))
	//sdm(point_distance(player_obj.x,player_obj.y,player_obj.tail_dest_x,player_obj.tail_dest_y))
	//sdm(point_distance(player_obj.x,player_obj.y,player_obj.tail_dest_x,player_obj.tail_dest_y))
	//sdm(point_distance(player_obj.x,player_obj.y,player_obj.tail_dest_x,player_obj.tail_dest_y))
	//sdm(get_player_speed()+1)
	//sdm("wut")
	//sdm(player_obj.zoom_timer_bool)
	if ((point_distance(player_obj.x,player_obj.y,player_obj.tail_dest_x,player_obj.tail_dest_y)<get_player_speed()+1) || nearby_swordgrab_buffer>0)
	&& (player_obj.zoom_timer_bool || player_obj.bounce_buff_timer>0)
	&& !inside_flier && instance_exists(current_obj)
	&& current_obj.object_index!=door_obj{
		//sdm("a")
		reset_intangibility()
		
		player_obj.c_slingtimer = 2.5
		if planted_rejecting {
			player_obj.zoom_timer_bool = false
			player_obj.zoom_timer = 0
			player_obj.bounced = false
			player_obj.zoom_ctdn = 0
			player_obj.held_position_ready = false
			held_release_timer = 0
			//sdm("ok")
			player_obj.hsp *= -3
			player_obj.vsp = -5
			player_obj.hsp = clamp(player_obj.hsp,-25,25)
			player_obj.vsp = clamp(player_obj.vsp,-25,25)
		} else if !collision_line(player_obj.tail_dest_x,player_obj.tail_dest_y,player_obj.x,player_obj.y,wall_obj,false,true){
			//sdm("d")
			fucking_wall_thing()
			
		} else if point_distance(player_obj.xpreva,player_obj.ypreva,player_obj.tail_dest_x,player_obj.tail_dest_y)<point_distance(player_obj.x,player_obj.y,player_obj.tail_dest_x,player_obj.tail_dest_y) {
			//sdm("e")
			fucking_wall_thing()
		}
	
	} else if point_distance(player_obj.x,player_obj.y,player_obj.tail_dest_x,player_obj.tail_dest_y)<165 
	&& !inside_flier && current_obj!=dash_guy_obj  && current_obj.object_index!=door_obj
	&& current_obj.object_index!=circle_friend_obj && !player_obj.zoom_timer_bool && pickup_timer<1 && !player_obj.intro
	{// sdm(" b")
		sword_pull_check()
		if !player_obj.grounded {
			player_obj.held_release_timer = 7
		}
		player_obj.hsp = lerp(player_obj.hsp,0,0.3)
		player_obj.vsp = lerp(player_obj.vsp,0,0.3)
		//if !player_obj.grounded {
		//	player_obj.vsp*=0.6
		//	player_obj.held_release_timer = 10
		//}
		/*
		if current_obj.object_index==impale_circle_obj {
			player_obj.hsp*=0.8
			player_obj.vsp*=0.8
		} else {
		
			player_obj.hsp*=1
			player_obj.vsp*=1
		}*/
		
	} else if point_distance(player_obj.x,player_obj.y,x,y)<30 && sqrt(sqr(player_obj.hsp) + sqr(player_obj.vsp))<1
	&& (player_obj.zoom_timer_bool || player_obj.bounce_buff_timer>0) {
		//sdm("dude")
		fucking_wall_thing()	
	}
	
	//sword_particle()
	
} else {
	
	if throw_timer>4 {
	}
	sword_particle_spawn = 30
}


if player_obj.tail_pulling {
	
	pull_timer++
	
	//move_towards_point(player_obj.x,player_obj.y,pspeed+player_obj.speed/1.5)
	sp_towards_target(player_obj.x,player_obj.y,pspeed+get_player_speed(),1)
	throwxs = hsp
	throwys = vsp
	
	if (distance_to_object(player_obj)<20) {
		player_obj.tail_pulling=false
		player_obj.tail_carry=true
		player_obj.fire_active = false
		visible = false
		pull_timer = 0
		
		
		if point_distance(player_obj.x,player_obj.y,player_hitbox_check_obj.x,player_hitbox_check_obj.y)>100 {
			var langg = point_direction(x,y,xpreva,ypreva)
			player_sprite_obj.sword_pos_x = player_obj.x + dcos(langg) * 200
			player_sprite_obj.sword_pos_y = player_obj.y - dsin(langg) * 200
			player_sprite_obj.sword_ang = point_direction(0,0,dcos(langg),-dsin(langg))-90
			player_sprite_obj.sword_recoil = true
			player_sprite_obj.sword_facing = sign(x-xpreva)
			if player_obj.grounded {
				player_obj.hsp += -dcos(langg) * 7 - sign(hsp) * 3
			}
		}
		//ui_manager.dbug_checkx = player_sprite_obj.sword_pos_x
		//ui_manager.dbug_checky = player_sprite_obj.sword_pos_y
		
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
		hsp=0
		vsp=0
		//move_towards_point(player_obj.x,player_obj.y,pspeed/15)
		
		//sp_towards_target(player_obj.x,player_obj.y,pspeed/15,1)
		
		//held_image_angle = lerp(held_image_angle,point_direction(x,y,player_obj.x,player_obj.y)-90,0.1)
		image_angle = held_image_angle + random_range(-(5+pull_timer),5+pull_timer)
		//held_image_angle = lerp(held_image_angle,point_direction(x,y,player_obj.x,player_obj.y)+90,0.1)
		//if player_obj.zoom_timer_bool {
		//	pull_timer=pull_wall_t+1	
		//}
		
		if (distance_to_object(player_obj)<66) {
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

if player_obj.fire_active {
	fire_particles(fire_particle_obj)
} else if stinky {
	fire_particles(stinky_particle_obj)
} else {
	fire_timer = 0
}
if instance_exists(current_obj) {
	//sdm("leeeeeeee")
	//sdmn()
	//sdm(current_obj)
	//sdm(current_obj.object_index)
	//sdm(object_get_name(current_obj))
	//sdm(object_get_name(current_obj.object_index))
}

if current_obj==moving_platform_obj {
			
		
		
	//default_collision_nospeed(moving_platform_obj)
		
		
			
			
	
}
image_xscale = 1
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
	if hsp!=0 {
		image_xscale = -sign(hsp)
	}
	if hsp>2 && vsp>2 && !hitpause {
		image_angle = point_direction(0,0,hsp,vsp)
	}
} else {
	
	audio_emitter_gain(s_whoosh_emitter,0)
}

xpreva = x
ypreva = y

if player_obj.tail_throwing && !in_camera_range_bigger(x,y) {
	player_obj.tail_throwing = false
	player_obj.tail_planted = false
	player_obj.tail_pulling = true
}
//sdm(hitpause)
if hitpause {
	sprite_index = newsword_center
	hitpause_timer++
	hsp=0
	vsp=0
	if hitpause_timer>2 {
		hitpause_timer=0
		hitpause = false
	}
}
temp_hs = hsp
temp_vs = vsp

mask_index=sword_whirling
if player_obj.tail_planted {
	//if instance_exists(current_obj) {
	//	moveX(round(current_obj.hsp))
	//	moveY(round(current_obj.vsp)) 
	//} else {
	//	current_obj = self	
	//}
	
	if !instance_exists(current_obj) {
		current_obj = noone	
	} else {
		
	}
	
	intangible = false	
} else if player_obj.tail_throwing {
	current_obj=noone
	
	moveSwordX(hsp)
	moveSwordY(vsp)
	if current_obj!=noone {
		sword_wall_collision(current_obj)	
		if point_distance(x,y,player_obj.x,player_obj.y)<200 {
			nearby_swordgrab_buffer = 10
			lpx = x
			lpy = y
		}
		
	}
	intangible = false
	
} else if player_obj.tail_pulling {
	moveZoomX(hsp)
	moveZoomY(vsp)	
	intangible = true
} else if player_obj.tail_carry {
	intangible = true
}
if instance_exists(current_obj) {
	//sdm(object_get_name(current_obj.object_index))
} else {
	//sdm("lelll")	
}
mask_index=sword_whirling_enemy

		
//if player_obj.tail_throwing {
//	sdm("throw")
//} else if player_obj.tail_pulling {
//	sdm("pull")
//} else {
//	sdm("neither")
//}
collision_iterate_enemy(enemy_parent_obj)

collision_iterate_wall(breakable_decoration_obj)

//collision_iterate_enemy(snakeheart_obj)

//if player_obj.tail_throwing {
//	collision_iterate_enemy(snakehead_obj)
//}	

		
//if !player_obj.move_locked {
//	if !charger_bool {
//		collision_iterate_enemy(charger_obj)
//	}
//}
//collision_iterate_enemy(cryptkeeper_obj)

		
//if player_obj.stinky_check || (tail_obj.stinky && !player_obj.tail_carry) {
			
//} else {
			
//	collision_iterate_enemy(flyfree_obj)
//	collision_iterate_enemy(doublefly_obj)
//}
		
		
		



if player_obj.death {
	audio_emitter_gain(s_whoosh_emitter,0)	
}

if player_obj.ending_lock {
	x=player_obj.x
	y=player_obj.y-45
}
if player_obj.out_of_dash_t<0 {
	visible = false	
}
mask_index = sword_whirling

lockcheck = false



//sdm("TAIL DEST  :   " + string(player_obj.tail_dest_x) + "   :   " + string(player_obj.tail_dest_y))
//sdm("TAIL POSI :   " + string(x) + "   :   " + string(y))

//sdm("H: " + string(hsp))
//sdm("V: " + string(vsp))

//sdm("THROW:" + string(throw_timer))
//sdm("X:   " + string(player_obj.tail_dest_x))
//sdm("Y:   " + string(player_obj.tail_dest_y))

//sdm("WINDING:  " + string(player_obj.winding))
//sdm("THROWING: " + string(player_obj.tail_throwing))
//sdm("PLANTED : " + string(player_obj.tail_planted))
//sdm("GROUNDED: " + string(player_obj.grounded))

//sdm("ZOOMING:  " + string(player_obj.tail_zooming))
//sdm("PLANTED:  " + string(planted))