/// @description Insert description here
// You can write your code in this editor
mask_index = player_idle
//dt = room_speed/fps
//dt = delta_time/(1/60 * 1000000)
//if sprite.sprite_index == player_crouching || sprite.sprite_index == player_crouching_s {
//	mask_index = player_crouching
//}
//sdm("fuck")
//with parallaxed_obj {
//	sdm("allo")
//	sdm(vBaseX)
//	sdm(y)
//}
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
	player_start_death()
}

//if ds_list_size(keylist)>0 {
//	for (i=0;i<ds_list_size(keylist);i++) {
//		keylist[| i].image_angle = 120 - i * 30	
//	}
//}
if death {
	move_locked = true
	tail_carry = true
	hsp = 0
	vsp = 0
	
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


//if thin_floor_bool {
//	if !position_meeting(x,y+48,thin_floor_obj) || k_down_p {
//		thin_floor_bool = false	
//	}
//}

if (wall_detect(x,y+1)) 
&& !zoom_timer_bool {	
	grounded=true
} else {
	grounded=false
}




zoom_hitbox_active = false
if zoom_timer_bool || grounded {
	out_of_dash_t = out_of_dash_m
} else {
	out_of_dash_t++
if out_of_dash_t>=out_of_dash_m {
	out_of_dash_t=out_of_dash_m
} else {
	if out_of_dash_t<20 {
		zoom_hitbox_active = true	
	}
}
	
}
if zoom_timer_bool || tail_zooming {
	zoom_hitbox_active = true	
}

if place_meeting(x,y+1,friendo2_obj) {
//x = x + instance_place(x,y+1,friendo2_obj).hsped	
}

if place_meeting(x+1,y,wall_parent_obj) {
	on_wall_right = true
} else {
	on_wall_right = false	
}

if place_meeting(x-1,y,wall_parent_obj) {
	on_wall_left = true
} else {
	on_wall_left = false	
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
	player_obj.hsp = 0
	player_obj.vsp = 0

	player_obj.x = player_obj.xpreva
	player_obj.y = player_obj.ypreva
}

if !tail_planted && !tail_pulling && !held_position {
	tail_obj.moving_platform_bool = false	
}

camera()

layer_px()

if start_death || death {
	return	
}



player_stinky_code()

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
if get_speed>0 {
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
hspreva = hsp
vspreva = vsp
if fps<50 {
	with blood_obj {
		instance_destroy()
	}
}
if ending_lock {
	x = tail_obj.current_obj.x + xvheld
	y = tail_obj.current_obj.y + yvheld
	
	x = clamp(x,skiff_obj.x-30,skiff_obj.x+30)
	y = skiff_obj.y+66
	
	x = skiff_obj.x+20
	
	tail_obj.x = x
	tail_obj.y = y
	
	hsp = held_start_hsp
	vsp = held_start_vsp
}


if keyboard_check_pressed(ord("T")) && !death && !ending_lock && !level1_master.in_void {
	start_death = true
	respawn_timer = 0
	
	player_obj.shake_d=9
	player_obj.camera_shake_d = true
}




if zoom_timer_bool {
	moveZoomX(hsp)
	moveZoomY(vsp)
	intangible = true
} else {
	moveX(hsp)
	moveY(vsp)
	intangible = false
}


enemy_collision()

if place_meeting(x,y,gem_obj) {
	fire_active = true	
}
if place_meeting(x,y,stinky_pile_obj) {
	if other.lit {
		stinky_check = true
	}	
}
if x>45000 {
	if impale_circle_obj.visible {
		with impale_circle_obj {
			visible = false
		}
	}
}
if level1_master.dev {


	if keyboard_check_pressed(ord("H")){
		wall_obj.visible = !wall_obj.visible
		black_wall_obj.visible = !black_wall_obj.visible
		//spike_obj.visible = !spike_obj.visible
		thin_floor_obj.visible = !thin_floor_obj.visible
	}
	if keyboard_check_pressed(ord("U")){
		x = mouse_x
		y = mouse_y
	}
	if keyboard_check_pressed(ord("Q")) {
		x = 25500
		y = 7000
		x = 31700
		y = 3400
		x = 36600
		y = 3000
		x = 47000
		y = 3000
		
		x = 38000
		y = 3000
		
		x = 65000
		y = 1000
		
		//x = 46600
		//y = 3000
		
		//x=38000
	}
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


//sdm("TAIL ZOOMING:  " + string(tail_zooming))
//sdm("TAIL HELD:     " + string(tail_held))

//sdm(zoom_timer)